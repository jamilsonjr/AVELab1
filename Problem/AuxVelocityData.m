function [out_time, out_velocity] = AuxVelocityData(time_array, velocity_array, time, initial_velocity, final_velocity)
t = 0:0.01:time;
slope = (final_velocity - initial_velocity)/time;
incresing_velocity = slope.*t + initial_velocity;
max_time_array = max(time_array);
out_time = [time_array t+max_time_array];
out_velocity = [velocity_array incresing_velocity];
end