function bestSwarmPosition = UpdateBestSwarmPosition(bestSwarmPosition, currentPosition)
    
    swarmSize = size(currentPosition,1);
    for i = 1:swarmSize
        if f(currentPosition(i,:)) < f(bestSwarmPosition)
            bestSwarmPosition = currentPosition(i,:);
        end
    end

end