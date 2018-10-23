clear all;

%Parameters
FUNCTION_DATA = LoadFunctionData;
NUMBER_BEST_INDIVIDUALS = 3;
POPULATION_SIZE = 500;
NUMBER_GENERATIONS = 5000;
MINIMUM_CHROMOSOME_LENGTH = 40;
MAXIMUM_CHROMOSOME_LENGTH = 120;
CROSSOVER_PROBABILITY = 0.8;
MUTATION_PROBABILITY = 0.01;
TOURNAMENT_SELECTION_PARAMETER = 0.8;
TOURNAMENT_SIZE = 3;
C_MAX = 10^9;
CONSTANT_REGISTER = 1;
M = size(CONSTANT_REGISTER,2);
N = 3;
NUMBER_OPERATIONS = 4;
        
fitness = zeros(POPULATION_SIZE, 1);
population = InitializePopulation(POPULATION_SIZE,MINIMUM_CHROMOSOME_LENGTH,...
    MAXIMUM_CHROMOSOME_LENGTH, NUMBER_OPERATIONS, N, M);

for iGeneration = 1:NUMBER_GENERATIONS
    %Gets the best individual of the generation
    maximumFitness = 0.0;
    bestIndividualIndex = 0;
    for i = 1:POPULATION_SIZE
        
        chromosome = population(i).Chromosome;
        fitness(i) = EvaluateIndividual(chromosome,FUNCTION_DATA, N, ...
            CONSTANT_REGISTER, MAXIMUM_CHROMOSOME_LENGTH, C_MAX);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
            bestChromosome = chromosome;
        end
    end

    tempPopulation = population;

    for i = 1:2:POPULATION_SIZE
        %Selection via Tournament
        i1 = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);
        i2 = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);
        chromosome1 = population(i1).Chromosome;
        chromosome2 = population(i2).Chromosome;

        %Apply crossover with crossover probability
        r = rand;
        if (r < CROSSOVER_PROBABILITY)
            [newIndividual1,newIndividual2] = Cross(chromosome1, chromosome2);
            tempPopulation(i) = newIndividual1;
            tempPopulation(i+1) = newIndividual2;
        else
            tempPopulation(i).Chromosome = chromosome1;
            tempPopulation(i+1).Chromosome = chromosome2;
        end
    end

    %Apply mutation
    for i = 1:POPULATION_SIZE
        originalChromosome = tempPopulation(i).Chromosome;
        mutatedChromosome = Mutate(originalChromosome, MUTATION_PROBABILITY, M, N, NUMBER_OPERATIONS);
        tempPopulation(i) = mutatedChromosome;
    end

    %Keep the best individual
    population = InsertBestIndividuals(tempPopulation,population(bestIndividualIndex),NUMBER_BEST_INDIVIDUALS);
end

%Print final result
format shortG;
disp('maximumFitness');
disp(maximumFitness);
disp('bestChromosome');
disp(bestChromosome);