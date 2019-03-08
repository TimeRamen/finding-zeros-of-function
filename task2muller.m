format long;

p = [-2, 2, 5, 2, 2];

dP = polyder(p);
dP2 = polyder(dP);

%f = @(x) polyval(p,x);
%df = @(x) polyval(dP,x);

syms x real;
fn = -2*x*x*x*x + 2*x*x*x + 5*x*x + 2*x + 2;

disp('Error tolerance is 10^-12');
disp('Searching roots of polynomial p(x)');
disp('Coefficients of f(x) = ');
disp(p);
disp('Coefficients of f''(x) = ');
disp(dP);
disp('Coefficients of f''''(x) = ');
disp(dP2);

X = (-3):0.01:3;
figure;
plot(X,polyval(p,X));
legend('f(x)');
xlabel('x');
ylabel('y');
grid on;

start = zeros(3,4);
start(:,1) = [-2;-1.5;-1];
start(:,2) = [2;2.5;3];
start(:,3) = [0;1i;2*1i];
start(:,4) = [0;-1i;-2*1i];

for interval = start
    x0 = interval(1);
    x1 = interval(2);
    x2 = interval(3);
    
    disp('Muller''s MM1 Method');
    disp(['initial point = [' num2str(x0), ',', num2str(x1),',',num2str(x2),']']);
    x_muller1 = muller1(p,x0,x1,x2);
    
    disp('Muller''s MM2 Method');
    disp(['initial point = ' num2str(x2)]);
    x_muller2 = muller2(p,dP,dP2,x2);
    
    if not(isreal(x_muller1))
        continue;
    end
    
    disp('Newton''s Method');
    disp(['Initial point = ', num2str(x2)]);
    x_newton = newton(fn,x2);
    
    X = x0:0.01:x2;
    figure;
    plot(X,polyval(p,X),'-b',x_muller2,0,'cx',x_newton,0,'rx',x2,0,'g*');
    legend('f(x)','Zero point (MM2)','Zero point (Newton)','Initial point');
    xlabel('x');
    ylabel('y');
    title('Real Zero');
    grid on;
end

    