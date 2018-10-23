function x = DecodeChromosome(chromosome, variableNumber, variableRange)
    %gets the values of different variables from the binary encoding

    chromosomeLength = size(chromosome,2);
    k = fix(chromosomeLength/variableNumber);
    x = [];
    
    for i = 1:variableNumber
        x_i = 0.0;
        for j = 1:k
            x_i = x_i + chromosome(k*(i-1)+j)*2^(-j);
        end
        x = [x, -variableRange + 2*variableRange*x_i/(1 - 2^(-k))];
    end
    
end