function [inputWeights,outputWeights] = DecodeChromosome(chromosome, numberOfHiddenUnits, variableRange)
    %gets the values of different variables from the binary encoding
    numberOfInputWeights = 4*numberOfHiddenUnits;
    numberOfOutputWeights = 2*(numberOfHiddenUnits+1);
    numberOfWeights = numberOfInputWeights + numberOfOutputWeights;
    chromosomeLength = size(chromosome,2);
    k = fix(chromosomeLength/numberOfWeights);
    weights = zeros(1,numberOfWeights);
    
    for i = 1:numberOfWeights
        w_i = 0.0;
        for j = 1:k
            w_i = w_i + chromosome(k*(i-1)+j)*2^(-j);
        end
        weights(i) = -variableRange + 2*variableRange*w_i/(1 - 2^(-k));
    end
    inputWeights = weights(1:numberOfInputWeights);
    inputWeights = reshape(inputWeights,[4,numberOfHiddenUnits]);
    outputWeights = weights(numberOfInputWeights+1:numberOfWeights);
    outputWeights = reshape(outputWeights,[numberOfHiddenUnits+1,2]);

end