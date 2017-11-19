%%%%%%%%%%%%%%%%%%%%
%   AER 1415
%   Assignment 2
%
%   Modified P5
%%%%%%%%%%%%%%%%%%%%

% Analytical solution of single degree-of-freedom viscously damped linear oscillator subject to the forcing
% F_0 cos(\omega*t) with zero initial conditions on displacement and velocity
% Answer:  x=[1,10.2,0.8,0.1,1]

% Input
% -----
% x: Array of [k, c].
% n: Number of dimmensions. Not required, only to comply with ComputePSO.m.
% plot1: Not required, only to comply with ComputePSO.m.
%
% Output
% ------
% diff: Least square sum result.

function diff = P5(x, n, plot1)
%% Known parameters and comparison data.
m = 1;
k = x(1, 1);
c = x(1, 2);
omega = 0.1;
F0 = 1;
trueData = importdata('MeasuredResponse.dat');

%% Rest of the analytical calculations.
C = sqrt( (k-m*omega^2)^2 + (c*omega)^2 );
alpha = atan( c*omega/(k -m*omega^2));
omegad = sqrt( k/m - (c/(2*m))^2 );
if (~isfinite(omegad)) || (omegad == 0) || (~isreal(omegad))
    omegad = 0.001;
end
A = - (F0/C) * cos(alpha);
B = -(F0/(C*omegad)) * ( omega*sin(alpha) + c/(2*m) * cos(alpha));

%
% Calculate analytical solution in the time interval [0,10] seconds at 500 equally space time intervals
%
t = 0;
for i = 1:500
    term1 = A*cos(omegad*t) + B*sin(omegad*t);
    term2 = exp( - c*t/(2*m) );
    term3 = (F0/C)*cos(omega*t - alpha);
    u(i) = term1*term2 + term3;
    time(i) = t;
    t = t + 10/499;
end

%% Computing the least sqauare sum as the objective function.
diff = sum((u.' - trueData(:,2)).^2);

end

