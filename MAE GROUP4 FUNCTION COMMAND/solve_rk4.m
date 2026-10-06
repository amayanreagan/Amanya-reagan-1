function [x, y] = solve_rk4()
 
    f = @(x, y) x + y;
    
    x0 = 0;
    y0 = 1;
    h = 0.1;
    xf = 0.4;
   
    N = round((xf - x0) / h);
   
    x = zeros(N + 1, 1);
    y = zeros(N + 1, 1);
   
    x(1) = x0;
    y(1) = y0;
   
    for n = 1:N
        x_current = x(n);
        y_current = y(n);
        
        k1 = f(x_current, y_current);
        k2 = f(x_current + h/2, y_current + (h/2)*k1);
        k3 = f(x_current + h/2, y_current + (h/2)*k2);
        k4 = f(x_current + h, y_current + h*k3);
        
        x(n + 1) = x_current + h;
        y(n + 1) = y_current + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
    
    fprintf('Step\t    x\t\t    y\n');
    for i = 1:length(x)
        fprintf('%d\t%6.1f\t%12.6f\n', i-1, x(i), y(i));
    end
end
