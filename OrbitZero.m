function [ measure ] = OrbitZero( c )
%this code measure if 0 converge and how fast it converge
syms z;
sol = solve(z^2 + c == z, z ); %solve fixpoint
fixpt1=sol(1);
fixpt2=sol(2);
%all point will eventually conv to fix point or diverge
zk=0;
i=0;
index = 0;
Max = 100;
kcount =0;
iflag1 = 0;
iflag2 = 0;
err1=0;
err2=0;
        while kcount<Max & abs(zk)<100 & iflag1<5 & iflag2<5,
            % exit iteration when (1) total iteration too large
            %(2) zk too large that sequence definitely diverge
            %(3)zk stay close to a fix point for a while so that it will 
            %eventually converge to this fix point
            kcount = kcount+1;
            zk = zk^2+c;            %iteration happen here
            zk;
            err1 = abs(zk-fixpt1);% test for conv to fpt1;
            if err1 < 10^-6 
                iflag1 = iflag1 + 1; index=1; 
            else
                iflag1 = 0;
            end;
            
            err2 = abs(zk-fixpt2);% test for conv to fpt2;
            if err2<10^-6
                iflag2 = iflag2 + 1; index=1; 
            else
                iflag2 = 0;
            end;
        
        end;
        
measure = -1;


if index ==0  %means orbit div
    measure = kcount/Max; %this numb(0-1) measure how fast it div. Larger means slower.
end

end

