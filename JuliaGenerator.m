function [ M,N,j,sol1,sol2 ] = JuliaGenerator( A,B,Max,i,z,c )

[sol1,sol2]=InvImage(z,c);
M=[A,real(sol1),real(sol2)];
N=[B,imag(sol1),imag(sol2)];
j=i+1;
%M
%N

%if j<MaxIteration, then iteration with sol1 and sol2
if j<Max
    [M,N,a1,a2,a3]=JuliaGenerator(M,N,Max,j,sol1,c);
    [M,N,a1,a2,a3]=JuliaGenerator(M,N,Max,j,sol2,c);
end
end

