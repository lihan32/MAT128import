function [ output ] = Mandelbrot( )
%this program generate a Mandelbrot pic

%initialize a pic matrix
%the size of M determine the size of picture.
%we can change the size of M
M = 255*ones(20,20);

for j= 1:20,               %set imaginary part accuracy 0.1
    y=-1 +(j-1)*0.1;    %from-1 to 1
    for i =1:20,
        x = -1+(i-1)*0.1; %set real part accuracy 0.1
        c =x+1i*y;          %from -1 to 1
        
        index = OrbitZero(c);%read the index
        
        %change the value of M based on the index
        %the index represent how fast it div
        if index > 0
            M(j,i)=floor(255*index);
        end
            
    end;
end;

image([-1,1],[-1,1],M),
colorbar
axis xy


M


end

