% Script to show how to use the Fourier Method to identify a signal from
% the background noise.
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       08/02/19
%

% We are going to create a signal three sinusoidal functions of different
% amplitudes and frequancies

%Amplitudes
A1 = 10;
A2 = 12;
A3 = 15;

%Frequencies
F1 = 6;               % hertz
F2 = 10;              % hertz
F3 = 20;              % hertz

Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

% Generation of the signal

S = A1*sin(2*pi*F1*t) + A2*sin(2*pi*F2*t) + A3*sin(2*pi*F3*t);

figure;
plot(t,S);
xlabel('time (in seconds)');
ylabel('Amplitude');
title('Signal without noise');

pause;

% Add noise to the signal
X = S + 10*randn(size(t));

figure;
plot(t,X);
xlabel('time (in seconds)');
ylabel('Amplitude');
title('Signal with noise');

pause;

% Compute the amplitude of the harmonics using the Fourier method
Y = fft(X);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
figure
plot(f,P1) 
title('Spectrum of X(t)')
xlabel('Frequancy (Hz)')
ylabel('Amplitude')

pause;

Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

figure
plot(f,P1) 
title('Spectrum of S(t)')
xlabel('Frequancy (Hz)')
ylabel('Amplitude')
