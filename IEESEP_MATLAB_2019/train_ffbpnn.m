function model = train_ffbpnn(nodes)
    % Inputs: [Energy, x, y]
    X = [[nodes.E]' [nodes.x]' [nodes.y]'];
    % Output: 1 if high potential CH, 0 otherwise
    Y = double([nodes.E]' > median([nodes.E]));
    
    net = feedforwardnet(10);
    net.trainParam.epochs = 1000;
    net = train(net, X', Y');
    
    model = net;
end
