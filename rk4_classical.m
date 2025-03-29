
function [x, y] = rk4_classical(f, x0, xn, y0, h)
    N = (xn - x0) / h;
    x = linspace(x0, xn, N+1);
    y = zeros(1, N+1);
    y(1) = y0;

    for i = 1:N
        k1 = f(x(i), y(i));
        k2 = f(x(i) + h/2, y(i) + (h/2) * k1);
        k3 = f(x(i) + h/2, y(i) + (h/2) * k2);
        k4 = f(x(i) + h, y(i) + h * k3);
        y(i+1) = y(i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end
