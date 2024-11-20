clear , close all;
 Fs=60;
 t=0:1/Fs:20-1/Fs;
 y=square(t,50);
 y(y>0)=1;
 y(y<0)=-1;
 figure, 
 axis ([0 20 -20 10])
 % Fourier Series 
 a0=0;
 Fy=zeros(size(t));
 N=30;
 for n=1:2:N
      Fy = Fy +4/(n*pi)*sin(n*t);
 end
 hold on,
 plot(t,y,'Color',[0.5 0.5 0.5])
 plot(t,Fy,'k')
 axis([0 12 -1.5 1.5])