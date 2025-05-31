clc; clear;

% Parameters
n = 100;            % number of nodes
area = 100;         % area dimensions
Eo = 0.5;           % initial energy
p = 0.1;            % optimal probability of CH
a = 1;              % energy factor (advanced nodes have E = Eo*(1+a))
m = 0.1;            % fraction of advanced nodes
rounds = 200;

% Deploy nodes
nodes = deploy_sep_nodes(n, area, Eo, a, m);

% Simulation
for r = 1:rounds
    disp(['Round ' num2str(r)]);
    
    % Select CHs
    [nodes, CH_ids] = select_ch_sep(nodes, p, a, m, r);
    
    % Simulate round
    [nodes, metrics(r)] = simulate_sep_round(nodes, CH_ids, area);
end

% Plot metrics
evaluate_sep_metrics(metrics);
