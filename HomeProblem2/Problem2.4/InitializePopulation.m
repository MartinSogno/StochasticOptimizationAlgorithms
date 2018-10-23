function population = InitializePopulation(populationSize,minChromosomeLength...
  ,maxChromosomeLength, numberOperations, N, M)

    population = [];
    for i = 1:populationSize
        chromosomeLength = minChromosomeLength + fix(rand*(maxChromosomeLength-minChromosomeLength+1));
        chromosomeLength = 4*floor(chromosomeLength/4); %make the length a multiple of 4
        tmpChromosome = zeros(1,chromosomeLength);

        for j = 1:4:chromosomeLength 
            tmpChromosome(j) = 1+floor(rand*numberOperations);
            tmpChromosome(j+1) = 1+floor(rand*N); 
            tmpChromosome(j+2) = 1+floor(rand*(M+N)); 
            tmpChromosome(j+3) = 1+floor(rand*(M+N));
        end

        tmpIndividual = struct('Chromosome',tmpChromosome);
        population = [population tmpIndividual];
    end
end