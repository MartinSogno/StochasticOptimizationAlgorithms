clear all;

%Parameters
POPULATION_SIZE = 100;
NUMBER_OF_GENES = 50;
CROSSOVER_PROBABILITY = 0.8;
MUTATION_PROBABILITIES = [0 0.02 0.05 0.1];
TOURNAMENT_SELECTION_PARAMETER = 0.75;
TOURNAMENT_SIZE = 2;
NUMBER_OF_VARIABLES = 2;
VARIABLE_RANGE = 10.0;
NUMBER_GENERATIONS = 100;
NUMBER_OF_RUNS = 10;

medianFitness = [];

for iMutationProbability = 1:4
    finalFitness = [];
    mutationProbability = MUTATION_PROBABILITIES(iMutationProbability);
    for iRun = 1:NUMBER_OF_RUNS
        
        fitness = zeros(POPULATION_SIZE, 1);
        population = InitializePopulation(POPULATION_SIZE, NUMBER_OF_GENES);
        
        for iGeneration = 1:NUMBER_GENERATIONS

            %Gets the best individual of the generation
            maximumFitness = 0.0;
            xBest = zeros(1,2);
            bestIndividualIndex = 0;
            for i = 1:POPULATION_SIZE
                chromosome = population(i,:);
                x = DecodeChromosome(chromosome, NUMBER_OF_VARIABLES, VARIABLE_RANGE);
                decodedPopulation(i,:) = x;
                fitness(i) = EvaluateIndividual(x);
                if (fitness(i) > maximumFitness)
                    maximumFitness = fitness(i);
                    bestIndividualIndex = i;
                    xBest = x;
                end
            end

            tempPopulation = population;

            for i = 1:2:POPULATION_SIZE
                %Selection via Tournament
                i1 = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);
                i2 = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);
                chromosome1 = population(i1,:);
                chromosome2 = population(i2,:);

                %Apply crossover with crossover probability
                r = rand;
                if (r < CROSSOVER_PROBABILITY)
                    newChromosomePair = Cross(chromosome1, chromosome2);
                    tempPopulation(i,:) = newChromosomePair(1,:);
                    tempPopulation(i+1,:) = newChromosomePair(2,:);
                else
                    tempPopulation(i,:) = chromosome1;
                    tempPopulation(i+1,:) = chromosome2;
                end
            end

            %Apply mutation
            for i = 1:POPULATION_SIZE
                originalChromosome = tempPopulation(i,:);
                mutatedChromosome = Mutate(originalChromosome, mutationProbability);
                tempPopulation(i,:) = mutatedChromosome;
            end

            %Keep the best individual
            population = InsertBestIndividuals(tempPopulation,population(bestIndividualIndex,:),1);
        end

        finalFitness = [finalFitness,maximumFitness];
    end
    
    medianFitness = [medianFitness, median(finalFitness)];
end

format shortG;
medianFitness