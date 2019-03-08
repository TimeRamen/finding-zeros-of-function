function [ c ] = modified_false_position(f, a, b)
    %Defining function
    f = inline(f);
    %Checking f(a)
    ya = feval(f,a);
    %Checking f(b)
    yb = feval(f,b);
    
    iter = 0;
    while (iter < 1000) && (b-a)>10e-12
        %c = (a + b)/2;
        c = (a*yb/2 - b *ya)/(yb/2 - ya);
        yc = feval(f,c);
        
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
    
    c = (a+b)/2;
    
    disp('Root:');
    disp(c);
    disp('Iterations:');
    disp(iter);
    
    

end