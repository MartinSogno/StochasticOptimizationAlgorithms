%Parameters
STEP_LENGHT = 0.0001;
THRESHOLD = 10^-6;
MU_LIST = [1,10,100,1000];
STARTING_POINT = [1,2];

minima = [];
for i = 1:4
    minimum = GradientDescent(STARTING_POINT, MU_LIST(i), STEP_LENGHT, THRESHOLD);
    minima = vertcat(minima, minimum);
end

format shortG
result = horzcat(MU_LIST.', minima)