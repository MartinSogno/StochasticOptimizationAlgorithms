function velocities = UpdateVelocities(currentVelocities, currentPositions,...
    bestParticlePositions, bestSwarmPosition, deltaT, inertiaWeight, c1, c2)

    particleComponent = c1*rand/deltaT*(bestParticlePositions-currentPositions);
    swarmComponent = c2*rand/deltaT*(bestSwarmPosition-currentPositions);
    velocities = inertiaWeight * currentVelocities + particleComponent + swarmComponent;
    
end