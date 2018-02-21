function [ y,measure ] = Newton( z0 )
    %input the starting point
    %output the result zero point
    %measure is the step to y if converge
    %measure is -1 if diverge
    syms f(z);
    
    %express the target function here
    f(z)=z^2+1;
    %calculate the diff of function f
    df = diff(f,z);
    %set maximun loop for Newton method
    Max = 100;
    %if zj-zi is larger than bound, we consider it as diverge
    Bound = 100;
    
    %create loop for newton method
    n=0;
    zi=z0;
    zj=zi-f(zi)/df(zi);
    while abs(zj-zi)>10^-6 & n<Max & abs(zj-zi)<Bound
        mid=zj;
        zj=zj-f(zj)/df(zj);
        zi=mid;
        n=n+1;
    end
    
    %check and output value
    if n < Max & abs(zj-zi)<Bound
        y=zj;
        measure = n;
    else
        measure = -1;
        y=z0;
    end
    
end

