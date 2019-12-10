%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This program simulates a drunken pirate's movement back towards
%his ship which is found at the north east end of the pier.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

for n=1:4
    
    clear x
    clear y
    
    Drunken_pirate_x(1) = 0;
    Drunken_pirate_y(1) = 0;

    Pier_coords = [3 3 5 5 -5 -5 -3 -3 3; 0 10 10 14 14 10 10 0 0]; 
                                              
    docked = true;
    
    ii=1;
    steps = 0;
    
while docked

    Direction(ii) = randi([1 3]);    

    if Direction(ii) == 1       %East
       Drunken_pirate_x = Drunken_pirate_x + 0.25;    
       
        
    elseif Direction(ii) == 2   %West   
        Drunken_pirate_x = Drunken_pirate_x - 0.25;
    
    else                        %North
           Drunken_pirate_y = Drunken_pirate_y + 0.25;
    end    
    
    x(ii) = Drunken_pirate_x;
    y(ii) = Drunken_pirate_y;
    
    if (-5>x(ii)) && (y(ii)>10)==1
           outcome = 'The Pirate plunged into the sea in';
            break
    end
       
        
    if (y(ii)>14)==1
            outcome = 'The Pirate plunged into the sea in';
            break
    end
    
    if (((-3>x(ii))|(x(ii)>3))&(y(ii)<10))==1
            outcome = 'The Pirate plunged into the sea in';
            break
    end
        
    if ((((14>y(ii))&(y(ii)>10)))&(x(ii)>5))==1
            outcome = 'The Pirate made it safely to the ship in';
            break
    end
    
        
    if ii>1000==1
            break
    end
    
    ii=ii+1;
    steps = steps+1;
    
    distance = 0.25*steps;
   
end

subplot(2,2,n)
plot(Pier_coords(1,:),Pier_coords(2,:),'b')
axis([-6 6 -1 15])
hold on
plot(x,y,':r')

fprintf('==========================================\n')
fprintf('Summary of Results\n')
fprintf('==========================================\n\n')
fprintf('%s %u steps!\n',outcome,steps)
fprintf('The total distance travelled was %.2f [m].\n\n',distance)
fprintf('===========================================\n\n\n\n')
    
end
