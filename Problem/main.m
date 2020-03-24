%% Potential of Eletric/Hybrid Propulsion Systems to Redute Petroluem Use and Greenhouse Gas Emissions
%% Driving cycles
% In order to perform this study, the driving cycles were ploted in matLab.
% Two types of driving cycles were used:
%
% <html><h3>Basic urbarn driving cycle</h3></html> 
%
clear
close all
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

%% Vehicles Configurations and assumptions
% In the study there are 4 possible configurations of  light duty urban vehicles, presented in
% the figures (1), (2), (3) and (4). They consist of pure eletric, pure
% combustion, series hybrid and paralel hybrid.
%
% <html><h3>Pure Eletric Powertrain</h3></html>
% 
% In this configuration the battery in series with the eletric
% motor/generator in series with the transmission.
% There are two possible modes of functioning, the motor discharging the
% batteries while accelerating, and the opposite, generator charging the batteries decelerating.
%% 
% *Acceleration:*
% During discharge the ciruit has an efficiency different of 100%. The overalll
% efficiecy $\eta_{overall}$ is given by the product of the individual effinciency of
% each component of the circuit
%%
% $\eta_{overall}=\prod_{i=1}\eta_i$. 
%%
% Thus, for this powertrain, one has that [$battery \rightarrow motor
% \rightarrow transmission$] will translate in a overall efficiency given
% by: 
%%
% $\eta_{overall}=\eta_{battery}\eta_{motor}\eta_{transmission}$
%% 
% * Assuming that the batteries are made from lithium-ion, according to
% <https://en.wikipedia.org/wiki/Lithium-ion_battery> it is reasonable to assume that
% the discharging effinciency of the battery of around 90%.
% * From <https://en.wikipedia.org/wiki/Electric_car#Energy_efficiency> it
% is reasonable to assume that the eletric motor has an efficiency of 70%.
% * From <https://www.nap.edu/read/21744/chapter/7> it is resonable to
% assume that the effinciecy of an automatic transmission is 90%.
%% 
% Thus the eletric power in acceleration is given by:
%% 
% $$Tesitng$$
%% Power consumption
% In this section it is of interest to compare the power consumption between
% the different vehicles.
% 
% The objective os to calculate:
%% 
% $$ P_T = F_Tv $$
%%
% So first one must consider the traction force $F_T$ on each car. The
% forces present are:
%%
% * Motor force;
% * Drag force;
% * Friction force;
%% 
% $$ F_T = f_m m a + F_{drag} + F_{friction}$$
%%
% Being:
%%
% * $F_{drag} = {1 \over 2} \rho C_d A v(v-(-v_w))^2)$
% * $F_{friction} = C_{rr} m g v$ 
%% 
% $f_m \rightarrow mass factor$; $\rho\rightarrow$ densidade do meio; 
% $C_d\rightarrow$ aerodynamic drag coefficient; A $\rightarrow$ frontal 
% surface area; $v_w\rightarrow$ wind speed; $C_{rr}\rightarrow$ rolling  
% resistance coefficient; $m$ and $g$ mass a gravity;
%%
% Considering $f_m = 1.05$ and using the constant values from the table(I) of the
% laboratory script, one can compute the values of $F_T$.


