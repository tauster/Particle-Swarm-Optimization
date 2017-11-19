%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   Rastrigin
%   Function
%%%%%%%%%%%%%%%%%%%%

% Input
% -----
% x: 1-D array of Rastrigin function inputs.
% n: Number of dimmensions.
% plot: 0 or 1. Initialize plot if 1, ignore if 0.
%
% Output
% ------
% f: Rastrigin function result.

function f = Rastrigin(x, n, plot)
%% Setting up the Rastrigin function for summation.
rastSum =@(x, i) x(i).^2 - 10*cos(2*pi*x(i));

%% Computing the summation for the Rastrigin function.
for i = 1:n
    rastTotal(i) = rastSum(x, i);
end

%% Initializing the plot for visializing.
if plot == 1
    plotF =@(x1, x2) 10*n + (x1.^2 - 10*cos(2*pi*x1))...
                             + (x2.^2 - 10*cos(2*pi*x2));
    figure(1)
    rastPlot = ezcontour(plotF, [-5; 5; -5; 5], 120);
    hold on
    globalMin = scatter(0, 0, 'go', 'LineWidth', 2);
    initialSwarm = scatter(100, 100, 'rx');
    colorbar
    title('P2: Rastrigin PSO Test')
    legend('Rastrigin Function Countours',...
           'Global Minima', 'Swarm Particles')
    delete(initialSwarm)
end

%% Computing final function value.
f = 10*n + sum(rastTotal);

end

