function population = InitializePopulation(populationSize, nGenes)
%initialize randomly a population

    population = rand(populationSize, nGenes)>0.5;
    
end