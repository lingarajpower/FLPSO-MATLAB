function nodes = deploy_sep_nodes(n, area, Eo, a, m)
    for i = 1:n
        nodes(i).id = i;
        nodes(i).x = rand * area;
        nodes(i).y = rand * area;
        if rand < m
            nodes(i).type = 'advanced';
            nodes(i).E = Eo * (1 + a);
        else
            nodes(i).type = 'normal';
            nodes(i).E = Eo;
        end
        nodes(i).CH = false;
    end
end
