function mutatedChromosome = Mutate(chromosome, mutationProbability)
%operates a mutation with mutationProbability

    nGenes = size(chromosome,2);
    mutatedChromosome = chromosome;
    
    for j = 1:nGenes
        r = rand;
        if (r < mutationProbability)
            i = 1 + fix(rand*nGenes);
            tmpVariable = mutatedChromosome(i);
            mutatedChromosome(i) = mutatedChromosome(j);
            mutatedChromosome(j) = tmpVariable;
        end
    end
    
end