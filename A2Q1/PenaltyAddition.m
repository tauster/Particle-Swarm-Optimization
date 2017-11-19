%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   Penalty Term
%%%%%%%%%%%%%%%%%%%%

% Input
% -----
% g: 1-D array of g_i(x) <= 0 constraints.
% h: 1-D array of h_i(x) = 0 constraints.
% x: 1-D array of function inputs.
% n: Number of dimmensions.
%
% Output
% ------
% p: Quadratic penalty function result.

function p = PenaltyAddition(g, h, x, n)
%% Setting up the g/h parts of the quadratic penalty function.
PenaltyFunc1 =@(g, x) max(0, g(x)).^2;
PenaltyFunc2 =@(h, x) h(x).^2;

%% Computing the g/h parts for x.
pen1Total(1, :) = PenaltyFunc1(g, x);
pen2Total(1, :) = PenaltyFunc2(h, x);

%% Comupting the sum for the quadratic penalty function.
pen1Total = sum(pen1Total);
pen2Total = sum(pen2Total);

%% Computing the final result of the quadratic penalty function.
p = pen1Total + pen2Total;

end

