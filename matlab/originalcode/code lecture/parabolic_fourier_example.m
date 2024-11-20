% Solution to the parabolic PDE discussed in class.
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       18/11/21
%

% Thermal diffusivity
c = 1;

% Length of the rod
L = 10;

% Partition of x
x = [0:0.1:L];

% Partition of t
t = [0:0.1:20];

% Number of modes to consider
N = 200;

u = zeros(size(x,2),size(t,2));

% Calculation of the solution
for i=1:size(t,2)
    for j=0:N
        u(:,i) = u(:,i) + (4/pi/(1+2*j)*sin((1+2*j)*pi*x/(2*L)).* ...
            exp(-(1+2*j)^2*pi^2*c*t(i)/4/L^2))';
    end
end

figure
plot(x,u(:,1))

for i=1:size(t,2)
    plot(x,u(:,i))
    axis([0 L 0 1.2])
    pause(0.1)
end
