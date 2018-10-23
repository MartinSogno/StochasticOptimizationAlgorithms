function node = GetNewNode(tabooList, pheromoneLevel, visibility, alpha, beta)

    nodeNumber = size(pheromoneLevel,2);
    currentNode = tabooList(end);
    nodeProbabilities = zeros(1,nodeNumber);
    node = 0;
    
    for iNode = 1:nodeNumber
        if ismember(iNode,tabooList)
            nodeProbabilities(iNode) = 0;
        else
            nodeProbabilities(iNode) = pheromoneLevel(iNode,currentNode)^alpha * visibility(iNode,currentNode)^beta;
        end
    end
    normalizedNodeProbabilities = nodeProbabilities/sum(nodeProbabilities);
    cumulatedNodeProbabilities = cumsum(normalizedNodeProbabilities);
    
    r = rand;
    iNode = 1;
    while node == 0
        if cumulatedNodeProbabilities(iNode)>=r
        	node = iNode;
        end
        iNode = iNode+1;
    end
    
end