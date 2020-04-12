function [total_cost] = AuxFuelCalculator(time, velocity, power_consumption, number_of_cycles, powertrain)
    cost_diesel_per_liter = 1.4; %[/l]
    energy_density_diesel = 10; % [kWh/l]
    cost_diesel = (1/energy_density_diesel)*cost_diesel_per_liter; % [/kWh]
    cost_electricity = 0.15; %[/kWh]
    
    if (strcmp(powertrain, 'Pure Eletric'))
        [energy_recovered_per_clyce, energy_spent_per_cycle] = AuxEnergyCalculator(time, power_consumption);
        energy_spent_per_cyle = energy_spent_per_cycle/(1000*3600); % [kWh]
        cost_spent_per_cycle = energy_spent_per_cyle*cost_electricity;
        total_cost_spent = cost_spent_per_cycle*number_of_cycles;
        
        energy_recovered_per_cycle = energy_recovered_per_clyce/(1000*3600); % [kWh]
        cost_recovered_per_cycle = energy_recovered_per_cycle*cost_electricity;
        total_cost_recovered = cost_recovered_per_cycle*number_of_cycles;
        
        total_cost = total_cost_spent - total_cost_recovered;
    end
    if (strcmp(powertrain, 'Series Hybrid'))
        [energy_recovered_per_clyce, energy_spent_per_cycle] = AuxEnergyCalculator(time, power_consumption);
        energy_spent_per_cyle = energy_spent_per_cycle/(1000*3600); % [kWh]
        cost_spent_per_cycle = energy_spent_per_cyle*cost_diesel;
        total_cost_spent = cost_spent_per_cycle*number_of_cycles;
        
        energy_recovered_per_cycle = energy_recovered_per_clyce/(1000*3600); % [kWh]
        cost_recovered_per_cycle = energy_recovered_per_cycle*cost_diesel;
        total_cost_recovered = cost_recovered_per_cycle*number_of_cycles;
        
        total_cost = total_cost_spent - total_cost_recovered;
    end
   if (strcmp(powertrain, 'Pure Combustion'))
        [energy_recovered_per_clyce, energy_spent_per_cycle] = AuxEnergyCalculator(time, power_consumption);
        energy_spent_per_cyle = energy_spent_per_cycle/(1000*3600); % [kWh]
        cost_spent_per_cycle = energy_spent_per_cyle*cost_diesel;
        total_cost_spent = cost_spent_per_cycle*number_of_cycles;
        
        % Não faz sentido, eu sei, mas era só apra confirmar que estava tudo
        % bem e dava zero ahahha
        energy_recovered_per_cycle = energy_recovered_per_clyce/(1000*3600); % [kWh]
        cost_recovered_per_cycle = energy_recovered_per_cycle*cost_diesel;
        total_cost_recovered = cost_recovered_per_cycle*number_of_cycles;
        total_cost = total_cost_spent - total_cost_recovered;
   end
   if (strcmp(powertrain, 'Parallel Hybrid'))
       eletric_power_consumption = power_consumption;
       combustion_power_consumption = power_consumption;
       for i=1:length(velocity)
           if(power_consumption(i) < 0)
               combustion_power_consumption(i) = 0;
               eletric_power_consumption(i) = 0;
               continue
           end
           if(velocity(i)*3.6 >= 0 && velocity(i)*3.6 < 20)
                combustion_power_consumption(i) = 0;
           end
            if(velocity(i)*3.6 <= 40 && velocity(i)*3.6 >= 20)
                eletric_power_consumption(i) = eletric_power_consumption(i)/2;
                combustion_power_consumption(i) = combustion_power_consumption(i)/2; 
            end
            if(velocity(i)*3.6 > 40)
                eletric_power_consumption(i) = 0;
            end
       end
       cost_electricity_spent_per_cycle = cost_electricity * trapz(time, eletric_power_consumption)/(1000*3600); % [kWh]
       cost_combustion_spent_per_cycle = cost_diesel * trapz(time, combustion_power_consumption)/(1000*3600); % [kWh]
       total_cost_spent_per_cycle = cost_combustion_spent_per_cycle + cost_electricity_spent_per_cycle; 
       
       [energy_recovered_per_clyce, energy_spent_per_cycle] = AuxEnergyCalculator(time, power_consumption);
       energy_recovered_per_cycle = energy_recovered_per_clyce/(1000*3600); % [kWh]
       total_cost_recovered_per_cycle = energy_recovered_per_cycle*cost_electricity;
       total_cost = (total_cost_recovered_per_cycle + total_cost_spent_per_cycle)*number_of_cycles;
   end
end

