function GUI()
    % Create the figure
    f = figure('Position',[300, 200, 500, 450],'Name','Drug Elimination GUI');

    % Labels and input fields
    uicontrol(f,'Style','text','Position',[50,400,100,20],'String','C₀ (Initial)');
    C0_edit = uicontrol(f,'Style','edit','Position',[160,400,100,20],'String','100');

    uicontrol(f,'Style','text','Position',[50,370,100,20],'String','k (Rate const)');
    k_edit = uicontrol(f,'Style','edit','Position',[160,370,100,20],'String','0.1');

    uicontrol(f,'Style','text','Position',[50,340,100,20],'String','h (Step size)');
    h_edit = uicontrol(f,'Style','edit','Position',[160,340,100,20],'String','0.1');

    uicontrol(f,'Style','text','Position',[50,310,100,20],'String','t_{final}');
    tfinal_edit = uicontrol(f,'Style','edit','Position',[160,310,100,20],'String','10');

    % Dropdown for method selection
    uicontrol(f,'Style','text','Position',[50,270,120,20],'String','Numerical Method');
    method_popup = uicontrol(f,'Style','popupmenu','Position',[180,270,180,25],...
        'String',{'Euler Forward','Euler Backward','Heun''s','Midpoint','RK4','Adams-Bashforth','Adams-Moulton'});

    % Solve Button
    uicontrol(f,'Style','pushbutton','Position',[200,230,80,30],'String','Solve',...
        'Callback',@solve_callback);

    % Axes for plot
    ax = axes(f,'Units','pixels','Position',[70,20,350,190]);

    function solve_callback(~,~)
        % Get user input
        C0 = str2double(get(C0_edit,'String'));
        k = str2double(get(k_edit,'String'));
        h = str2double(get(h_edit,'String'));
        tf = str2double(get(tfinal_edit,'String'));
        method_id = get(method_popup,'Value');
        
        % Time vector
        t = 0:h:tf;
        N = length(t);

        % Solve using selected method
        switch method_id
            case 1 % Euler Forward
                [~, C] = EulerForward(@(t, C) -k*C, 0, tf, C0, h);
            case 2 % Euler Backward
                [~, C] = EulerBackward(@(t, C) -k*C, 0, tf, C0, h);
            case 3 % Heun
                [~, C] = HeunsMethod(@(t, C) -k*C, 0, tf, C0, h);
            case 4 % Midpoint
                [~, C] = MidpointMethod(@(t, C) -k*C, 0, tf, C0, h);
            case 5 % RK4
                [~, C] = rk4_classical(@(t, C) -k*C, 0, tf, C0, h);
            case 6 % Adams-Bashforth
                [~, C] = adams_bashforth(@(t, C) -k*C, 0, tf, C0, h);
            case 7 % Adams-Moulton
                [~, C] = lmm_adams_moulton(@(t, C) -k*C, 0, tf, C0, h);
            otherwise
                errordlg('Invalid method selection');
                return;
        end

        % Plot result
        cla(ax);
        plot(ax, t, C, 'b-', 'LineWidth', 2);
        title(ax,'Drug Elimination');
        xlabel(ax,'Time');
        ylabel(ax,'Concentration');
        grid(ax,'on');
    end
end
