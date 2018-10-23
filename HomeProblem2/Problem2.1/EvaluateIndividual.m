function fitness = EvaluateIndividual(x,cityLocations)
    
    nbCities = size(x,2);
    totalDistance = norm(cityLocations(x(1),:) - cityLocations(x(nbCities),:));
    
    for i = 2:nbCities
        fromCity = x(i-1);
        toCity = x(i);
        totalDistance = totalDistance + norm(cityLocations(fromCity,:) - cityLocations(toCity,:));
    end
    
    fitness = 1/totalDistance;
    
end