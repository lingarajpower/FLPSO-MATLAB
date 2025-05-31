function nodes = deploy_nodes(n, fieldSize, Einit)
    for i = 1:n
        nodes(i).id = i;
        nodes(i).x = rand * fieldSize;
        nodes(i).y = rand * fieldSize;
        nodes(i).E = Einit;
        nodes(i).type = 'normal';  % Later override some to 'advanced'
    end
    % Assign 10% advanced nodes
    advCount = round(0.1 * n);
    idx = randperm(n, advCount);
    for i = idx
        nodes(i).E = Einit * 2;
        nodes(i).type = 'advanced';
    end
end
