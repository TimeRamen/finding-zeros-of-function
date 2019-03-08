function x = muller2(p,dP,dP2,x)

approx = [];
c = polyval(p,x);

for i = 1:100 %Maximum iterations = 100
    a = 0.5 * polyval(dP2,x);
    b = polyval(dP,x);
    
    sqrtdel = sqrt(b*b - 4*a*c);
    x1 = -2 * c/(b + sqrtdel);
    x2 = -2 * c/(b - sqrtdel);
    
    if abs(x1) < abs(x2)
        x = x + x1;
    else
        x = x + x2;
    end
    
    approx = [approx; x];
    c = polyval(p,x);
    
    if abs(c) < 1e-12
        disp('Zero point, x = ');
        disp(x);
        disp(['f(x) = ',num2str(c)]);
        disp(['Number of iterations: ',num2str(i)]);
        disp('Iterations ');
        disp(approx);
        return;
    end
end
error('Number of iterations exceeded');