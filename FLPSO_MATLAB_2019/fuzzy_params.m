function [w, c1, c2] = fuzzy_params(iter, maxIter)
    progress = iter / maxIter;
    w = 0.9 - 0.5 * progress;        % [0.9, 0.4]
    c1 = 2.5 - 1.5 * progress;       % [2.5, 1]
    c2 = 0.5 + 1.5 * progress;       % [0.5, 2]
end
