function [swarm, gBest] = update_particles(swarm, gBest, w, c1, c2, lb, ub)
    for i = 1:length(swarm)
        r1 = rand(1, length(swarm(i).pos));
        r2 = rand(1, length(swarm(i).pos));

        swarm(i).vel = w * swarm(i).vel + ...
                       c1 * r1 .* (swarm(i).pBest - swarm(i).pos) + ...
                       c2 * r2 .* (gBest.pos - swarm(i).pos);
        swarm(i).pos = swarm(i).pos + swarm(i).vel;

        % Clamp to bounds
        swarm(i).pos = min(max(swarm(i).pos, lb), ub);

        swarm(i).fitness = objective_function(swarm(i).pos);

        if swarm(i).fitness < swarm(i).pBestFitness
            swarm(i).pBest = swarm(i).pos;
            swarm(i).pBestFitness = swarm(i).fitness;
        end

        if swarm(i).fitness < gBest.fitness
            gBest.pos = swarm(i).pos;
            gBest.fitness = swarm(i).fitness;
        end
    end
end
