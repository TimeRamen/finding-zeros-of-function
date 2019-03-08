format long;
p = [-2, 2, 5, 2, 2];
dP = polyder(p);
dP2 = polyder(dP);

disp('Error tolerance is 10^-12');
disp('Searching roots of polynomial p(x)');
disp('Coefficients of f(x) = ');
disp(p);
disp('Coefficients of f''(x) = ');
disp(dP);
disp('Coefficients of f''''(x) = ');
disp(dP2);

for x2 = [-1, 2, 1i, -1i]
    disp(['Initial point = ', num2str(x2)]);
    
    disp('Laguerre''s method');
    x_laguerre = laguerre(p,dP,dP2, x2);
    
    disp('Muller''s MM2 method');
    x_muller2 = muller2(p,dP,dP2, x2);
    
    if not(isreal(x_laguerre))
        continue;
    end
    
    X = (x2 - 1):0.01:(x2+1);
    figure;
    plot(X,polyval(p,X),'b-',x_muller2,0,'cx',x_laguerre,0,'rx',x2,0,'g*');
    legend('f(x)','zero point (Muller 2)','zero point(Laguerre)','initial point');
    xlabel('x');
    ylabel('y');
    title('Real zero');
    grid on;
end