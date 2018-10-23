function pathLength = GetPathLength(path,cityLocation)

    nbNodes = size(path,2);
    firstCity = path(1);
    lastCity = path(nbNodes);
    
    pathLength = norm(cityLocation(firstCity,:) - cityLocation(lastCity,:));
    for i = 2:nbNodes
        fromNode = path(i-1);
        toNode = path(i);
        pathLength = pathLength + norm(cityLocation(fromNode,:) - cityLocation(toNode,:));
    end
    
end