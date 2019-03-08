function x = laguerre(p,dP,dP2,x)
    approx = [];
    n = length(p) - 1;
    for i = 0:100 %Maximum number of iterations = 100
        px = polyval(p,x);
        if abs(px) < 1e-12
            disp('Zero point, x = ');
            disp(x);
            disp(['f(x) = ', num2str(c)]);
            disp(['Number of iterations: ',num2str(i)]);
            disp('Iterations');
            disp(approx);
            return;
        end
        G = polyval(dP,x)/px;
        H = G*G - polyval(dP2,x)/px;
        c = sqrt((n-1)*(n*H - G*G));
        if abs(G-c) > abs(G+c)
            x = x - (n/(G-c));
        else
            x = x - (n/(G+c));
        end
        approx = [approx; x];
    end
    error('Number of iterations exceeded');
end