function [time, velocity] = BasicDrivingCycle()
    % Creating the Basic urban driving cycle
    clear
    clc
    % total time
    time = [0];
    velocity = [0];
    % chunk_0
    [time, velocity] = AuxVelocityData(time, velocity, 5, 0, 0);
    % chunk_1
    [time, velocity] = AuxVelocityData(time, velocity, 5, 0, 18);
    % chunk_2
    [time, velocity] = AuxVelocityData(time, velocity, 10, 18, 18);
    % chunk_3
    [time, velocity] = AuxVelocityData(time, velocity, 5, 18, 0);
    % chunk_4
    [time, velocity] = AuxVelocityData(time, velocity, 25, 0, 0);
    % chunk_5
    [time, velocity] = AuxVelocityData(time, velocity, 10, 0, 30);
    % chunk_6
    [time, velocity] = AuxVelocityData(time, velocity, 30, 30, 30);
    % chunk_7
    [time, velocity] = AuxVelocityData(time, velocity, 10, 30, 0);
    % chunk_8
    [time, velocity] = AuxVelocityData(time, velocity, 25, 0, 0);
    % chunk_9
    [time, velocity] = AuxVelocityData(time, velocity, 25, 0, 50);
    % chunk_10
    [time, velocity] = AuxVelocityData(time, velocity, 15, 50, 50);
    % chunk_11
    [time, velocity] = AuxVelocityData(time, velocity, 5, 50, 35);
    % chunk_12
    [time, velocity] = AuxVelocityData(time, velocity, 15, 35, 35);
    % chunk_13
    [time, velocity] = AuxVelocityData(time, velocity, 10, 35, 0);
    %chunk_14
    [time, velocity] = AuxVelocityData(time, velocity, 5, 0, 0);
    

end
