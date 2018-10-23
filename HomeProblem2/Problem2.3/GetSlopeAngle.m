function alpha = GetSlopeAngle(x, iSlope, iDataSet)

if (iDataSet == 1)                                % Training
 if (iSlope == 1) 
   alpha = 4 + sin(x/100) + cos(sqrt(2)*x/50);    
   
 elseif (iSlope == 2) 
    alpha = 6 + sin(x/20) + 2*cos(sqrt(2)*x/50);
    
 elseif (iSlope == 3) 
    alpha = 5 + 3*x.*x/10^6 + sin(x/80) - cos(sqrt(3)*x/60);
    
 elseif (iSlope == 4) 
    alpha = 3 + x.*x/10^6 + 2*sin(x/100) - 1.5*cos(sqrt(5)*x/30);
    
 elseif (iSlope == 5) 
    alpha = 3 + (x-500).*(x-500)/10^5 + sin(x/50) - 2*cos(sqrt(2)*x/60);
    
 elseif (iSlope == 6) 
    alpha = 6 - sin(x/30) + cos(sqrt(2)*x/130);
    
 elseif (iSlope == 7) 
    alpha = 5 + sin(x/80) - cos(sqrt(2)*x/80);
    
 elseif (iSlope == 8) 
    alpha = 5 + 3*sin(x/50) + cos(sqrt(2)*x/100);
    
 elseif (iSlope == 9) 
    alpha = 6 + 1.2*sin(x/70) + 0.5*cos(sqrt(2)*x/30);
    
 elseif (iSlope == 10)
   alpha = 5 + 2*sin(x/50) + cos(sqrt(2)*x/100);  % You may modify this!
 end 
 
 
elseif (iDataSet == 2)                            % Validation
 if (iSlope == 1) 
   alpha = 6 - sin(x/100) + cos(sqrt(3)*x/50);

 elseif (iSlope == 2) 
   alpha = 3 + x/200 + sin(x/50) ;
   
 elseif (iSlope == 3) 
   alpha = 5 - 2*sin(x/70) + cos(sqrt(2)*x/60);
   
 elseif (iSlope == 4) 
   alpha = 6 - 2*sin(x/50) + cos(sqrt(2)*x/100);

 elseif (iSlope == 5) 
   alpha = 5 + sin(x/50) + cos(sqrt(5)*x/50);
 end
 
 
elseif (iDataSet == 3)                           % Test
 if (iSlope == 1) 
   alpha = 5 - sin(x/100) - cos(sqrt(7)*x/50); 

 elseif (iSlope == 2)
   alpha = 4 + sin(x/40) + 2*cos(sqrt(7)*x/80);
 
 elseif (iSlope == 3)
   alpha = 4 + 2*sin(x/50) + cos(sqrt(2)*x/100);
 
 elseif (iSlope == 4)
   alpha = 4 + 2*sin(x/100) + 2*cos(sqrt(3)*x/70);

 elseif (iSlope == 5)
   alpha = 4 + (x/1000) + sin(x/70) + cos(sqrt(7)*x/100);
 end
end

end
