function gradient = Gradient(x1, x2, mu)
% computes the value of the gradient of f evaluated in (x1, x2, mu)

    if x1^2 + x2^2 - 1 > 0 %constraint unsatisfied
        gx1 = 2 * (x1 - 1) + 4 * mu * x1 * (x1^2 + x2^2 - 1);
        gx2 = 4 * (x2 - 2) + 4 * mu * x2 * (x1^2 + x2^2 - 1);
    else % constraint satisfied
        gx1 = 2 * (x1 - 1);
        gx2 = 4 * (x2 - 2);
    end

    gradient = [gx1,gx2];
    
end
    