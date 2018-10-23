function fitness = EvaluateIndividual(chromosome, functionData, N, ...
    constant_register, maximumChromosomeLength, C_MAX)

    chromosomeLength = size(chromosome,2);
    nbPoints = size(functionData,1);
    error = 0;
    
    for iPoint = 1:nbPoints
        x = functionData(iPoint,1);
        y = functionData(iPoint,2);
        yHat = ExecuteChromosome(chromosome, x, N, constant_register, C_MAX);
        errorSample = y-yHat;
        if errorSample == errorSample %avoid NaN values
            error = error + errorSample^2;
        else
            error = error + C_MAX; %if Nan Value, we assume the error to be really big
        end
    end
    
    error = error/nbPoints;
    error = sqrt(error);
    
    %Penalize too long chromosomes
    if chromosomeLength > maximumChromosomeLength
        error = error * chromosomeLength/maximumChromosomeLength;
    end
    
    fitness = 1/(1/C_MAX + error); %avoid division by zero in case of perfect matching
    
end