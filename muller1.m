function x2 = muller1(p,x0,x1,x2)

approx = [];
px0 = polyval(p,x0);
px1 = polyval(p,x1);

for i = 1:100 %Maximum iterations = 100
    px2 = polyval(p,x2);
    z1 = x1 - x0;
    z2 = x2 - x1;
    
    del1 = (px1 - px0)/z1;
    del2 = (px2 - px1)/z2;
    
    d = (del2 - del1)/(x2 - x0);
    b = del2 + z2 * d;
    %discriminant
    D = sqrt(b*b + 4*px2*d);
    %checking which denominator is bigger
    if abs(b - D) < abs(b + D)
        E = b + D;
    else
        E = b - D;
    end
    
    z = -2 * px2 / E;
    x0 = x1;
    x1 = x2;
    x2 = x2 + z;
    approx = [approx; x2];
    
    if abs(z) < 1e-12
        disp('Zero point, x = ');
        disp(x2);
        disp(['f(x) = ',num2str(polyval(p,x2))]);
        disp(['Number of iterations: ',num2str(i)]);
        disp('Iterations ');
        disp(approx);
        return;
    end
    px0 = px1;
    px1 = px2;
end
error('Number of iterations exceeded');
    