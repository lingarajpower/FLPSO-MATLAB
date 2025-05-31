clc; clear;

n = 100;               % Number of nodes
fieldSize = 100;
Eo = 0.5;              % Initial energy
rounds = 200;

% Deploy nodes
nodes = deploy_eldc_nodes(n, fieldSize, Eo);

% Layered clustering
nodes = eldc_layer_clustering(nodes, 3);

% Initialize queues
REST = [];
NEXT = [];

% Simulation loop
for r = 1:rounds
    disp(['Round ' num2str(r)]);

    % Chief Node selection
    [nodes, CN_id, REST, NEXT] = eldc_chief_node_selection(nodes, REST, NEXT, r);

    % Simulate transmission with duty cycling
    [nodes, metrics(r)] = eldc_simulate_round(nodes, CN_id, fieldSize);
end

evaluate_eldc_metrics(metrics);
