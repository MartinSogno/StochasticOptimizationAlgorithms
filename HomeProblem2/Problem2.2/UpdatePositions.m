function positions = UpdatePositions(velocities, currentPositions, deltaT)

    positions = currentPositions + deltaT * velocities;
    
end