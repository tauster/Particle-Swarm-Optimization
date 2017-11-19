%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   Q2 - Main
%   Gradient Descent
%%%%%%%%%%%%%%%%%%%%

clear all
close all

%% Asking user input for case study number.
chosen = 0;
while chosen == 0
    prompt = 'Input Case Study Number to Compute Gradient Descent (1-5): ';
    caseStudy = input(prompt);
    
    if (caseStudy >= 1) && (caseStudy <= 5) && (floor(caseStudy) == caseStudy)
        chosen = 1;
    end
end

%% Setting proper objective function and n values for case study chosen.
switch caseStudy
    %-------------------------------------------------------
    % P1
    %-------------------------------------------------------
    case 1
        chosen = 0;
        while chosen == 0
            prompt = 'Input n (2 or 5): ';
            n = input(prompt);
            if ((n == 2) || (n == 5)) && (floor(n) == n)
                chosen = 1;
            end
        end
        
        if n == 2
            ObjectiveFunc = 'Rose2';
            uBounds = [5; 5];
            lBounds = [-5; -5];
        elseif n == 5
            ObjectiveFunc = 'Rose5';
            uBounds = [5; 5; 5; 5; 5];
            lBounds = [-5; -5; -5; -5; -5];
        end
        
    %-------------------------------------------------------
    % P2
    %-------------------------------------------------------
    case 2
        chosen = 0;
        while chosen == 0
            prompt = 'Input n (2 or 5): ';
            n = input(prompt);
            if ((n == 2) || (n == 5)) && (floor(n) == n)
                chosen = 1;
            end
        end
        
        if n == 2
            ObjectiveFunc = 'Rast2';
            uBounds = [5; 5];
            lBounds = [-5; -5];
        elseif n == 5
            ObjectiveFunc = 'Rast5';
            uBounds = [5; 5; 5; 5; 5];
            lBounds = [-5; -5; -5; -5; -5];
        end
        
    %-------------------------------------------------------
    % P3
    %-------------------------------------------------------
    case 3
        n = 2;
        ObjectiveFunc = 'P3FuncQ2';
        uBounds = [1; 1];
        lBounds = [-1; -1];
        
    %-------------------------------------------------------
    % P4
    %-------------------------------------------------------
    case 4
        ObjectiveFunc = 'P4FuncQ2';
        chosen = 0;
        while chosen == 0
            prompt = 'Input n (2 or 10): ';
            n = input(prompt);
            if ((n == 2) || (n == 10)) && (floor(n) == n)
                chosen = 1;
            end
        end
        
        if n == 2
            uBounds = [10; 10];
            lBounds = [0; 0];
        elseif n == 10
            uBounds = [10; 10; 10; 10; 10; 10; 10; 10; 10; 10];
            lBounds = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
        end
        
    %-------------------------------------------------------
    % P5
    %-------------------------------------------------------
    case 5
        ObjectiveFunc = 'P5FuncQ2';
        n = 2;
        main.trueData = importdata('MeasuredResponse.dat');
        uBounds = [15; 15];
        lBounds = [0; 0];
end

%% Running 10 iterations of the gradient-based method.
% Figure for plotting all 10 convergence plots.
figure(1)
hold on
for i = 1:10
    % Giving a random inital guesses.
    x0 = rand(1,n).';
    
    % Computing the projbfgs.m
    [x, histout, costdata] = projbfgs(x0, ObjectiveFunc, uBounds, lBounds);
    
    % Saving the initial x and final x.
    xLog(i, :) = [x0.' x.'];
    
    % Adding current convergence to the figure.
    plot(histout(:,4), histout(:,2))
    
    % fileName = strcat('Figures/Q2_P5_n2_', num2str(i), '.mat');
    % save(fileName, 'histout');
end
title('P5 Objective Function Convergence')
legend('Trail 1', 'Trail 2', 'Trail 3', 'Trail 4', 'Trail 5', ...
       'Trail 6', 'Trail 7', 'Trail 8', 'Trail 9', 'Trail 10')
xlabel('Iterations')
ylabel('Objective Function Value')
hold off

%% Printing out the results of all 10 test.
if n == 2
    tabSpace = repmat('       ', 1, n);
    disp(['Initial x:', tabSpace, 'Final x:']);
elseif n == 5
    tabSpace = repmat('          ', 1, n);
    disp(['Initial x:', tabSpace, 'Final x:']);
elseif n == 10
    tabSpace = repmat('           ', 1, n);
    disp(['Initial x:', tabSpace, 'Final x:']);
end

disp([num2str(xLog)]);

