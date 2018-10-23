function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

    numberOfNodes = size(pheromoneLevel,1);
    currentNode = 1+fix(rand*numberOfNodes);
    path = currentNode * ones(1,numberOfNodes);
    tabooList = currentNode;
    
    for iNodeVisited = 2:numberOfNodes
        currentNode =  GetNewNode(tabooList, pheromoneLevel, visibility, alpha, beta);
        path(iNodeVisited) = currentNode;
        tabooList = [tabooList,currentNode];
    end
    
end