function nodes = deploy_eldc_nodes(n, fieldSize, Eo)
    for i = 1:n
        nodes(i).id = i;
        nodes(i).x = rand * fieldSize;
        nodes(i).y = rand * fieldSize;
        nodes(i).E = Eo;
        nodes(i).layer = 0;
    end
end
