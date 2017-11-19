%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   Rosenbrock
%   Function, n = 2
%   For Q2
%%%%%%%%%%%%%%%%%%%%

% Input
% -----
% x: 1-D vector of function inputs.
%
% Output
% ------
% fout: Objective function output. With quadratic penalty.
% gout: Gradient vector result for the objective function.

function [fout, gout] = Rose2(x)
%% Setting up the objective, constraint and gradient functions.
rose =@(x) 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
grad =@(x) [2*x(1) - 400*x(1)*(- x(1)^2 + x(2)) - 2;
                               -200*x(1)^2 + 200*x(2)];

g =@(x) [(x - 5); (-5 - x)];
h =@(x) [0];

%% Setting up and computing the quadratic penalty additions.
PenaltyFunc1 =@(g, x) max(0, g(x)).^2;
PenaltyFunc2 =@(h, x) h(x).^2;

pen1Total(1, :) = PenaltyFunc1(g, x);
pen2Total(1, :) = PenaltyFunc2(h, x);

pen1Total = sum(pen1Total);
pen2Total = sum(pen2Total);

%% Computing the objective function, with penalty, and the gradient.
fout = rose(x) + pen1Total + pen2Total;
gout = grad(x);
                           
end

