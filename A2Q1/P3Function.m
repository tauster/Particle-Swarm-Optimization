%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   P3 Function
%%%%%%%%%%%%%%%%%%%%

% Input
% -----
% x: 1-D array of function inputs.
% n: Not required, only to comply with ComputePSO.m.
% plot: 0 or 1. Initialize plot if 1, ignore if 0.
%
% Output
% ------
% f: P3 bound constraint function result.

function f = P3Function(x, n, plot)
%% Initializing the plot for visializing.
if plot == 1
    plotF =@(x1, x2) x1.^2 + 0.5*x1 + 3*x1*x2 + 5*x2.^2;
    constraint1 =@(x1) (-3/2)*x1 - 1;
    constraint2 =@(x1) 5*x1 - (1/3);
    
    figure(1)
    p3Plot = ezcontour(plotF, [-1; 1; -1; 1], 120);
    hold on
    ezplot(constraint1, [-1 1 -1 1])
    ezplot(constraint2, [-1 1 -1 1])
    globalMin = scatter(-0.454545, 0.13636, 'go', 'LineWidth', 2);
    initialSwarm = scatter(100, 100, 'rx');
    colorbar
    title('P3 PSO Test')
    legend('P3 Function Countours',...
           'Constraint 1', 'Constraint 2', 'Global Minima', 'Swarm Particles')
    delete(initialSwarm)
end

%% Computing function value.
f = x(1).^2 + 0.5*x(1) + 3*x(1)*x(2) + 5*x(2).^2;

end

