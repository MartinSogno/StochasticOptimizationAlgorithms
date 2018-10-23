function [positions, velocities] = InitializeSwarm(swarmSize, x_min, x_max, alpha, deltaT)
    
    positions = x_min+(x_max-x_min)*rand(swarmSize,2);
    velocities = alpha/deltaT * (-(x_max-x_min)/2+(x_max-x_min)*rand(swarmSize,2));
  
end