function gradient = backward_diff( F, x, h )
% backward_diff   Backward Difference Gradient
%
% usage:    gradient = backward_diff( F, x, h )
%
% example:    gradient = backward_diff( @cos, pi/6, 0.5 )
%
% inputs:   F - Function to be differentiated with respect to x
%           x - Coordinate where F is evaluated
%           h - Value of the step size h
%
% output:  gradient - numerically evaluated gradient by
%                     backward difference
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       17/11/13
%

gradient = (F(x)-F(x-h))./h;
