function project(t, C1, C2, C3)
    figure;
    plot(t, C1, '-o', 'LineWidth', 2); hold on;
    plot(t, C2, '--s', 'LineWidth', 2);
    plot(t, C3, '-.^', 'LineWidth', 2);
    title('Drug Concentration vs Time');
    xlabel('Time (hours)');
    ylabel('Concentration (mg/L)');
    legend('Euler Forward', 'Midpoint', 'RK4');
    grid on;
end

