%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%   Tausif Sharif
%
%   PSO Computation
%%%%%%%%%%%%%%%%%%%%

% Input
% -----
% main: Structure with 5 fields.
%       - n: Number of dimmensions.
%       - bounds: [Upper bound, Lower bound].
%       - g: Constraints where g_i(x) <= 0.
%       - h: Constraints where h_i(x) = 0.
%       - objectiveFunction: Objective function without penalty.
% 
% parameters: Structure with 7 fields.
%             - iter: Numer of iterations.
%             - swarmSize: PSO swarm size.
%             - inertia: Inertial weight.
%             - c1: Cognitive parameter.
%             - c2: Social parameter.
%             - rho: Penalty parameter.
%             - alpha: Penalty weight.
%
% Output
% ------
% PSOResults: Structure with 2 fields.
%             - bestObj: Matrix of size (iter, 1) with objective results.
%             - finalX: Converged minimum point.

function PSOResults = ComputePSO(main, parameters)
%% Storing all PSO settings to managable variables.
objFunc = main.objectiveFunction;

n = main.n;

lBound = main.bounds(1);
uBound = main.bounds(2);

w = parameters.inertia;         % 0.4 - 1.4
c1 = parameters.c1;              % 1.5 - 2
c2 = parameters.c2;              % 2 - 2.5
rho = parameters.rho;
alpha = parameters.alpha;

%% Setting up initial particles.
globalBestPos = zeros(1, n);
globalBestObj = inf;

for i = 1:parameters.swarmSize
    % Giving a uniformly distributed set of initial position.
    particlePos(i, :) = unifrnd(lBound, uBound, [1, n]);
    % Setting all initial velocities to 0.
    particleVel(i, :) = zeros(1, n);
    % Computing the initial objective function results.
    particleObj(i) = objFunc(particlePos(i, :), n, 0) +...
                     rho*PenaltyAddition(main.g, main.h, particlePos(i, :), n);
    
    % Setting the current position and objective value as the current best.
    particleBestPos(i, :) = particlePos(i, :);
    particleBestObj(i) = particleObj(i);
    
    % Finding and storing the best global position out of all the particles
    % with respect to the lowest objective value available.
    if particleBestObj(i) < globalBestObj
        globalBestObj = particleBestObj(i);
        globalBestPos = particleBestPos(i, :);
    end
    
    % Display current particles objective value. For debugging.
    disp(['Particle ' num2str(i) ': Obj = ' num2str(particleObj(i))]);
end

%% Main loop
for i = 1:parameters.iter
    % This loop goes through each iteration.
    for j = 1:parameters.swarmSize
        % This loop goes through each particle.
        
        % Compute the velocity of each particle.
        newVel = w*particleVel(j, :)...
                 + c1*rand(1, n).*(particleBestPos(j, :) - particlePos(j, :))...
                 + c2*rand(1, n).*(globalBestPos - particlePos(j, :));
        
        % Updating the old velocity to the new one. Computing new postion.
        particleVel(j, :) = newVel;
        particlePos(j, :) = particlePos(j, :) + particleVel(j, :);
        
        % If first iteration, and P5 is not chosen, compute the objective
        % function with plot parameter set to 1 to initialize the plot.
        if (i == 1) && (~strcmp(func2str(objFunc), '@(x,n,plot)P5(x,n,plot)'))
            % Compute the objective function with the penalty addition.
            particleObj(j) = objFunc(particlePos(j, :), n, 1)...
                         + rho*PenaltyAddition(main.g, main.h, particlePos(j, :), n);
            
            % Include a bogus point to figure that can be updated later.
            figure(1)
            swarm = scatter(100, 100, 'rx');
            
        % If not first iteration, compute objective function with plot = 0. 
        else
            % Compute the objective function with the penalty addition.
            particleObj(j) = objFunc(particlePos(j, :), n, 0)...
                         + rho*PenaltyAddition(main.g, main.h, particlePos(j, :), n);
        end
        
        % If the particle's current objective value is better than the
        % personal best, update the position/objective to the new value.
        if particleObj(j) < particleBestObj(j)
            particleBestPos(j, :) = particlePos(j, :);
            particleBestObj(j) = particleObj(j);
            
            % If the particle's current best is better than the global
            % best, update the global best.
            if particleBestObj(j) < globalBestObj
                globalBestObj = particleBestObj(j);
                globalBestPos = particleBestPos(j, :);
            end
        end
    end
    
    % Update the plot with the new swarm if not P5.
    if (~strcmp(func2str(objFunc), '@(x,n,plot)P5(x,n,plot)'))
        figure(1)
        delete(swarm)
        swarm = scatter(particlePos(:, 1), particlePos(:, 2), 'rx');
        pause(0.01)
    end
    
    % Update matrix of best objective values for output.
    bestPSOObj(i, :) = globalBestObj;
    
    % Display current Global Best PSO stats.
    disp(['Iteration ', num2str(i), ': Best Obj = ', num2str(globalBestObj), '; Position = ', num2str(globalBestPos)]);
    
    % Update the dynamic penalty parameter.
    rho = (0.5*i)^alpha;
end

% Setup output structure.
PSOResults.bestObj = bestPSOObj;
PSOResults.finalX = globalBestPos;

end

