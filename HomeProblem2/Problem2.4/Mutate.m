function mutatedIndividual = Mutate(chromosome, mutationProbability, M, N, numberOperations)
%operates a mutation with mutationProbability

    nGenes = size(chromosome,2);
    mutatedChromosome = chromosome;
    
    for j = 1:nGenes
        r = rand;
        if (r < mutationProbability)
            if mod(j,4)==1
                mutatedChromosome(j) = floor(1+numberOperations*rand);
                
            elseif mod(j,4)==2
                mutatedChromosome(j) = floor(1+N*rand);
            
            else
                mutatedChromosome(j) = floor(1+(M+N)*rand);
            end                
        end
    end
    mutatedIndividual = struct('Chromosome', mutatedChromosome);
    
end