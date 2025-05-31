clc; clear;

nParticles = 30;
dim = 2;
maxIter = 100;
lb = -10;
ub = 10;

% Initialize swarm
[swarm, gBest] = initialize_particles(nParticles, dim, lb, ub);

% Optimization loop
for iter = 1:maxIter
    [w, c1, c2] = fuzzy_params(iter, maxIter);

    [swarm, gBest] = update_particles(swarm, gBest, w, c1, c2, lb, ub);

    bestFitness(iter) = gBest.fitness;
    disp(['Iter ' num2str(iter) ' Best = ' num2str(gBest.fitness)]);
end

plot_results(bestFitness);
