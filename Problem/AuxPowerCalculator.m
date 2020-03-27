function [power] = AuxPowerCalculator(mechanical_power, velocity, power, efficiency_breaking, efficiency_under_50, efficiency_over_50)

    for i=1:length(mechanical_power)
        % When the system is breaking
        if(mechanical_power(i) < 0)
            power(i) = mechanical_power(i) * efficiency_breaking;
        end
        % When the system's velocity is under 50km/h and not breaking
        if(mechanical_power(i) > 0 && velocity(i)*3.6 < 50)
            power(i) = mechanical_power(i) / efficiency_under_50;
        end
        % When the system's velocity is over 50km/h and not breaking
        if(mechanical_power(i) > 0 && velocity(i)*3.6 >= 50)
            power(i) = mechanical_power(i) / efficiency_over_50;
        end
    end
end