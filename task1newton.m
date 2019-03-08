%interval
a = -5;
b = 10;
%function
syms x real;
f = -1.5 + 0.3*x - x*exp(-x);
%estimation
R = estimation(f, a, b);
n = length(R);
%displaying estimated roots
disp('Estimated roots: ');
disp(R);
%solutions using bisection method and newton method
%initialisation
regulafalsiR = zeros(n, 1);
newtonR = zeros(n, 1);


%Regula Falsi method
disp('Regula Falsi Method:');
for k=1:n
    regulafalsiR(k) = false_position2(f,R(k),(R(k)+1));
end

%Newton's method
disp('Newton''s method:');
for j = 1:n
    newtonR(j)=newton(f,R(j));
end


%Graphing the results
f = inline(f);
j = 1;

for i = -5:0.1:10
    y(j)=feval(f,i);
    j = j + 1;
end

i = -5:0.1:10;
plot(i,y,'b');
axis([-5 10 -10 30]);
grid on
hold on
plot(regulafalsiR,0,'o g');
plot(newtonR,0,'x r');
title('Task I: Finding zeros of function');
xlabel('x');
ylabel('y');