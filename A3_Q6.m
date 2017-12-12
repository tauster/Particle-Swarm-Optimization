%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 3
%   Tausif Sharif
%
%   Q6
%%%%%%%%%%%%%%%%%%%%

clear all
close all

%% Setting up a 5D version of the P4 bunp test function.
objFunc =@(x) P4Function_2(x);
n = 5;
bounds = [0, 10];

% Constraints where g_i(x) <= 0 and h_i(x) = 0.
g =@(x) [(0.75 - prod(x)), (sum(x) - ((15*numel(x)) / 2)),...
              (x - 10), (-x)];
h =@(x) [0];

lBound = bounds(1);
uBound = bounds(2);


%% Setting up PSO parameters and inital swarm. Same as Assingment 2.
iter = 1000;
swarmSize = 25;          % 10 - 60
w = 0.75;                % 0.4 - 1.4
c1 = 1.75;               % 1.5 - 2
c2 = 2.25;               % 2 - 2.5
rho = 1;
alpha = 1.5;             % 1 - 2

globalBestPos = zeros(1, n);
globalBestObj = Inf;

for i = 1:swarmSize
    particlePos(i, :) = unifrnd(lBound, uBound, [1, n]);
    particleVel(i, :) = zeros(1, n);
    particleObj(i) = objFunc(particlePos(i, :)) +...
                     rho*PenaltyAddition(g, h, particlePos(i, :), n);
    
    particleBestPos(i, :) = particlePos(i, :);
    particleBestObj(i) = particleObj(i);
    
    if particleBestObj(i) < globalBestObj
        globalBestObj = particleBestObj(i);
        globalBestPos = particleBestPos(i, :);
    end
    disp(['Particle ' num2str(i) ': Obj = ' num2str(particleObj(i))]);
end

%% Setting up fmincon settings.
lb = [0, 0, 0, 0, 0];
ub = [10, 10, 10, 10, 10];
A = [1, 1, 1, 1, 1];
b = (15*numel(globalBestPos)) / 2;
Aeq = [];
beq = [];
options = optimset('Display', 'off') ;

fminObj = Inf;

%% Hybrid Main loop
for i = 1:iter
    for j = 1:swarmSize
        newVel = w*particleVel(j, :)...
                 + c1*rand(1, n).*(particleBestPos(j, :) - particlePos(j, :))...
                 + c2*rand(1, n).*(globalBestPos - particlePos(j, :));
        
        particleVel(j, :) = newVel;
        particlePos(j, :) = particlePos(j, :) + particleVel(j, :);
        

        particleObj(j) = objFunc(particlePos(j, :))...
                         + rho*PenaltyAddition(g, h, particlePos(j, :), n);
        
        if particleObj(j) < particleBestObj(j)
            particleBestPos(j, :) = particlePos(j, :);
            particleBestObj(j) = particleObj(j);
            
            if particleBestObj(j) < globalBestObj
                globalBestObj = particleBestObj(j);
                globalBestPos = particleBestPos(j, :);
            end
        end
    end
    
    if  globalBestObj < fminObj
        fminPos = fmincon(objFunc, globalBestPos, A, b, Aeq, beq, lb, ub, @confun, options);
        fminObj = objFunc(fminPos);
        if fminObj < globalBestObj
            globalBestObj = fminObj;
            globalBestPos = fminPos;
        end
    end
    
    bestHybridObj(i, :) = globalBestObj;
    disp(['Iteration ', num2str(i), ': Best Obj = ', num2str(bestHybridObj(i, :)), '; Position = ', num2str(globalBestPos)]);
    rho = (0.5*i)^alpha;
end

HybridResults.bestObj = bestHybridObj;
HybridResults.finalX = globalBestPos;

%% Convergence plot.
figure(2)
plot(1:numel(HybridResults.bestObj), HybridResults.bestObj, 'b-', 'LineWidth', 1)
title('5D P4: PSO/fmincon Hybrid Objective Function Convergence')
xlabel('Iterations')
ylabel('Best Hybrid Objective Value')
% set(gcf,'PaperUnits','inches','PaperPosition',[0 0 8 4])
% print('Figures/Q6_Hybrid.png', '-dpng', '-r150');

