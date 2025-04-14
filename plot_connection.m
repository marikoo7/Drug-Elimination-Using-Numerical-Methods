function plot_connection(t, C, method_name)
    figure;
    plot(t, C, 'LineWidth', 2);
    title(['Drug Concentration - Method: ', method_name]);
    xlabel('Time (t)');
    ylabel('Concentration (C)');
    legend(method_name);
    grid on;
end
