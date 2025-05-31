function [nodes, CN_id, REST, NEXT] = eldc_chief_node_selection(nodes, REST, NEXT, roundNum)
    % Select CN with highest residual energy in top layer
    topLayer = max([nodes.layer]);
    candidates = find([nodes.layer] == topLayer & [nodes.E] > 0);
    [~, idx] = max([nodes(candidates).E]);
    CN_id = candidates(idx);

    % Simulate REST/NEXT memory queue logic
    REST = NEXT;
    NEXT = [];

    % Put low-energy neighbors into REST, high-energy into NEXT
    avgE = mean([nodes.E]);
    for i = 1:length(nodes)
        if nodes(i).E < avgE * 0.5
            REST(end + 1) = i;
        elseif nodes(i).E > avgE
            NEXT(end + 1) = i;
        end
    end
end
