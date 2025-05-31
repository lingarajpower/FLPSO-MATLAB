function [nodes, metrics] = simulate_transmission(nodes, chs)
    % Basic energy dissipation model
    Etx = 50e-9; Efs = 10e-12;
    do = sqrt(10e-12 / 0.0013); % threshold distance
    fieldCenter = [50, 50];
    
    metrics.packets = 0;
    metrics.energy = 0;
    
    for i = 1:length(nodes)
        if ismember(i, chs)
            d = norm([nodes(i).x nodes(i).y] - fieldCenter);
            if d > do
                E = Etx + 0.0013 * d^4;
            else
                E = Etx + Efs * d^2;
            end
            nodes(i).E = nodes(i).E - E;
        else
            ch = chs(randi(length(chs)));
            d = norm([nodes(i).x nodes(i).y] - [nodes(ch).x nodes(ch).y]);
            E = Etx + Efs * d^2;
            nodes(i).E = nodes(i).E - E;
        end
    end
end
