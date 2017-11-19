%
% Analytical solution of single degree-of-freedom viscously damped linear oscillator subject to the forcing
% F_0 cos(\omega*t) with zero initial conditions on displacement and velocity
%
% [time,y] = P5(x)
%
% INPUT: a vector x of dimension 5
%     x(1) = m
%     x(2) = k
%     x(3) = c
%     x(4) = omega
%     x(5) = F_0
%
% OUTPUTS:
%     time: a vector of time instants at which the response is calculated
%       u : a vector containing displacements at each time instant
%
%% Answer:  x=[1,10.2,0.8,0.1,1]

function [time,u] = P5Original(x)

m = x(1);
k = x(2);
c = x(3);
omega = x(4);
F0 = x(5);

C = sqrt( (k-m*omega^2)^2 + (c*omega)^2 );
alpha = atan( c*omega/(k -m*omega^2));
omegad = sqrt( k/m - (c/(2*m))^2 );
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