
  % adams_bashforth2: Two-step Adams-Bashforth method for solving ODEs.
  
  function[x, y] = adams_bashforth2(f, xinit, xend, yinit, h)
 
  n = round((xend - xinit) / h);

  x = zeros(1, n + 1);
  y = zeros(1, n + 1);

  x(1) = xinit;
  y(1) = yinit;
  
  for i = 1:n
    x(i + 1) = x(i) + h;
  end
  y(2) = y(1) + h * f(x(1), y(1));
  
  for i = 2:n
    y(i + 1) = y(i) + (h / 2) * (3 * f(x(i), y(i)) - f(x(i - 1), y(i - 1)));
  end
end

