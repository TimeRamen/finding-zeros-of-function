function [ c ] = false_position2(f, a, b)
    %Defining function
    f = inline(f);
    %Checking f(a)
    ya = feval(f,a);
    %Checking f(b)
    yb = feval(f,b);
    
    iter = 0;
    while (iter < 1000) && (b-a)>10e-12
        %false position
        c = (a*yb - b *ya)/(yb - ya);
        %find f(c)
        yc = feval(f,c);
        %if f(c) = 0,root has been found.
        if(yc==0)
            a=c;
            b=c;
            break
        elseif(yb*yc>0)
            b=c;
            yb=yc;
        else
            a=c;
            ya=yc;
        end
        
        %Number of iterations is incremented
        iter = iter + 1;
        %Iterations are printed along with current zero
        fprintf('%d\t%f \n',iter,c);
        
    end
    
    c = (a*yb - b *ya)/(yb - ya);
    
    disp('Root:');
    disp(c);
    disp('Iterations:');
    disp(iter);
    
    

end