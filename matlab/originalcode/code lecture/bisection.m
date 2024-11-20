function c = bisection(a,b,f)
% bisection   Bisection method to find a root.
%
% usage:    x = bisection(a,b,f)
%
% example:  f = @(x)x; c = bisection(-1,1,f)
%
% inputs:   a,b - Extrema for the searching interval.
%           f - Function to study.
%
% output:  c - approximated value of the root.
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       21/09/21
%

% variable initialisation
n = 1;
y = f(b);

% loop with stopping criteria
while n<1000
   % new midpoint 
   c =  (a + b)/2; 
   % calculate new approximation of the root
   y_old = y;
   y = f(c);
   % check if the approximated root is good enough
   if abs(f(c))<1e-8 || abs(y-y_old)/2<1e-8
       break
   end
   % update interval for the search
   if sign(y)==sign(f(a))
       a = c;
   else
       b = c;
   end
   n = n+1;
end