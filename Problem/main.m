%% Potential of Eletric/Hybrid Propulsion Systems to Redute Petroluem Use and Greenhouse Gas Emissions
%% Driving cycles
% In order to perform this study, the drving cycles 
%
% <html><h3>Basic urbarn driving cycle</h3></html> 
%
clear
clc
[basic_time, basic_velocity] = BasicDrivingCycle();
figure();
plot(basic_time, basic_velocity);
grid on;
title('Basic urban driving cycle');
xlabel('time [s]');
ylabel('Velocity [v]');
%%
% <html><h3>Mix driving cycle</h3></html>
%
% Note that the Mix driving cycle is composed of urban and extra-urban
% driving cycles, being the first the concatenation of basic urban driving
% cycles.
[mix_time, mix_velocity] = MixDrivingCycle(basic_time, basic_velocity);
figure()
plot(mix_time, mix_velocity);
grid on;
title('Basic urban driving cycle');
xlabel('time $[s]$','Interpreter', 'latex');
ylabel('Velocity [$v$]','Interpreter', 'latex');

%% Power consumption
% In this section it is of interest to compare the power consumption between
% the different light duty urban vehicles presented in the figures (1), (2),
% (3) and (4) of the Lab script. To compare these, it is used two diferent
% driving cycles:
