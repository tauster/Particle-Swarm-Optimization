%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   P3 Function
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

function [fout, gout] = P3FuncQ2(x)
%% Setting up the objective, constraint and gradient functions.
p3 =@(x) x(1)^2 + 0.5*x(1) + 3*x(1)*x(2) + 5*x(2)^2;

g =@(x) [(3*x(1) + 2*x(2) + 2); (15*x(1) - 3*x(2) - 1);...
         (x(1) - 1); (-x(1) - 1);...
         (x(2) - 1); (-x(2) - 1)];

h =@(x) [0];

grad =@(x) [2*x(1) + 3*x(2) + 1/2;
            3*x(1)];

%% Setting up and computing the quadratic penalty additions.
PenaltyFunc1 =@(g, x) max(0, g(x)).^2;
PenaltyFunc2 =@(h, x) h(x).^2;

pen1Total(1, :) = PenaltyFunc1(g, x);
pen2Total(1, :) = PenaltyFunc2(h, x);

pen1Total = sum(pen1Total);
pen2Total = sum(pen2Total);

%% Computing the objective function, with penalty, and the gradient.
fout = p3(x) + pen1Total + pen2Total;
gout = grad(x);
                           
end

