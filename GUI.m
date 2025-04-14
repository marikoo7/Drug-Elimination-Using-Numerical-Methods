function GUI
    fig = figure('Name', 'Drug Elimination Model', 'Position', [100 100 400 400]);

    % Inputs
    uicontrol('Style', 'text', 'Position', [30 350 60 20], 'String', 'C0:');
    c0_input = uicontrol('Style', 'edit', 'Position', [100 350 100 20], 'String', '100');

    uicontrol('Style', 'text', 'Position', [30 310 60 20], 'String', 'k:');
    k_input = uicontrol('Style', 'edit', 'Position', [100 310 100 20], 'String', '0.1');

    uicontrol('Style', 'text', 'Position', [30 270 60 20], 'String', 'h:');
    h_input = uicontrol('Style', 'edit', 'Position', [100 270 100 20], 'String', '0.1');

    uicontrol('Style', 'text', 'Position', [30 230 60 20], 'String', 't_{final}:');
    tf_input = uicontrol('Style', 'edit', 'Position', [100 230 100 20], 'String', '10');

    % Dropdown for methods
    uicontrol('Style', 'text', 'Position', [30 190 100 20], 'String', 'Method:');
    method_menu = uicontrol('Style', 'popupmenu', 'Position', [130 190 150 25], ...
        'String', {'Euler', 'Heun', 'RK4', 'Midpoint', 'Euler Backward', 'Adams-Bashforth', 'Adams-Moulton'});

    % Solve Button
    uicontrol('Style', 'pushbutton', 'String', 'Solve & Plot', ...
        'Position', [100 140 150 30], 'Callback', @solveODE);

    function solveODE(~, ~)
        % Get inputs
        C0 = str2double(get(c0_input, 'String'));
        k = str2double(get(k_input, 'String'));
        h = str2double(get(h_input, 'String'));
        tf = str2double(get(tf_input, 'String'));
        method_list = get(method_menu, 'String');
        method_idx = get(method_menu, 'Value');
        method_name = method_list{method_idx};

        % Define time vector and differential equation
        f = @(t, C) -k * C;
        t = 0:h:tf;

        % Call appropriate method
        switch method_name
            case 'Euler'
                [~, C] = EulerForward(f, 0, tf, C0, h);
            case 'Heun'
                [~, C] = HeunsMethod(f, 0, tf, C0, h);
            case 'RK4'
                [~, C] = rk4_classical(f, 0, tf, C0, h);
            case 'Midpoint'
                [~, C] = MidpointMethod(f, 0, tf, C0, h);
            case 'Euler Backward'
                [~, C] = EulerBackward(f, 0, tf, C0, h);
            case 'Adams-Bashforth'
                [~, C] = adams_bashforth(f, 0, tf, C0, h);
            case 'Adams-Moulton'
                [~, C] = lmm_adams_moulton(f, 0, tf, C0, h);
            otherwise
                errordlg('Unknown method selected!');
                return;
        end

        % Call external plot function
        plot_connection(t, C, method_name);
    end
end
