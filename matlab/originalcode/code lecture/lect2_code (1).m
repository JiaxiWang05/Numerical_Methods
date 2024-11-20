% Code used during Lecture 2
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       8/10/19
%

% Display values in engineering format
format shorteng

% Set values for h
h = 0.1./2.^(0:5);

% Init vectors to contain results
gradf = zeros(6,1);
gradb = zeros(6,1);
gradc = zeros(6,1);

% Compute resutls
for i=1:6
    gradf(i) = forward_diff( @cos, pi/6, h(i) );
    gradb(i) = backward_diff( @cos, pi/6, h(i) );
    gradc(i) = central_diff( @cos, pi/6, h(i) );
end

% Compute errors 
errf = abs(-0.5 - gradf);
errb = abs(-0.5 - gradb);
errc = abs(-0.5 - gradc);

% Create table with results
T = table(h', gradf, errf, gradb, errb, gradc, errc);
T