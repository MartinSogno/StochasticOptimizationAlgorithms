FUNCTION_DATA = LoadFunctionData;

nbPoints = size(FUNCTION_DATA,1);
yHat = zeros(1,nbPoints);

BestChromosomeEver = [3     2     1     1     4     3     3     1     2 ...
    1     2     1     1     3     3     4     2     2     2     1     4 ...  
    3     4     2     4     3     3     1     2     1     2     1     1 ... 
    3     3     4     4     1     3     3     1     1     3     2     4 ...  
    1     3     1];

for iPoint = 1:nbPoints
    x = FUNCTION_DATA(iPoint,1);
    numerator = 1-x^2+x^3;
    denominator = 1-x^2+x^4;
    yHat(iPoint) = numerator/denominator;
end

x = FUNCTION_DATA(:,1);
y = FUNCTION_DATA(:,2);
plot(x,y);
hold on;
plot(x,yHat);

error = norm(transpose(y)-yHat);
disp('error :')
disp(error);