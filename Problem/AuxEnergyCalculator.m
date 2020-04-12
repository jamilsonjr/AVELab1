function [energy_recovered, energy_spent] = AuxEnergyCalculator(time, power_consumption)
    % Filter only the negative values of the plot and pass them to positive
    % value
    power_recovered = power_consumption;
    power_spent = power_consumption;
    % Energy recovered
    for i=1:length(power_consumption)
        if(power_recovered(i) > 0)
            power_recovered(i) = 0;
        else
            power_recovered(i) = -power_recovered(i);
        end
    end
    energy_recovered  = trapz(time, power_recovered);
    % Energy spent
    for i=1:length(power_consumption)
        if(power_spent(i) < 0)
            power_spent(i) = 0;
        end
    end
    energy_spent  = trapz(time, power_spent);
end