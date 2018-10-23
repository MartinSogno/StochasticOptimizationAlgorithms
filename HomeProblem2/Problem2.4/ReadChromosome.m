function algorithm = ReadChromosome(chromosome, N, constant_register)
    
    chromosomeLength = size(chromosome,2);
    algorithm = '';
    operations = ['+','-','*','/'];
    
    for i = 1:4:chromosomeLength
        operation = operations(chromosome(i));
        
        destination = chromosome(i+1);
        destination = strcat('v',string(destination));
        
        operand1 = chromosome(i+2);
        if operand1 > N
            operand1 = string(constant_register(operand1-N));
        else
            operand1 = strcat('v',string(operand1));
        end
            
        operand2 = chromosome(i+3);
        if operand2 > N
            operand2 = string(constant_register(operand2-N));
        else
            operand2 = strcat('v',string(operand2));
        end
        
        disp (strcat(destination, ' = ',  operand1, operation, operand2));
    end
    
end