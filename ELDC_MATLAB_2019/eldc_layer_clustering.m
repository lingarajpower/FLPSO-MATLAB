function nodes = eldc_layer_clustering(nodes, numLayers)
    fieldSize = 100;
    layerHeight = fieldSize / numLayers;
    for i = 1:length(nodes)
        nodes(i).layer = ceil(nodes(i).y / layerHeight);
    end
end
