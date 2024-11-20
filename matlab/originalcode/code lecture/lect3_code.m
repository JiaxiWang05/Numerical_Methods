% Code used during Lecture 3
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       15/10/19
%


% Display values in long format
format long

% Truncated Taylor's series of sin(x)
t0 = @(x,h) sin(x);  
t1 = @(x,h) sin(x)+cos(x)*h;
t2 = @(x,h) sin(x)+cos(x)*h-sin(x)*(h^2)/2;
t3 = @(x,h) sin(x)+cos(x)*h-sin(x)*(h^2)/2-cos(x)*(h^3)/6+sin(x)*(h^4)/24;
t4 = @(x,h) sin(x)+cos(x)*h-sin(x)*(h^2)/2-cos(x)*(h^3)/6+sin(x)*(h^4)/24+cos(x)*(h^5)/120;

% Set values for x and h
x = 0;
h = 0.01;

% Compute truncated series
values = [t0(x,h),t1(x,h),t2(x,h),t3(x,h),t4(x,h)]';

% Compute errors
err = abs(sin(x+h)-values);

T = table(values,err);
T


% Set values for x and h
x = pi/2;
h = 0.01;

% Compute truncated series
values = [t0(x,h),t1(x,h),t2(x,h),t3(x,h),t4(x,h)]';

% Compute errors
err = abs(sin(x+h)-values);

T = table(values,err);
T