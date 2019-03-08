%Estimation of function roots
function [ R ] = estimation (f ,a ,b )
    %Defining functions
    f = inline(f);
    n = 1;
    
    for i = a : b-1
        %Evaluate y
        y = feval(f,i);
        %Evaluate next value of y
        y1 = feval(f,i+1);
        %check if the root has been found
        if(y<=0 && y1 >=0)||(y>=0 && y1 <=0)
            R(n) = i;
            n = n+1;
        end
    end
end