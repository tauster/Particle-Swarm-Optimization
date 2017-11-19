%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   Q1 - Main
%   PSO
%%%%%%%%%%%%%%%%%%%%

clear all
close all

%% Asking user input for case study number.
chosen = 0;
while chosen == 0
    prompt = 'Input Case Study Number to Compute PSO (1-5): ';
    caseStudy = input(prompt);
    
    if (caseStudy >= 1) && (caseStudy <= 5) && (floor(caseStudy) == caseStudy)
        chosen = 1;
    end
end

%% Setting proper objective function, n values and boundary constraints.
switch caseStudy
    %-------------------------------------------------------
    % P1
    %-------------------------------------------------------
    case 1
        ObjectiveFunc =@(x, n, plot) Rosenbrock(x, n, plot);
        chosen = 0;
        while chosen == 0
            prompt = 'Input n (2 or 5): ';
            main.n = input(prompt);
            if ((main.n == 2) || (main.n == 5)) && (floor(main.n) == main.n)
                chosen = 1;
            end
        end
        main.bounds = [-5, 5];
        % Constraints where g_i(x) <= 0 and h_i(x) = 0.
        main.g =@(x) [(x - 5), (-5 - x)];
        main.h =@(x) [0];
        
    %-------------------------------------------------------
    % P2
    %-------------------------------------------------------
    case 2
        ObjectiveFunc =@(x, n, plot) Rastrigin(x, n, plot);
        chosen = 0;
        while chosen == 0
            prompt = 'Input n (2 or 5): ';
            main.n = input(prompt);
            if ((main.n == 2) || (main.n == 5)) && (floor(main.n) == main.n)
                chosen = 1;
            end
        end
        main.bounds = [-5, 5];
        % Constraints where g_i(x) <= 0 and h_i(x) = 0.
        main.g =@(x) [(x - 5), (-5 - x)];
        main.h =@(x) [0];
        
    %-------------------------------------------------------
    % P3
    %-------------------------------------------------------
    case 3
        ObjectiveFunc =@(x, n, plot) P3Function(x, n, plot);
        main.n = 2;
        main.bounds = [-1, 1];
        % Constraints where g_i(x) <= 0 and h_i(x) = 0.
        main.g =@(x) [(3*x(1) + 2*x(2) + 2), (15*x(1) - 3*x(2) - 1),...
                      (x(1) - 1), (-x(1) - 1),...
                      (x(2) - 1), (-x(2) - 1)];
        main.h =@(x) [0];
        
    %-------------------------------------------------------
    % P4
    %-------------------------------------------------------
    case 4
        ObjectiveFunc =@(x, n, plot) P4Function(x, n, plot);
        chosen = 0;
        while chosen == 0
            prompt = 'Input n (2 or 10): ';
            main.n = input(prompt);
            if ((main.n == 2) || (main.n == 10) || (main.n == 20)) && (floor(main.n) == main.n)
                chosen = 1;
            end
        end
        main.bounds = [0, 10];
        % Constraints where g_i(x) <= 0 and h_i(x) = 0.
        main.g =@(x) [(0.75 - prod(x)), (sum(x) - ((15*numel(x)) / 2)),...
                      (x - 10), (-x)];
        main.h =@(x) [0];
        
    %-------------------------------------------------------
    % P5
    %-------------------------------------------------------
    case 5
        ObjectiveFunc =@(x, n, plot) P5(x, n, plot);
        main.n = 2;
        main.trueData = importdata('MeasuredResponse.dat');
        main.bounds = [0.05, 15];
        % Constraints where g_i(x) <= 0 and h_i(x) = 0.
        main.g =@(x) [0];
        main.h =@(x) [0];
end

%% Setting up and initializing PSO.
% Setting up structure to send to the ComputePSO function.
main.objectiveFunction = ObjectiveFunc;

% Selecting number of iterations with respect to n.
if main.n == 2
    parameters.iter = 500;
elseif main.n == 5
    parameters.iter = 1500;
elseif main.n == 10
    parameters.iter = 5000;
elseif main.n == 20
    parameters.iter = 20000;
end

% Setting number of iterations to 200 for P5.
% (Computations take longer but convergence is quicker).
if strcmp(func2str(ObjectiveFunc), '@(x,n,plot)P5(x,n,plot)')
    parameters.iter = 200;
end

% Setting tuned PSO parameters.
parameters.swarmSize = 25;          % 10 - 60
parameters.inertia = 0.75;          % 0.4 - 1.4
parameters.c1 = 1.75;               % 1.5 - 2
parameters.c2 = 2.25;               % 2 - 2.5
parameters.rho = 1;
parameters.alpha = 1.5;             % 1 - 2

% Computing the PSO function found in ComputePSO.m.
output = ComputePSO(main, parameters);

%% Creating final plots.
% Plotting the convergence of the objective function to the minimum.
figure(2)
plot(1:numel(output.bestObj), output.bestObj, 'b-')
title('PSO Objective Function Convergence')
xlabel('Iterations')
ylabel('Best Particle Objective Value')

% Printing the best values of x found out of all the particles.
disp(['Best X values: ', num2str(output.finalX)])

% Creating the plot for P5. Done here instead due to possible O(n^2)
% runtime errors.
if strcmp(func2str(ObjectiveFunc), '@(x,n,plot)P5(x,n,plot)')
    p5Data = importdata('MeasuredResponse.dat');
    figure(3)
    plot(p5Data(:, 1), p5Data(:, 2), 'b-')
    hold on
    m = 1;
    k = output.finalX(1, 1);
    c = output.finalX(1, 2);
    omega = 0.1;
    F0 = 1;
    [fittedTime, fittedU] = P5Original([m, k, c, omega, F0]);
    plot(fittedTime, fittedU, 'r--', 'LineWidth', 1.5)
    axis([0 10 0 (max(fittedU) + 0.02)])
    title('P5 Displacement Response Fit')
    xlabel('Time (s)')
    ylabel('Displacement (u)')
    legend('Original Response', 'PSO Fitted Response')
    hold off
end

% Saving data for future reference
% save('Figures/Q1_P5.mat', 'output');

