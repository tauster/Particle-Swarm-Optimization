%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   P4 Function
%%%%%%%%%%%%%%%%%%%%

% Input
% -----
% x: 1-D array of function inputs.
% n: Number of dimmensions.
% plot: 0 or 1. Initialize plot if 1, ignore if 0.
%
% Output
% ------
% f: P4 bump test function result.

function f = P4Function(x, n, plot)
%% Splitting the function into 3 components to compute sum and products.
p4Sum1 =@(x, i) (cos(x(i))).^4;
p4Prod =@(x, i) (cos(x(i))).^2;
p4Sum2 =@(x, i) i*(x(i).^2);

%% Computing sumations and products.
for i = 1:n
    p4Sum1Total(i) = p4Sum1(x, i);
    p4ProdTotal(i) = p4Prod(x, i);
    p4Sum2Total(i) = p4Sum2(x, i);
end

%% Initializing the plot for visializing.
if plot == 1
    plotF =@(x1, x2) -abs((((cos(x1)).^4 + (cos(x2)).^4)...
                           - 2*((cos(x1)).^2 * (cos(x2)).^2))...
                           / (sqrt(1*(x1.^2) + 2*(x2.^2))));
    figure(1)
    p4Plot = ezcontour(plotF, [0; 10; 0; 10], 120);
    hold on
    p4Plot.LevelList = [0 -0.0001 -0.002 -0.02 -0.04 -0.06 -0.08 -0.1 -0.12 -0.14 -0.16 -0.18 -0.2];
    initialSwarm = scatter(100, 100, 'rx');
    colorbar
    title('P4 PSO Test')
    legend('P4 Bump Test Function Countours', 'Swarm Particles')
    delete(initialSwarm)
end

%% Computing final function value.
f = -abs((sum(p4Sum1Total) - 2*prod(p4ProdTotal)) / (sqrt(sum(p4Sum2Total))));

end

