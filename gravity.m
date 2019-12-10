function [ g ] = gravity(planet,h)

%
% function [ g ] = gravity(planet,h)
% 
% This function calculates the acceleration due to gravity on an    % object on all of the planets in our solar system.
% 
% Input: 
% 
%  NAME     UNITS     TYPE            SIZE               DESCRIPTION
% planet     n/a     string   length of planet name     type in planet name
%   h        [m]       DP             1x1                height above        %       planet’s surface wanted to be calculated 
% 
% 
% Output: 
% 
% NAME     UNITS     TYPE     SIZE     DESCRIPTION%
%  g      [m/s^2]     DP       1x1    acceleration due to gravity at height   
%

planet_data = [0.3302 2439.7; 4.8685 6051.8;5.9736 6378.1;0.64185 3396.2;1898.6 71492;568.46 60268; 86.832 25559; 102.43 24764]; 

% planet_data contains the mass and radius values of each planet in column 1
% and columns 2 respectively.

switch(lower(planet))
    case 'mercury'
    g = force_attraction((planet_data(1,1)*10^24),1,[0 0 0],[(planet_data(1,2)*1000)+h 0 0]);      
    case 'venus'
    g = force_attraction((planet_data(2,1)*10^24),1,[0 0 0],[(planet_data(2,2)*1000)+h 0 0]);    
    case 'earth'
    g = force_attraction((planet_data(3,1)*10^24),1,[0 0 0],[(planet_data(3,2)*1000)+h 0 0]);  
    case 'mars'
    g = force_attraction((planet_data(4,1)*10^24),1,[0 0 0],[(planet_data(4,2)*1000)+h 0 0]);    
    case 'jupiter'
    g = force_attraction((planet_data(5,1)*10^24),1,[0 0 0],[(planet_data(5,2)*1000)+h 0 0]);     
    case 'saturn'
    g = force_attraction((planet_data(6,1)*10^24),1,[0 0 0],[(planet_data(6,2)*1000)+h 0 0]);   
    case 'uranus'
    g = force_attraction((planet_data(7,1)*10^24),1,[0 0 0],[(planet_data(7,2)*1000)+h 0 0]);    
    case 'neptune'
    g = force_attraction((planet_data(8,1)*10^24),1,[0 0 0],[(planet_data(8,2)*1000)+h 0 0]);    
end

return 
end
