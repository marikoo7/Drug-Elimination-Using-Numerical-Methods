
function [x, y] = lmm_adams_moulton(f, x0, xn, y0, h)
    N = (xn - x0) / h;
    x = linspace(x0, xn, N+1);
    y = zeros(1, N+1);
    y(1) = y0;

    % Use RK2 to get the second value
    k1 = f(x(1), y(1));
    k2 = f(x(1) + h, y(1) + h * k1);
    y(2) = y(1) + (h/2) * (k1 + k2);

    for i = 2:N
        y(i+1) = y(i) + (h/12) * (5*f(x(i+1), y(i+1)) + 8*f(x(i), y(i)) - f(x(i-1), y(i-1)));
    end
end

