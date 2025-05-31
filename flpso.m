function flpso()
    %% Problem Definition
    dim = 2;
    nParticles = 30;
    maxIter = 100;
    lb = -10;
    ub = 10;
    
    %% Initialize Particles
    x = lb + (ub - lb) * rand(nParticles, dim);
    v = zeros(nParticles, dim);
    pbest = x;
    pbest_val = arrayfun(@(i) objFun(x(i,:)), 1:nParticles)';
    [~, gbest_idx] = min(pbest_val);
    gbest = pbest(gbest_idx, :);
    
    %% Main Loop
    for iter = 1:maxIter
        for i = 1:nParticles
            % Fuzzy Inertia and Acceleration
            [w, c1, c2] = fuzzyController(iter, maxIter);
            
            r1 = rand(1, dim);
            r2 = rand(1, dim);
            
            v(i,:) = w*v(i,:) + c1*r1.*(pbest(i,:) - x(i,:)) + c2*r2.*(gbest - x(i,:));
            x(i,:) = x(i,:) + v(i,:);
            
            % Apply bounds
            x(i,:) = max(min(x(i,:), ub), lb);
            
            % Evaluate
            fval = objFun(x(i,:));
            if fval < pbest_val(i)
                pbest(i,:) = x(i,:);
                pbest_val(i) = fval;
                
                if fval < objFun(gbest)
                    gbest = x(i,:);
                end
            end
        end
        disp(['Iter ' num2str(iter) ': Best Val = ' num2str(objFun(gbest))]);
    end
    
    disp(['Best Solution Found: ' num2str(gbest)]);
end

function f = objFun(x)
    % Sphere function
    f = sum(x.^2);
end

function [w, c1, c2] = fuzzyController(iter, maxIter)
    % Simple fuzzy logic-like control based on iteration
    progress = iter / maxIter;
    
    % Assume:
    % - High inertia at beginning, low at end
    % - Low acceleration at beginning, high at end
    w = 0.9 - 0.5 * progress;     % w in [0.9, 0.4]
    c1 = 2.5 - 1.5 * progress;    % c1 in [2.5, 1]
    c2 = 0.5 + 1.5 * progress;    % c2 in [0.5, 2]
end

