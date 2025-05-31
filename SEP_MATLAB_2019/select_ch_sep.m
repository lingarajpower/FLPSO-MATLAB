function [nodes, CH_ids] = select_ch_sep(nodes, p, a, m, roundNum)
    n = length(nodes);
    CH_ids = [];

    for i = 1:n
        if strcmp(nodes(i).type, 'advanced')
            prob = (p * (1 + a)) / (1 + a * m);
        else
            prob = p / (1 + a * m);
        end

        threshold = prob / (1 - prob * mod(roundNum, round(1/prob)));

        if rand < threshold
            nodes(i).CH = true;
            CH_ids(end + 1) = i;
        else
            nodes(i).CH = false;
        end
    end
end
