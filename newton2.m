%Newton's Method
function [ x ] = newton2(f, df, x )
    %Defining functions
    f = inline(f);
    df = inline(df);
    %Error
    err = 1;
    %Iterations
    iter = 0;
    %Newton's loop that stops when error is negligible or number of
    %iterations become prohibitive.
    while(iter<1000)&&(err>10e-12)
        %Newton's algorithm
        x1 = x - feval(f, x)/feval(df, x);
        %Calculation of absolute error
        err = abs(x1 - x);
        %Root/zero is updated to new value
        x = x1;
        %Number of iterations is incremented
        iter = iter + 1;
        %Iterations are printed along with current zero
        fprintf('%d\t%f \n',iter,x);
    %While loop finishes when error goes below 10e-12 or iterations go
    %beyond 1000
    end
    %Printing of the results
    disp('Root:');
    disp(x);
    disp('Iterations:');
    disp(iter);
end