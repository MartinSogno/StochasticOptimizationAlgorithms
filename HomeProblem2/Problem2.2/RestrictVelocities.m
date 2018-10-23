function velocities = RestrictVelocities(velocities, maxVelocity)

    swarmSize = size(velocities,1);
    for i = 1:swarmSize
        if norm(velocities(i,:)) > maxVelocity
            velocities(i,:) = velocities(i,:) * maxVelocity / norm(velocities(i,:));
        end
    end
    
end
            