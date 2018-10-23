function [newIndividual1, newIndividual2] = Cross(chromosome1,chromosome2)
    % makes a crossover between the two chromosomes
    
    nOperation1 = size(chromosome1, 2)/4;
    nOperation2 = size(chromosome2, 2)/4;
    
    crossoverPoint11 = 1 + floor(rand*(nOperation1));
    crossoverPoint12 = 1 + floor(rand*(nOperation1));
    crossoverPoint21 = 1 + floor(rand*(nOperation2));
    crossoverPoint22 = 1 + floor(rand*(nOperation2));
    
    crossoverStartPoint1 = min(crossoverPoint11,crossoverPoint12);
    crossoverEndPoint1 = max(crossoverPoint11,crossoverPoint12);
    crossoverStartPoint2 = min(crossoverPoint21,crossoverPoint22);
    crossoverEndPoint2 = max(crossoverPoint21,crossoverPoint22);
   
    newChromosome1 = [chromosome1(1:4*crossoverStartPoint1),...
        chromosome2(4*crossoverStartPoint2+1:4*crossoverEndPoint2),...
        chromosome1(4*crossoverEndPoint1+1:end)];
    newIndividual1 = struct('Chromosome',newChromosome1);

    newChromosome2 = [chromosome2(1:4*crossoverStartPoint2),...
        chromosome1(4*crossoverStartPoint1+1:4*crossoverEndPoint1),...
        chromosome2(4*crossoverEndPoint2+1:end)];
    newIndividual2 = struct('Chromosome',newChromosome2);
end