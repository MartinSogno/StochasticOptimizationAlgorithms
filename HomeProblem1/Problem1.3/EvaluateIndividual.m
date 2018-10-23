function fitness = EvaluateIndividual(x)
    %gets the fitness of a decoded chromosome

    x_1 = x(1);
    x_2 = x(2);
    
    a = 1+(x_1+x_2+1)^2*(19-14*x_1+3*x_1^2-14*x_2+6*x_1*x_2+3*x_2^2);
    b = 30+(2*x_1-3*x_2)^2*(18-32*x_1+12*x_1^2+48*x_2-36*x_1*x_2+27*x_2^2);
    g = a*b;
    fitness = 1/g;
    
end