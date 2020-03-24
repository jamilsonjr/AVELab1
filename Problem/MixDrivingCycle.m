%% This is a test for the publish
function [time, velocity] = MixDrivingCycle(basic_time, basic_velocity) 
    % time & velocity
    time = basic_time;
    velocity = basic_velocity;
    
    % Urban cycle
    max_basic_time = max(basic_time);
    for i=1:3
        velocity = [velocity basic_velocity];
        time = [time basic_time+i*max_basic_time];
    end
    
    % Extra urban chunk
    % chunk_0
    [time, velocity] = AuxVelocityData(time, velocity, 30, 0, 70);
    % chunk_1
    [time, velocity] = AuxVelocityData(time, velocity, 50, 70, 70);    
    % chunk_2
    [time, velocity] = AuxVelocityData(time, velocity, 20, 70, 50);    
    % chunk_3 
    [time, velocity] = AuxVelocityData(time, velocity, 70, 50, 50);
    % chunk_4 
    [time, velocity] = AuxVelocityData(time, velocity, 20, 50, 70);
    % chunk_5 
    [time, velocity] = AuxVelocityData(time, velocity, 50, 70, 70);
    % chunk_6 
    [time, velocity] = AuxVelocityData(time, velocity, 30, 70, 100);
    % chunk_7 
    [time, velocity] = AuxVelocityData(time, velocity, 30, 100, 100);
    % chunk_8 
    [time, velocity] = AuxVelocityData(time, velocity, 15, 100, 120);
    % chunk_9 
    [time, velocity] = AuxVelocityData(time, velocity, 15, 120, 120);
    % chunk_10 
    [time, velocity] = AuxVelocityData(time, velocity, 30, 120, 0);
    
    
    
    
    
    
    

end