function population = InitializePopulation(populationSize, nCities)
%initialize randomly a population

    population = zeros(populationSize, nCities);
    for i = 1:populationSize
        population(i,:) = randperm(nCities);
    end
    
end