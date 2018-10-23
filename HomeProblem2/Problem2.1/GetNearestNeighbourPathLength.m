function pathLength = GetNearestNeighbourPathLength(cityLocation)
    
    numberOfCities = size(cityLocation,1);
    listOfRemainingCities = 1:numberOfCities;
    pathLength = 0;
    firstCity = 1+floor(rand*numberOfCities);
    currentCity = firstCity;
    listOfRemainingCities = listOfRemainingCities(listOfRemainingCities ~= currentCity);
    
    for iCityVisited = 1:numberOfCities-1
        minimumDistance = inf;
        closestCity = 0;
        for iNewCity = listOfRemainingCities
            if norm(cityLocation(currentCity,:) - cityLocation(iNewCity,:)) < minimumDistance
                closestCity = iNewCity;
                minimumDistance = norm(cityLocation(currentCity,:) - cityLocation(iNewCity,:));
            end
        end
        currentCity = closestCity;
        listOfRemainingCities = listOfRemainingCities(listOfRemainingCities ~= currentCity);
        pathLength = pathLength + minimumDistance;
    end
    pathLength = pathLength + norm(cityLocation(currentCity,:) - cityLocation(firstCity,:)); %Get back to the start city
end