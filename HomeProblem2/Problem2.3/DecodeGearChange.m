function gearChange = DecodeGearChange(output)
    if output < 0.3
        gearChange = -1;
    elseif output < 0.7
        gearChange = 0;
    else
        gearChange = 1;
    end
end