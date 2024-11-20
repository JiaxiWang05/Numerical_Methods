function gradient = central_diff( F, x, h )
% central_diff   Central Difference Gradient
%
% usage:    gradient = central_diff( F, x, h )
%
% example:    gradient = central_diff( @cos, pi/6, 0.5 )
%
% inputs:   F - Function to be differentiated with respect to x
%           x - Coordinate where F is evaluated
%           h - Value of the step size h
%
% output:  gradient - numerically evaluated gradient by
%                     centraldifference
%
% Written by:    Stefano Giani
%                stefano.giani@durham.ac.uk
%
% Created:       17/11/13
%

gradient = (F(x+h)-F(x-h))./(2*h);
