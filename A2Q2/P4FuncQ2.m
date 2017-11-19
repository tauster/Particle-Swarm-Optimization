%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   P4 Function
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

function [fout, gout] = P4FuncQ2(x)
%% Setting up the objective, constraint and gradient functions.
p4Sum1 =@(x, i) (cos(x(i))).^4;
p4Prod =@(x, i) (cos(x(i))).^2;
p4Sum2 =@(x, i) i*(x(i).^2);

for i = 1:numel(x)
    p4Sum1Total(i) = p4Sum1(x, i);
    p4ProdTotal(i) = p4Prod(x, i);
    p4Sum2Total(i) = p4Sum2(x, i);
end

p4 = -abs((sum(p4Sum1Total) - 2*prod(p4ProdTotal)) / (sqrt(sum(p4Sum2Total))));

g =@(x) [(0.75 - prod(x)); (sum(x) - ((15*numel(x)) / 2)); (x - 10); (-x)];
h =@(x) [0];

if numel(x) == 2
    grad =@(x) [(sign(cos(x(1))^4 + cos(x(2))^4 - 2*cos(x(1))^2*cos(x(2))^2)*(4*cos(x(1))^3*sin(x(1)) - 4*cos(x(1))*cos(x(2))^2*sin(x(1))))/abs(x(1)^2 + 2*x(2)^2)^(1/2) + (x(1)*abs(cos(x(1))^4 + cos(x(2))^4 - 2*cos(x(1))^2*cos(x(2))^2)*sign(x(1)^2 + 2*x(2)^2))/abs(x(1)^2 + 2*x(2)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 - 2*cos(x(1))^2*cos(x(2))^2)*(4*cos(x(2))^3*sin(x(2)) - 4*cos(x(1))^2*cos(x(2))*sin(x(2))))/abs(x(1)^2 + 2*x(2)^2)^(1/2) + (2*x(2)*abs(cos(x(1))^4 + cos(x(2))^4 - 2*cos(x(1))^2*cos(x(2))^2)*sign(x(1)^2 + 2*x(2)^2))/abs(x(1)^2 + 2*x(2)^2)^(3/2)];
elseif numel(x) == 10
    grad =@(x) [(sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(1))^3*sin(x(1)) - 4*cos(x(1))*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2*sin(x(1))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (x(1)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(10))^3*sin(x(10)) - 4*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))*sin(x(10))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (10*x(10)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(2))^3*sin(x(2)) - 4*cos(x(1))^2*cos(x(2))*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2*sin(x(2))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (2*x(2)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(3))^3*sin(x(3)) - 4*cos(x(1))^2*cos(x(2))^2*cos(x(3))*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2*sin(x(3))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (3*x(3)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(4))^3*sin(x(4)) - 4*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2*sin(x(4))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (4*x(4)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(5))^3*sin(x(5)) - 4*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2*sin(x(5))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (5*x(5)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(6))^3*sin(x(6)) - 4*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2*sin(x(6))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (6*x(6)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(7))^3*sin(x(7)) - 4*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2*sin(x(7))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (7*x(7)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(8))^3*sin(x(8)) - 4*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))*cos(x(9))^2*cos(x(10))^2*sin(x(8))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (8*x(8)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2);
                (sign(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2)*(4*cos(x(9))^3*sin(x(9)) - 4*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))*cos(x(10))^2*sin(x(9))))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(1/2) + (9*x(9)*sign(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)*abs(cos(x(1))^4 + cos(x(2))^4 + cos(x(3))^4 + cos(x(4))^4 + cos(x(5))^4 + cos(x(6))^4 + cos(x(7))^4 + cos(x(8))^4 + cos(x(9))^4 + cos(x(10))^4 - 2*cos(x(1))^2*cos(x(2))^2*cos(x(3))^2*cos(x(4))^2*cos(x(5))^2*cos(x(6))^2*cos(x(7))^2*cos(x(8))^2*cos(x(9))^2*cos(x(10))^2))/abs(x(1)^2 + 2*x(2)^2 + 3*x(3)^2 + 4*x(4)^2 + 5*x(5)^2 + 6*x(6)^2 + 7*x(7)^2 + 8*x(8)^2 + 9*x(9)^2 + 10*x(10)^2)^(3/2)];
end

%% Setting up and computing the quadratic penalty additions.
PenaltyFunc1 =@(g, x) max(0, g(x)).^2;
PenaltyFunc2 =@(h, x) h(x).^2;

pen1Total(1, :) = PenaltyFunc1(g, x);
pen2Total(1, :) = PenaltyFunc2(h, x);

pen1Total = sum(pen1Total);
pen2Total = sum(pen2Total);

%% Computing the objective function, with penalty, and the gradient.
fout = p4 + pen1Total + pen2Total;
gout = grad(x);
                           
end

