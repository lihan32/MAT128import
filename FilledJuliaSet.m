%input an value c, which is the constant term in f(z)=z^2 + c
%Then this function return a map of filled julia set of orbit of f(z)
function [ M ] = FilledJuliaSet( c )

syms z;

sol = solve(z^2 + c == z, z ); %solve fixpoint
fixpt1=sol(1);
fixpt2=sol(2);
%all point will eventually conv to fix point or diverge


%colormap([1 0 0; 1 1 1]); %set color

M=ones(14,36);%initialize map

for j= 1:14,               %set imaginary part accuracy 0.01
    y=-0.7 +(j-1)*0.1;    %from-.7 to .7
    for i =1:36,
        x = -1.8+(i-1)*0.1; %set real part accuracy 0.01
        z =x+1i*y;          %from -1.8 to 1.8
        zk =z;
        iflag1 = 0;%index to record iterations;
        iflag2 = 0;
        kcount = 0; %count the total number;
        [x,y];
        while kcount<20 & abs(zk)<5 & iflag1<2 & iflag2<2,
            % exit iteration when (1) total iteration too large
            %(2) zk too large that sequence definitely diverge
            %(3)zk stay close to a fix point for a while so that it will 
            %eventually converge to this fix point
            kcount = kcount+1;
            zk = zk^2+c;            %iteration happen here
            err1 = abs(zk-fixpt1);% test for conv to fpt1;
            if err1 < 1.e-8, iflag1 = iflag1 + 1; else, iflag1 = 0;end;
            
            err2 = abs(zk-fixpt2);% test for conv to fpt2;
            if err2<1.e-8, iflag2 = iflag2 + 1; else, iflag2 = 0;end;  
        
        end;
        kcount;
        if iflag1 >=2 | iflag2 >=2 |kcount >=20, %if orbit is bounded, set color to red;
            M(j,i) = 255;
        else
            M(j,i) = floor(kcount/20*255);
        end;
    end;
end;

image([-1.8,1.8],[-0.7,0.7],M),
axis xy

end

