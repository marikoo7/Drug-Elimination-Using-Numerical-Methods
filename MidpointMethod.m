function [x,y] = MidpointMethod(f,xinit,xend,yinit,h)
  N=(xend-xinit)/h;
  x= zeros(1,N+1);
  y= zeros(1,N+1);
  x(1) = xinit;
  y(1) = yinit;
  for i=1:N
    x(i+1) = x(i)+h;
    ymid = y(i) + (h / 2) * feval(f, x(i), y(i));
    y(i+1) = y(i) + h*feval(f,x(i)+h/2,ymid);
  end;
  end;

