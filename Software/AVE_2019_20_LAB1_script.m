%% main file
clc
close all
clear all

%% direct start-up

U_ds = readtable('D:\IST\IST-aulas\AVE\2019_20\LAB 1&2\Direct Start\F0020CH1.csv');
I_ds = readtable('D:\IST\IST-aulas\AVE\2019_20\LAB 1&2\Direct Start\F0020CH2.csv');

time_ds = table2array(U_ds(:,4));
volt_ds = table2array(U_ds(:,5));
curr_ds = table2array(I_ds(:,5));
power_ds=volt_ds.*curr_ds;



% calc time_step
step_ds=time_ds(2)-time_ds(1);
N_ds=round(0.02/step_ds);

power_ds_av=movmean(power_ds,N_ds)';

Ids_rms=zeros(1,length(curr_ds));
Uds_rms=zeros(1,length(curr_ds));
for i=N_ds+1:length(curr_ds)
    Ids_rms(i)=rms(curr_ds(i-N_ds:i));
    Uds_rms(i)=rms(volt_ds(i-N_ds:i));
end

apparent_ds_av=(Uds_rms.*Ids_rms); %Q=sqrt(S^2-P^2)
reactive_ds_av=(apparent_ds_av.^2-power_ds_av.^2).^(1/2);

figure
subplot(1,2,1)
plot(time_ds, volt_ds);
hold on
yyaxis right
plot(time_ds, curr_ds);
subplot(1,2,2)
plot(time_ds, power_ds);
hold on
plot(time_ds, power_ds_av);

%% SS start-up

% T_up=2s

U_2s = readtable('D:\IST\IST-aulas\AVE\2019_20\LAB 1&2\SS tup_2s\F0020CH1.csv');
I_2s = readtable('D:\IST\IST-aulas\AVE\2019_20\LAB 1&2\SS tup_2s\F0020CH2.csv');

time_2s = table2array(U_2s(:,4));
volt_2s = table2array(U_2s(:,5));
curr_2s = table2array(I_2s(:,5));
power_2s=volt_2s.*curr_2s;


% calc time_step
step_2s=time_2s(2)-time_2s(1);
N_2s=round(0.02/step_2s);
power_2s_av=movmean(power_2s,N_2s)';

I2s_rms=zeros(1,length(curr_2s));
U2s_rms=zeros(1,length(curr_2s));
for i=N_2s+1:length(curr_2s)
    I2s_rms(i)=rms(curr_2s(i-N_2s:i));
    U2s_rms(i)=rms(volt_2s(i-N_2s:i));
end

apparent_2s_av=(U2s_rms.*I2s_rms); %Q=sqrt(S^2-P^2)
reactive_2s_av=(apparent_2s_av.^2-power_2s_av.^2).^(1/2);

figure
subplot(1,2,1)
plot(time_2s, volt_2s);
hold on
yyaxis right
plot(time_2s, curr_2s);
subplot(1,2,2)
plot(time_2s, power_2s);
hold on
plot(time_2s, power_2s_av);

% T_up=5s

U_5s = readtable('D:\IST\IST-aulas\AVE\2019_20\LAB 1&2\SS tup_5s\F0019CH1.csv');
I_5s = readtable('D:\IST\IST-aulas\AVE\2019_20\LAB 1&2\SS tup_5s\F0019CH2.csv');

time_5s = table2array(U_5s(:,4));
volt_5s = table2array(U_5s(:,5));
curr_5s = table2array(I_5s(:,5));
power_5s=volt_5s.*curr_5s;


% calc time_step
step_5s=time_5s(2)-time_5s(1);
N_5s=round(0.02/step_5s);
power_5s_av=movmean(power_5s,N_5s)';

I5s_rms=zeros(1,length(curr_5s));
U5s_rms=zeros(1,length(curr_5s));
for i=N_5s+1:length(curr_5s)
    I5s_rms(i)=rms(curr_5s(i-N_5s:i));
    U5s_rms(i)=rms(volt_5s(i-N_5s:i));
end

apparent_5s_av=(U5s_rms.*I5s_rms); %Q=sqrt(S^2-P^2)
reactive_5s_av=(apparent_5s_av.^2-power_5s_av.^2).^(1/2);

figure
subplot(1,2,1)
plot(time_5s, volt_5s);
hold on
plot(time_5s, curr_5s);
subplot(1,2,2)
plot(time_5s, power_5s);
hold on
plot(time_5s, power_5s_av);

% T_up=7s

U_7s = readtable('D:\IST\IST-aulas\AVE\2019_20\LAB 1&2\SS tup_7s\F0019CH1.csv');
I_7s = readtable('D:\IST\IST-aulas\AVE\2019_20\LAB 1&2\SS tup_7s\F0019CH2.csv');

time_7s = table2array(U_7s(:,4));
volt_7s = table2array(U_7s(:,5));
curr_7s = table2array(I_7s(:,5));
power_7s=volt_7s.*curr_7s;


% calc time_step
step_7s=time_7s(2)-time_7s(1);
N_7s=round(0.02/step_7s);
power_7s_av=movmean(power_7s,N_7s)';

I7s_rms=zeros(1,length(curr_7s));
U7s_rms=zeros(1,length(curr_7s));
for i=N_7s+1:length(curr_7s)
    I7s_rms(i)=rms(curr_7s(i-N_7s:i));
    U7s_rms(i)=rms(volt_7s(i-N_7s:i));
end

apparent_7s_av=(U7s_rms.*I7s_rms); %Q=sqrt(S^2-P^2)
reactive_7s_av=(apparent_7s_av.^2-power_7s_av.^2).^(1/2);

figure
subplot(1,2,1)
plot(time_7s, volt_7s);
hold on
plot(time_7s, curr_7s);
subplot(1,2,2)
plot(time_7s, power_7s);
hold on
plot(time_7s, power_7s_av);

%% compare all

figure
subplot(1,2,1)
plot(time_ds, Uds_rms);
hold on
plot(time_2s, U2s_rms);
plot(time_5s, U5s_rms);
plot(time_7s, U7s_rms);

subplot(1,2,2)
plot(time_ds, Ids_rms);
hold on
plot(time_2s, I2s_rms);
plot(time_5s, I5s_rms);
plot(time_7s, I7s_rms);

figure
subplot(2,2,1)
plot(time_ds, apparent_ds_av);
hold on
plot(time_2s, apparent_2s_av);
plot(time_5s, apparent_5s_av);
plot(time_7s, apparent_7s_av);

subplot(2,2,2)
plot(time_ds, power_ds_av);
hold on
plot(time_2s, power_2s_av);
plot(time_5s, power_5s_av);
plot(time_7s, power_7s_av);

subplot(2,2,3)
plot(time_ds, reactive_ds_av);
hold on
plot(time_2s, reactive_2s_av);
plot(time_5s, reactive_5s_av);
plot(time_7s, reactive_7s_av);

subplot(2,2,4)
plot(time_ds, power_ds_av./apparent_ds_av);
hold on
plot(time_2s, power_2s_av./apparent_2s_av);
plot(time_5s, power_5s_av./apparent_5s_av);
plot(time_7s, power_7s_av./apparent_7s_av);
axis([time_2s(1) time_2s(end) 0 1])


%% calc energy
t_arr_ds=0.1468; %s
t_arr_2s=1.318; %s
t_arr_5s=2.07; %s
t_arr_7s=2.836; %s

for i=1:length(time_2s)
    if time_2s(i)<t_arr_2s
        flag_2s=i;
    end
    if time_5s(i)<t_arr_5s
        flag_5s=i;
    end
    if time_7s(i)<t_arr_7s
        flag_7s=i;
    end
end

for i=1:length(time_ds)
    if time_ds(i)<t_arr_ds
        flag_ds=i;
    end
end
  
Ea_arr_ds=trapz(time_ds(1:flag_ds),power_ds_av(1:flag_ds));
Ea_arr_2s=trapz(time_2s(1:flag_2s),power_2s_av(1:flag_2s));
Ea_arr_5s=trapz(time_5s(1:flag_5s),power_5s_av(1:flag_5s));
Ea_arr_7s=trapz(time_7s(1:flag_7s),power_7s_av(1:flag_7s));

Er_arr_ds=trapz(time_ds(1:flag_ds),reactive_ds_av(1:flag_ds));
Er_arr_2s=trapz(time_2s(1:flag_2s),reactive_2s_av(1:flag_2s));
Er_arr_5s=trapz(time_5s(1:flag_5s),reactive_5s_av(1:flag_5s));
Er_arr_7s=trapz(time_7s(1:flag_7s),reactive_7s_av(1:flag_7s));

% steady state
P_steady=mean(power_2s_av(end-N_2s*10:end));
S_steady=mean(apparent_2s_av(end-N_2s*10:end));
Q_steady=mean(reactive_2s_av(end-N_2s*10:end));

fprintf('Ea_arr_ds = %f [J]\n', Ea_arr_ds);
fprintf('Ea_arr_2s = %f [J]\n', Ea_arr_2s);
fprintf('Ea_arr_5s = %f [J]\n', Ea_arr_5s);
fprintf('Ea_arr_7s = %f [J]\n', Ea_arr_7s);
fprintf('Er_arr_ds = %f [J]\n', Er_arr_ds);
fprintf('Er_arr_2s = %f [J]\n', Er_arr_2s);
fprintf('Er_arr_5s = %f [J]\n', Er_arr_5s);
fprintf('Er_arr_7s = %f [J]\n', Er_arr_7s);
fprintf('P_steady_state = %f [W]\n', P_steady);
fprintf('Q_steady_state = %f [var]\n', Q_steady);

        
