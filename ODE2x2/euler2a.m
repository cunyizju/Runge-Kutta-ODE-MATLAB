function [u]=euler2a(neqn,t0,tf,u0,nsteps) 
% % Function euler2a computes an ODE solution by a fixed step 
% modified Euler method for a series of points along the 
% solution by repeatedly calling function sseuler for a 
% single modified Euler step. 
% % Argument list 
% % neqn number of first order ODEs 
% %t 0 initial value of independent variable 
% %t f final value of independent variable 
% %u 0 initial condition vector of length neqn %
% nsteps number of modified Euler steps 
% %u ODE solution vector of length neqn after 
% nsteps steps 
% % Integration step 
h=(tf-t0)/nsteps; 
% % nsteps modified Euler steps 
for i=1:nsteps 
    % % Modified Euler step 
    [t,u,e]=sseuler(neqn,t0,u0,h); 
    % % Reset base point values for next modified Euler step 
    u0=u; 
    t0=t; 
    % % Next modified Euler step 
end
% % End of euler2a