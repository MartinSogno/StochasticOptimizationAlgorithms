function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)
    %selects i chromosoms via tournament selection within tournamentSize
    %chromosoms
    
    populationSize = size(fitness,1);
    iInTournament = []; %list of index of chromosomes in the tournament 
    for j = 1:tournamentSize
        iInTournament = [iInTournament, 1 + fix(rand*populationSize)];
    end
       
    iSelected = 0; %no selection yet
    while iSelected == 0
        %get the chromosome with the highest fitness
        maxFitness = -100000; %arbitrary small value
        iMaxFitness = 0;
        for j = 1:size(iInTournament,2)
            if fitness(iInTournament(j)) > maxFitness
            	iMaxFitness = iInTournament(j); %position in the fitness array of the best chromosome
                jMaxFitness = j; %position in in the iInTournament array of the best chromosome
                maxFitness = fitness(iInTournament(j));
            end
        end
        
        r = rand;
        
        if (r < pTournament)
            iSelected = iMaxFitness; %selected
        else
            iInTournament(jMaxFitness) = []; %delete the chromosome
            if size(iInTournament,2) == 1
                iSelected = iInTournament(1); %select the last chromosome in the tournament
            end
        end
    end

end