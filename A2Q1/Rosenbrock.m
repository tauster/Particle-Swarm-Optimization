%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   Rosenbrock
%   Function
%%%%%%%%%%%%%%%%%%%%

% Input
% -----
% x: 1-D array of Rosenbrock function inputs.
% n: Number of dimmensions.
% plot: 0 or 1. Initialize plot if 1, ignore if 0.
%
% Output
% ------
% f: Rosenbrock function result.

function f = Rosenbrock(x, n, plot)
%% Setting up the Rosenbrock function for summation.
rose =@(x, i) 100*(x(i+1) - x(i)^2)^2 + (1 - x(i))^2;

%% Computing the summation for the Rosenbrock function.
for i = 1:(n-1)
    roseTotal(i) = rose(x, i);
end

%% Initializing the plot for visializing.
if plot == 1
    plotF =@(x1, x2) 100*(x2 - x1^2)^2 + (1 - x1)^2;
    figure(1)
    rosePlot = ezcontour(plotF, [-5; 5; -5; 5], 120);
    hold on
    rosePlot.LevelList = [1 4 8 10 60 100 200 280 320 400 560 600 800 1200 1600 2000 3000 4000 6000 10000 40000 80000];
    globalMin = scatter(1, 1, 'go', 'LineWidth', 2);
    initialSwarm = scatter(100, 100, 'rx');
    colorbar
    title('P1: Rosenbrock PSO Test')
    legend('Rosenbrock Function Countours',...
           'Global Minima', 'Swarm Particles')
    delete(initialSwarm)
end

%% Computing final function value.
f = sum(roseTotal);

end

