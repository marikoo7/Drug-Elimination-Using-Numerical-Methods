function plot_connection(t, C1, C2, C3, C4, C5, C6, C7)
    figure;
    plot(t, C1, '-o', 'LineWidth', 2); hold on;
    plot(t, C2, '--s', 'LineWidth', 2);
    plot(t, C3, '-.^', 'LineWidth', 2);
    plot(t, C4, '-d', 'LineWidth', 2);
    plot(t, C5, '-x', 'LineWidth', 2);
    plot(t, C6, '-v', 'LineWidth', 2);
    plot(t, C7, '-p', 'LineWidth', 2);


    title('Drug Concentration vs Time');
    xlabel('Time (hours)');
    ylabel('Concentration (mg/L)');
    legend( 'EulerForward','Midpoint','rung_cutto','HeunsMethod','adams_bashforth', 'lmm_adams_moulton','EulerBackward');
    grid on;
end
