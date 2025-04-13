function drug_elimination_gui
    % Create the figure
    fig = figure('Name', 'Drug Elimination Model', 'Position', [100 100 400 400]);

    % Input fields
    uicontrol('Style', 'text', 'Position', [30 350 60 20], 'String', 'C0:');
    c0_input = uicontrol('Style', 'edit', 'Position', [100 350 100 20], 'String', '100');

    uicontrol('Style', 'text', 'Position', [30 310 60 20], 'String', 'k:');
    k_input = uicontrol('Style', 'edit', 'Position', [100 310 100 20], 'String', '0.1');

    uicontrol('Style', 'text', 'Position', [30 270 60 20], 'String', 'h:');
    h_input = uicontrol('Style', 'edit', 'Position', [100 270 100 20], 'String', '0.5');

    uicontrol('Style', 'text', 'Position', [30 230 60 20], 'String', 't_final:');
    t_input = uicontrol('Style', 'edit', 'Position', [100 230 100 20], 'String', '10');

    % Dropdown for method selection
    uicontrol('Style', 'text', 'Position', [30 190 100 20], 'String', 'Method:');
    method_menu = uicontrol('Style', 'popupmenu', 'Position', [130 190 100 20], ...
        'String', {'Euler', 'Heun', 'RK4'});

    % Plot button
    uicontrol('Style', 'pushbutton', 'String', 'Solve & Plot', ...
        'Position', [100 140 150 30], 'Callback', @solveODE);

    % Axes for plotting
    ax = axes('Units', 'pixels', 'Position', [50 20 300 100]);

    % Callback function
    function solveODE(~, ~)
        C0 = str2double(get(c0_input, 'String'));
        k = str2double(get(k_input, 'String'));
        h = str2double(get(h_input, 'String'));
        tf = str2double(get(t_input, 'String'));
        method_idx = get(method_menu, 'Value');

        t = 0:h:tf;
        C = zeros(size(t));
        C(1) = C0;

        % Choose method
        for i = 1:(length(t)-1)
            switch method_idx
                case 1  % Euler
                    C(i+1) = C(i) + h * (-k * C(i));
                case 2  % Heun
                    k1 = -k * C(i);
                    k2 = -k * (C(i) + h * k1);
                    C(i+1) = C(i) + (h/2) * (k1 + k2);
                case 3  % RK4
                    k1 = -k * C(i);
                    k2 = -k * (C(i) + 0.5*h*k1);
                    k3 = -k * (C(i) + 0.5*h*k2);
                    k4 = -k * (C(i) + h*k3);
                    C(i+1) = C(i) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
            end
        end

        % Plot result
        plot(ax, t, C, 'LineWidth', 2);
        title(ax, 'Drug Concentration Over Time');
        xlabel(ax, 'Time (t)');
        ylabel(ax, 'Concentration (C)');
        grid(ax, 'on');
    end
end

