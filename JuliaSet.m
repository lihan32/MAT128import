function [ output ] = JuliaSet( c )


syms z;

sol = solve(z^2 + c == z, z ); %solve fixpoint
fixpt1=sol(1);
fixpt2=sol(2);
%all point will eventually conv to fix point or diverge




MaxIteration = 10; %the max number of iteration

%Call Generator to find the julia set
%M=[];
%N=[];
%M store the real part of 2^n root of fixpt
%N store the imag part of 2^n root of fixpt
M=[real(fixpt1),real(fixpt2)];
N=[imag(fixpt1),imag(fixpt2)];
[M,N,a1,a2,a3]=JuliaGenerator(M,N,MaxIteration,0,fixpt1,c);
[M,N,a1,a2,a3]=JuliaGenerator(M,N,MaxIteration,0,fixpt2,c);

%plot
plot(M,N,'.')

output =1;%means program run good


end

