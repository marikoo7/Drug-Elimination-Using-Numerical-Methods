function [x, y] = adams_bashforth(f, xinit, xend, yinit, h, order)
  n = (xend - xinit) / h;

  x = zeros(1, n+1);
  y = zeros(1, n+1);

  x(1) = xinit;
  y(1) = yinit;

  for i = 1:n
      x(i+1) = x(i) + h;
  end

  if order == 1
    for i = 1:n
      y(i+1) = y(i) + h * f(x(i), y(i));
    end

  elseif order == 2

    y(2) = y(1) + h * f(x(1), y(1));
    for i = 2:n
      y(i+1) = y(i) + h * (3/2 * f(x(i), y(i)) - 1/2 * f(x(i-1), y(i-1)));
    end

  elseif order == 3
    y(2) = y(1) + h * f(x(1), y(1));
    y(3) = y(2) + h * (3/2 * f(x(2), y(2)) - 1/2 * f(x(1), y(1)));
    for i = 3:n
      y(i+1) = y(i) + h * (23/12 * f(x(i), y(i)) - 4/3 * f(x(i-1), y(i-1)) + 5/12 * f(x(i-2), y(i-2)));
    end

  elseif order == 4
    y(2) = y(1) + h * f(x(1), y(1));
    y(3) = y(2) + h * (3/2 * f(x(2), y(2)) - 1/2 * f(x(1), y(1)));
    y(4) = y(3) + h * (23/12 * f(x(3), y(3)) - 4/3 * f(x(2), y(2)) + 5/12 * f(x(1), y(1)));
    for i = 4:n
      y(i+1) = y(i) + h * (55/24 * f(x(i), y(i)) - 59/24 * f(x(i-1), y(i-1)) + 37/24 * f(x(i-2), y(i-2)) - 3/8 * f(x(i-3), y(i-3)));
    end
  end
end
