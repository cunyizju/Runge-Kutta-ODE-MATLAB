function [t,u,e] = sseuler(neqn,t0,u0,h) 
% % Function sseuler computes an ODE solution by the modified 
% Euler method for one step along the solution (by calls to 
% derv to define the ODE derivative vector). It also 
% estimates the truncation error of the solution, and 
% applies this estimate as a correction to the solution 
% vector. 
% % Argument list % % neqn number of first order ODEs 
% %t 0 initial value of independent variable 
% %u 0 initial condition vector of length neqn 
% %h integration step 
% %t independent variable 
% %u ODE solution vector of length neqn after 
% one modified Euler step 
% %e estimate of truncation error of the solution vector
% % Derivative vector at initial (base) point 
[ut0]=derv(neqn,t0,u0); 
% % First order (Euler) step 
u=u0+ut0*h; 
t=t0+h; 
% % Derivative at advance point 
[ut]=derv(neqn,t,u); 
% % Truncation error estimate 
e=(ut-ut0)*h/2.0; 
% % Second order (modified Euler) solution vector 
u=u+e; 
% % End of sseuler 
