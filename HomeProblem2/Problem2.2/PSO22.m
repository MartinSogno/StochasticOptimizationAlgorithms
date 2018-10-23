clear all;

%Parameters
ALPHA = 1;
DELTA_T = 1;
X_MIN = -5;
X_MAX = 5;
V_MAX = (X_MAX-X_MIN)/DELTA_T;
SWARM_SIZE = 40;
C1 = 2;
C2 = 2;
NUMBER_ITERATIONS = 250;
BETA = 0.99;
INERTIA_WEIGHT_MINIMUM = 0.4;

inertiaWeight = 1.4;

[positions, velocities] = InitializeSwarm(SWARM_SIZE, X_MIN, X_MAX, ALPHA, DELTA_T);
bestParticlePositions = positions;
bestSwarmPosition = UpdateBestSwarmPosition(positions(1,:), positions);

for iIteration = 1:NUMBER_ITERATIONS    
    
    bestParticlePositions = UpdateBestParticlePositions(bestParticlePositions, positions);
    bestSwarmPosition = UpdateBestSwarmPosition(bestSwarmPosition, positions);
    
    velocities = UpdateVelocities(velocities, positions,...
    bestParticlePositions, bestSwarmPosition, DELTA_T, inertiaWeight, C1, C2);
    velocities = RestrictVelocities(velocities, V_MAX);
    positions = UpdatePositions(velocities, positions, DELTA_T);
    
    if inertiaWeight > INERTIA_WEIGHT_MINIMUM
        inertiaWeight = BETA * inertiaWeight;
    end
    
end

format long;
disp('minimum : ');
disp(bestSwarmPosition);
disp('value of f :')
disp(f(bestSwarmPosition));