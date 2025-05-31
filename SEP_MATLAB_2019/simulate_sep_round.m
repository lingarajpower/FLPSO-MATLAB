function [nodes, metrics] = simulate_sep_round(nodes, CH_ids, area)
    % Energy Model
    Eelec = 50e-9;
    Efs = 10e-12;
    Emp = 0.0013e-12;
    d0 = sqrt(Efs / Emp);
    packetSize = 4000;
    sink = [area/2, area/2];

    alive = 0;
    energy = 0;
    
    for i = 1:length(nodes)
        if nodes(i).E > 0
            alive = alive + 1;
            if nodes(i).CH
                d = norm([nodes(i).x nodes(i).y] - sink);
                if d < d0
                    Etx = packetSize * (Eelec + Efs * d^2);
                else
                    Etx = packetSize * (Eelec + Emp * d^4);
                end
                nodes(i).E = nodes(i).E - Etx;
            else
                if ~isempty(CH_ids)
                    ch = CH_ids(randi(length(CH_ids)));
                    d = norm([nodes(i).x nodes(i).y] - [nodes(ch).x nodes(ch).y]);
                    if d < d0
                        Etx = packetSize * (Eelec + Efs * d^2);
                    else
                        Etx = packetSize * (Eelec + Emp * d^4);
                    end
                    Erx = packetSize * Eelec;
                    nodes(i).E = nodes(i).E - Etx;
                    nodes(ch).E = nodes(ch).E - Erx;
                end
            end
            energy = energy + nodes(i).E;
        end
    end

    metrics.energy = energy;
    metrics.alive = alive;
end
