function minimum = GradientDescent(startingPoint, mu, eta, T)
% executes gradient descent from starting point in order to find the
% minimum of f. eta is the length of one step, T the norm the gradient
% should reach to stop the algorithm.
    
    %Assign starting point
    x1 = startingPoint(1);
    x2 = startingPoint(2);
    
    gradientModulus = T +1; % Make sure we enter the loop
    
    while gradientModulus > T 
        %Get gradient
        gradient = Gradient(x1,x2,mu);
        gx1 = gradient(1);
        gx2 = gradient(2);
        gradientModulus = norm(gradient);
        
        %Update points
        x1 = x1 - eta * gx1;
        x2 = x2 - eta * gx2;
    end 
    minimum = [x1,x2];
    
end
    