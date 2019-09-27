function [u]=rkc4a(neqn,t0,tf,u0,nsteps) 
% % Function rkc4a computes an ODE solution by a fixed step 
% classical fourth order RK method for a series of points 
% along the solution by repeatedly calling function ssrkc4 
% for a single classical fourth order RK step. 
% % Argument list 
%
% neqn number of first order ODEs 
% %t 0 initial value of independent variable 
% %t f final value of independent variable 
% %u 0 initial condition vector of length neqn 
% % nsteps number of rkc4 steps 
% %u ODE solution vector of length neqn after 
% nsteps steps % % Integration step 
h=(tf-t0)/nsteps; 
% % nsteps rkc4 steps 
for i=1:nsteps 
    % % rkc4 step 
    [t,u,e]=ssrkc4(neqn,t0,u0,h); 
    % % Reset base point values for next rkc4 step 
    u0=u; 
    t0=t; 
    % % Next rkc4 step 
end
% % End of rkc4a


