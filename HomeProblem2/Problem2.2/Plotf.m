X_MIN = -5;
X_MAX = 5;
STEP = 0.01;
a = 0.01;
nbValues = (X_MAX-X_MIN)/STEP+1;

y = X_MIN:STEP:X_MAX;
z = X_MIN:STEP:X_MAX;
logFValues = zeros(nbValues);

for i = 1:nbValues
    for j = 1:nbValues
        x = [y(j),z(i)];
        logFvalues(i,j) = log(a+f(x));
    end
end

contour(y,z,logFvalues);