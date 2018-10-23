clear all;

%Parameters
POPULATION_SIZE = 4000;
CITY_LOCATIONS = LoadCityLocations();
NUMBER_OF_CITIES = size(CITY_LOCATIONS,1);
MUTATION_PROBABILITY = 0.02;
TOURNAMENT_SELECTION_PARAMETER = 0.9;
TOURNAMENT_SIZE = 3;
NUMBER_GENERATIONS = 2000;
NUMBER_BEST_INDIVIDUALS = 2;

tspFigure = InitializeTspPlot(CITY_LOCATIONS,[0 20 0 20]); 
connection = InitializeConnections(CITY_LOCATIONS);
        
fitness = zeros(POPULATION_SIZE, 1);
population = InitializePopulation(POPULATION_SIZE, NUMBER_OF_CITIES);
maximumFitness = 0.0;

for iGeneration = 1:NUMBER_GENERATIONS

    %Gets the best individual of the generation
    xBest = [];
    bestIndividualIndex = 1;
    for i = 1:POPULATION_SIZE
        chromosome = population(i,:);
        fitness(i) = EvaluateIndividual(chromosome,CITY_LOCATIONS);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
            xBest = chromosome;
            PlotPath(connection,CITY_LOCATIONS,chromosome);
            disp('bestLength');
            disp(1/maximumFitness);
        end
    end

    tempPopulation = population;

    for i = 1:POPULATION_SIZE
        %Selection via Tournament
        iSelected = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);
        tempPopulation(i,:) = population(iSelected,:);
    end

    %Apply mutation
    for i = 1:POPULATION_SIZE
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome, MUTATION_PROBABILITY);
        tempPopulation(i,:) = mutatedChromosome;
    end

    %Keep the best individual
    population = InsertBestIndividuals(tempPopulation,population(bestIndividualIndex,:),NUMBER_BEST_INDIVIDUALS);
end

%Print final result
format shortG;
disp('bestLength');
disp(1/maximumFitness);
disp('BestChromosome');
disp(population(1,:));