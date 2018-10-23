function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
   
    nbNodes = size(pathCollection,2);
    nbAnts = size(pathCollection,1);
    deltaPheromoneLevel = zeros(nbNodes);
    
    for iAnt = 1:nbAnts
        for iNode = 1:nbNodes-1
            fromNode = pathCollection(iAnt,iNode);
            toNode = pathCollection(iAnt,iNode+1);
            deltaPheromoneLevel(fromNode,toNode) = deltaPheromoneLevel(fromNode,toNode) + 1/pathLengthCollection(iAnt);
        end
        fromNode = pathCollection(iAnt,nbNodes);
        toNode = pathCollection(iAnt,1);
        deltaPheromoneLevel(nbNodes,toNode) = deltaPheromoneLevel(fromNode,toNode) + 1/pathLengthCollection(iAnt);
    end
    
end