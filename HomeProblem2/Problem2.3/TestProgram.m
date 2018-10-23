format shortG;

%Parameters
NUMBER_OF_HIDDEN_UNITS = 8;
VARIABLE_RANGE = 5;
SLOPE_LENGHT = 1000;

%Alpha (you can modify this)
alpha = GetSlopeAngle(1:SLOPE_LENGHT,3,3);

bestChromosome = [1   1   0   0   0   1   0   0   1   0   1   1   0   0 ...
    0   0   1   0   0   0   0   0   0   0   1   0   0   0   0   0   0   1 ...
    0   0   1   0   0   0   0   0   1   1   1   1   0   0   1   0   0 ...
    0   1   0   1   0   1   1   1   1   0   1   0   0   0   0   0   1 ...
   0   1   1   0   0   1   1   0   0   0   1   0   1   1   1   0   0 ...
   0   0   1   0   1   1   1   1   0   0   0   0   0   1   0   1 ...
   1   0   0   0   1   1   1   0   1   1   0   0   0   1   1   1   0 ...
   0   0   1   0   1   0   1   1   1   1   1   1   1   1   0   1 ...
   1   0   1   1   0   1   1   1   1   0   1   0   0   0   0   0   1 ...
   1   1   1   0   1   0   0   1   1   1   1   0   0   1   1   1 ...
   0   1   0   1   0   0   0   0   0   1   0   0   0   0   0   1   1  ...
   1   0   0   1   1   0   0   0   0   1   1   1   1   0   0   0 ...
   1   0   1   0   1   0   1   1   0   1   1   1   0   1   1   1   0 ...
   1   0   0   1   1   1   1   0   1   0   0   0   1   1   0   1 ...
   1   0   1   1   0   0   0   1   1   0   0   0   0   1   1   1   1 ...
   0   1   0   1   0   0   1   1   0   0   1   0   1   0   1   1 ...
   1   0   0   1   1   0   0   0   1   1   0   1   1   0   1   0   1 ...
   1   1   0   1   0   0   1   0   0   0   0   0   0   0   0   1 ...
   1   1   0   0   1   1   0   1   0   1   1   1   0   1   0   1   0 ...
   0   1   1   1   1   0   1   1   0   1   1   1   0   1   0   0 ...
   0   1   0   1   1   1   0   0   0   1   1   1   1   1   0   1   0 ...
   1   1   1   0   0   0   1   1   1   1   0   0   0   0   0   0 ...
   1   1   1   1   0   0   0   0   0   0   1   0   0   0   0   1   1 ...
   0   0   0   0   1   1   0   0   1   1   1   0   1   1   0   0 ...
   1   1   1   1   0   1   0   1   0   1   1   0   0   0   1   0   1 ...
   1   0   1   1   1   1   0   0   0   0   1   0   0   0   1   1 ...
   0   0   1   0   1   0   0   1   0   1   0   0   1   0   1   1   1 ...
   0   0   0   0   1   1   1   1   0   0   1   0   0   0   1   0 ...
   0   0   1   0   1   0   0   1   1   1   1   0   0   0   0   0   0 ...
   1   0   0   0   0   0   0   0   0   1   0   0   1   1   1   0 ...
   1   1   0   1   1];

[inputWeights,outputWeights] = DecodeChromosome(BestChromosome, NUMBER_OF_HIDDEN_UNITS, VARIABLE_RANGE);

testFitness(iSlope) = EvaluateIndividual...
        (inputWeights,outputWeights,alpha,true);     