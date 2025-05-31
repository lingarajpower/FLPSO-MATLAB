function [nodes, metrics] = eldc_simulate_round(nodes, CN_id, fieldSize)
    % Energy model
    Etx = 50e-9; Efs = 10e-12; Emp = 0.0013e-12;
    d0 = sqrt(Efs / Emp);
    packetSize = 4000;
    sink = [fieldSize/2, fieldSize/2];

    energy = 0; alive = 0;
    for i = 1:length(nodes)
        if nodes(i).E <= 0
            continue;
        end
        alive = alive + 1;
        if i == CN_id
            d = norm([nodes(i).x nodes(i).y] - sink);
        else
            d = norm([nodes(i).x nodes(i).y] - [nodes(CN_id).x nodes(CN_id).y]);
        end
        if d < d0
            Et = Etx + Efs * d^2;
        else
            Et = Etx + Emp * d^4;
        end
        nodes(i).E = nodes(i).E - packetSize * Et;
        energy = energy + nodes(i).E;
    end

    metrics.energy = energy;
    metrics.alive = alive;
end
