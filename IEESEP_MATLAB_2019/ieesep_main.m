clc; clear;

% Parameters
nNodes = 100;
fieldSize = 100;
initialEnergy = 0.5;
rounds = 100;

% Deploy nodes
nodes = deploy_nodes(nNodes, fieldSize, initialEnergy);

% Train FFBPNN model
model = train_ffbpnn(nodes);

% Simulation loop
for r = 1:rounds
    disp(['Round ' num2str(r)]);
    
    % CH selection
    chs = ieesep_ch_selection(nodes, model);
    
    % Simulate data transmission
    [nodes, metrics(r)] = simulate_transmission(nodes, chs);
end

% Evaluate performance
evaluate_metrics(metrics);
