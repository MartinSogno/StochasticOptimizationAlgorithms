clear all;
format shortG;

%Parameters
POPULATION_SIZE = 500;
TOURNAMENT_SELECTION_PARAMETER = 0.75;
TOURNAMENT_SIZE = 3;
NUMBER_OF_HIDDEN_UNITS = 8;
NUMBER_OF_INPUT_WEIGHTS = 4*NUMBER_OF_HIDDEN_UNITS;
NUMBER_OF_OUTPUT_WEIGHTS = 2*(NUMBER_OF_HIDDEN_UNITS+1);
NUMBER_OF_WEIGHTS = NUMBER_OF_INPUT_WEIGHTS + NUMBER_OF_OUTPUT_WEIGHTS;
NUMBER_OF_GENES = 10*NUMBER_OF_WEIGHTS;
CROSSOVER_PROBABILITY = 0.7;
MUTATION_PROBABILITY = 1/NUMBER_OF_GENES;
VARIABLE_RANGE = 5;
NUMBER_GENERATIONS = 200;
SLOPE_LENGHT = 1000;
SLOPES_PER_DATASET = [10,5,5];
SHOW = false;

population = InitializePopulation(POPULATION_SIZE, NUMBER_OF_GENES);

validationFitness = zeros(1,5);
trainingFitness = zeros(POPULATION_SIZE,10);
fitness = zeros(POPULATION_SIZE, 1);

%remember the best values of each generation, to plot in the end
generationalTrainingFitness = zeros(NUMBER_GENERATIONS, 1);
generationalValidationFitness = zeros(NUMBER_GENERATIONS, 1);

for iGeneration = 1:NUMBER_GENERATIONS

    %Gets the best individual of the generation
    maximumFitness = 0.0;
    bestTrainingChromosome = 0;
    bestIndividualIndex = 0;
    for iChr = 1:POPULATION_SIZE
        chromosome = population(iChr,:);
        [inputWeights,outputWeights] = DecodeChromosome(chromosome, NUMBER_OF_HIDDEN_UNITS, VARIABLE_RANGE);
        
        for iSlope = 1:SLOPES_PER_DATASET(1)
            alpha = GetSlopeAngle(1:SLOPE_LENGHT,iSlope,1); %Training slopes
            trainingFitness(iChr,iSlope) = EvaluateIndividual...
                (inputWeights,outputWeights,alpha,SHOW);
        end
        fitness(iChr) = mean(trainingFitness(iChr,:)); %average performance on training set
        
        if (fitness(iChr) > maximumFitness) %check if it is the best fitness, update in this case
            maximumFitness = fitness(iChr);
            bestIndividualIndex = iChr;
            bestTrainingChromosome = chromosome;
        end
    end

    tempPopulation = population;

    for iChr = 1:2:POPULATION_SIZE
        %Selection via Tournament
        i1 = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);
        i2 = TournamentSelect(fitness, TOURNAMENT_SELECTION_PARAMETER, TOURNAMENT_SIZE);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);

        %Apply crossover with crossover probability
        r = rand;
        if (r < CROSSOVER_PROBABILITY) %Crossover
            newChromosomePair = Cross(chromosome1, chromosome2);
            tempPopulation(iChr,:) = newChromosomePair(1,:);
            tempPopulation(iChr+1,:) = newChromosomePair(2,:);
        else %No crossover
            tempPopulation(iChr,:) = chromosome1;
            tempPopulation(iChr+1,:) = chromosome2;
        end
    end

    %Apply mutation
    for iChr = 1:POPULATION_SIZE
        originalChromosome = tempPopulation(iChr,:);
        mutatedChromosome = Mutate(originalChromosome, MUTATION_PROBABILITY);
        tempPopulation(iChr,:) = mutatedChromosome;
    end

    %Keep the best individual
    population = InsertBestIndividuals(tempPopulation,population(bestIndividualIndex,:),1);
    
    %Computes the score of the best chromosome on validation set
    [inputWeights,outputWeights] = DecodeChromosome(bestTrainingChromosome, NUMBER_OF_HIDDEN_UNITS, VARIABLE_RANGE);
    for iSlope = 1:5
        alpha = GetSlopeAngle(1:SLOPE_LENGHT,iSlope,2); %Validation values
        validationFitness(iSlope) = EvaluateIndividual...
            (inputWeights,outputWeights,alpha, SHOW);
    end
    %Keep track of the best performing chromosome on validation data
    if mean(validationFitness) > max(generationalValidationFitness)
        bestValidationChromosome = bestTrainingChromosome;
    end
    
    generationalValidationFitness(iGeneration) = mean(validationFitness);
    generationalTrainingFitness(iGeneration) = maximumFitness;
end

%Print final result
disp('maximumFitness');
disp(maximumFitness);
disp('bestValidationChromosome');
disp(bestValidationChromosome);

plot(1:NUMBER_GENERATIONS,generationalTrainingFitness)
hold on
plot(1:NUMBER_GENERATIONS,generationalValidationFitness)