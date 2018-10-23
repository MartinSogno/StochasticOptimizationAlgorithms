function bestParticlePosition = UpdateBestParticlePositions(bestParticlePosition, currentPosition)
    
    swarmSize = size(currentPosition,1);
    for i = 1:swarmSize
        if f(currentPosition(i,:)) < f(bestParticlePosition(i,:))
            bestParticlePosition(i,:) = currentPosition(i,:);
        end
    end

end