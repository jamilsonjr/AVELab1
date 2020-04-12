function [power] = AuxPowerCalculator(mechanical_power, velocity, power, efficiency_breaking, efficiency_mode_1, efficiency_mode_2)
    for i=1:length(mechanical_power)
        % When the system is breaking
        if(mechanical_power(i) < 0)
            power(i) = mechanical_power(i) * efficiency_breaking;
            continue
        end
        % When the system's velocity is under 20km/h and not breaking
        if(velocity(i)*3.6 < 20)
            power(i) = mechanical_power(i) / efficiency_mode_1;
        end
        % When system is between 20 and 40 km/h
        if(velocity(i)*3.6 >= 20 && velocity(i)*3.6 <= 40)
            power(i) = (mechanical_power(i)/2) / (efficiency_mode_2) + (mechanical_power(i)/2) / (efficiency_mode_1);
        end
        if(velocity(i)*3.6 > 40)
            power(i) = mechanical_power(i) / efficiency_mode_2;
        end
    end
end