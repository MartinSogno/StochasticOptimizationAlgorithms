function output = NeuralNetwork(input, inputWeights, outputWeights)
    n_i = size(input,2); %number of inputs
    n_h = size(inputWeights,2); %number of hidden neurons
    n_o = size(outputWeights,2); %number of outputs
    
    input = [input,-1]; %bias
    hiddenValues = zeros(1,n_h);
    output = zeros(1,n_o);
    for i = 1:n_h
        for j = 1:n_i+1
        hiddenValues(i) = hiddenValues(i) + input(j)*inputWeights(j,i);
        end
        hiddenValues(i) = 1/(1+exp(-hiddenValues(i))); %sigmoid
    end
    
    hiddenValues = [hiddenValues,-1]; %bias
    
    for i = 1:n_o
        for j = 1:n_h+1
            output(i) = output(i) + hiddenValues(j)*outputWeights(j,i);
        end
        output(i) = 1/(1+exp(-output(i))); %sigmoid
    end
       
end