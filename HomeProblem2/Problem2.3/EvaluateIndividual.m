function fitness = EvaluateIndividual(inputWeights,outputWeights,alpha,show)
    %Parameters
    T_MAX = 750;
    M = 20000;
    TAU = 30;
    C_H = 40;
    T_AMB = 283;
    C_B = 3000;
    V_MAX = 25;
    V_MIN = 1;
    ALPHA_MAX = 10;
    G = 9.81;
    DELTA_T = 0.5;
    SLOPE_LENGHT = 1000;
    GEAR_COEFFICIENTS = [7,5,4,3,2.5,2,1.6,1.4,1.2,1];

    distances = zeros(1,1000);
    velocities = 20*ones(1,1000);
    breakingsForces = zeros(1,1000);
    brakeTemperatures = 500*ones(1,1000);
    
    pedalPressures = zeros(1,1000);
    gears = 7*ones(1,1000);
    lastGearChange = 1;

    i = 1;
    while(distances(i)<SLOPE_LENGHT && V_MIN < velocities(i) && ...
            velocities(i)<V_MAX && brakeTemperatures(i) < T_MAX)
        i = i+1;
        
        distances(i) = distances(i-1)+DELTA_T*velocities(i-1);
        distances(i) = min(distances(i),SLOPE_LENGHT); %avoid going too far
        
        if pedalPressures(i-1)<0.01
            brakeTemperatures(i) = brakeTemperatures(i-1)+...
                DELTA_T*(T_AMB-brakeTemperatures(i-1))/TAU;
        else
            brakeTemperatures(i) = brakeTemperatures(i-1)+...
                DELTA_T*C_H*pedalPressures(i-1);
        end

        if brakeTemperatures(i)<T_MAX-100
            breakingsForces(i) = M*G/20*pedalPressures(i-1);
        else
            breakingsForces(i) = M*G/20*pedalPressures(i-1)*...
                exp(-(brakeTemperatures(i)-(T_MAX-100))/100);
        end
        
        gravityForce = M*G*sin(pi/180*alpha(fix(distances(i))));
        engineBreakingForce = C_B*GEAR_COEFFICIENTS(gears(i-1));
        velocities(i) = velocities(i-1) + DELTA_T/M*...
            (gravityForce - breakingsForces(i) - engineBreakingForce);

        input = [velocities(i)/V_MAX, alpha(fix(distances(i)))/ALPHA_MAX, ...
        brakeTemperatures(i)/T_MAX];
        output = NeuralNetwork(input, inputWeights, outputWeights);
        pedalPressures(i) = output(1);

        gearChange = DecodeGearChange(output(2));
        if DELTA_T*(i-lastGearChange) > 2
           lastGearChange = i;
           gears(i) = gears(i-1)+gearChange;
           gears(i) = max(gears(i),1); %use existing gear
           gears(i) = min(gears(i),size(GEAR_COEFFICIENTS,2)); %use existing gear
        else
            gears(i) = gears(i-1);
        end
    end
    finalIteration = i;
    
    averageSpeed = mean(velocities(1:finalIteration));
    totalDistance = distances(finalIteration);
    fitness = averageSpeed * totalDistance;
    
    if show
        disp('average Speed');
        disp(averageSpeed);
        disp('total Distance');
        disp(totalDistance);
        disp('fitness');
        disp(fitness);
        
        %plot
        x = distances(2:finalIteration);
        subplot(3,2,1)
        plot(x,alpha(floor(x)))
        xlabel('distance (m)') 
        ylabel('slope (°)') 
        subplot(3,2,2)
        plot(x,pedalPressures(2:finalIteration))
        xlabel('distance (m)') 
        ylabel('pedal pressure') 
        subplot(3,2,3)
        plot(x,gears(2:finalIteration))
        xlabel('distance (m)') 
        ylabel('gear') 
        subplot(3,2,4)
        plot(x,velocities(2:finalIteration))
        xlabel('distance (m)') 
        ylabel('velocity (m/s)') 
        subplot(3,2,5)
        plot(x,brakeTemperatures(2:finalIteration))
        xlabel('distance (m)') 
        ylabel('brake emperature (K)') 
   end
       
end