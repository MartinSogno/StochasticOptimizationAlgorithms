function visibility = GetVisibility(cityLocation)

    numberOfCities = size(cityLocation,1);
    visibility = zeros(numberOfCities);
    for i = 1:numberOfCities
        for j = 1:numberOfCities
            if i == j
                visibility(i,j) = 0;
            else
                visibility(i,j) = 1/norm(cityLocation(i,:) - cityLocation(j,:));
            end
        end
    end

end