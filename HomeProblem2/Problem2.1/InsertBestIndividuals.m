function new_population = InsertBestIndividuals(population, bestIndividual, n_c)
%apply elitism by replacing the n_c first chromosomes by the best of
%previous generation

    for i = 1:n_c
        population(i,:) = bestIndividual;
    end
    new_population = population; 

end