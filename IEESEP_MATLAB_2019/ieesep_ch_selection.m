function chs = ieesep_ch_selection(nodes, model)
    X = [[nodes.E]' [nodes.x]' [nodes.y]'];
    output = model(X');
    chs = find(output > 0.5); % Threshold output
end
