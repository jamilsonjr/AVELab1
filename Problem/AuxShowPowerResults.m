function [] = AuxShowPowerResults(time, power, mechanical_power, power_train)
    figure()
    plot(time, power/1000, time, mechanical_power/1000, 'LineWidth', 1);
    set( gca, 'FontSize', 11);
    title(sprintf('Power Consumption of %s Powertrain', power_train));
    xlabel('time $[s]$','Interpreter', 'latex');
    ylabel('Power [$kW$]','Interpreter', 'latex');
    legend( sprintf('%s Output Power', power_train), 'Mechanical Power');
    grid on;
end

