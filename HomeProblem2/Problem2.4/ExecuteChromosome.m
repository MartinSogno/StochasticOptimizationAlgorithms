function result = ExecuteChromosome(chromosome, x, N, constant_register, CMAX)
    
    register = [zeros(1,N), constant_register];
    register(1) = x;
    chromosomeLength = size(chromosome,2);
    
    for i = 1:4:chromosomeLength
        operation = chromosome(i);
        destination = chromosome(i+1);
        operand1 = register(chromosome(i+2));
        operand2 = register(chromosome(i+3));
        
        if operation == 1
            register(destination) = operand1 + operand2;
            
        elseif operation == 2
            register(destination) = operand1 - operand2;
            
        elseif operation == 3
            register(destination) = operand1 * operand2;
            
        else
            if operand2 == 0
                register(destination) = CMAX;
            else
                register(destination) = operand1 / operand2;
            end
        end
    end
    result = register(1);
       
end