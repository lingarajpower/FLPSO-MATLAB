function [swarm, gBest] = initialize_particles(n, dim, lb, ub)
    for i = 1:n
        swarm(i).pos = lb + (ub-lb)*rand(1, dim);
        swarm(i).vel = zeros(1, dim);
        swarm(i).pBest = swarm(i).pos;
        swarm(i).fitness = objective_function(swarm(i).pos);
        swarm(i).pBestFitness = swarm(i).fitness;
    end

    [~, idx] = min([swarm.fitness]);
    gBest.pos = swarm(idx).pos;
    gBest.fitness = swarm(idx).fitness;
end
