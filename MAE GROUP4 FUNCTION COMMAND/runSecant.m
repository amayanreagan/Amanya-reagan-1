function root = runSecant(x0, x1, tol)
    max_iter = 100;
    
    for iter = 2:max_iter
        fx0 = f(x0);
        fx1 = f(x1);
        
        x_next = x1 - fx1 * (x1 - x0) / (fx1 - fx0);
        
        if abs(x_next - x1) < tol
            root = x_next;
            fprintf('Root found at x = %.6f\n', root);
            return;
        end
        
        x0 = x1;
        x1 = x_next;
    end
    root = x1;
end

function y = f(x)
    y = x - 2*sin(x);
end
