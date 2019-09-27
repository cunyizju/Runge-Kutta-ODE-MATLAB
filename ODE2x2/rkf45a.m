function [u]=rkf45a(neqn,t0,tf,u0,nsteps) 
% % Function rkf45a computes an ODE solution by the fixed 
% step RK Fehlberg 45 method for a series of points along 
% the solution by repeatedly calling function ssrkf45 for
%asingle RK Fehlberg 45 step. 
% % Argument list 
% % neqn number of first order ODEs
% %t 0 initial value of independent variable 
% %t f final value of independent variable
% %u 0 initial condition vector of length neqn 
% % nsteps number of rkf45 steps 
% %u ODE solution vector of length neqn after
% nsteps steps
% % Integration step 
h=(tf-t0)/nsteps; 
% % nsteps rkf45 steps 
for i=1:nsteps 
    % % rkf45 step 
    [t,u,e]=ssrkf45(neqn,t0,u0,h);
    % % Reset base point values for next rkc4 step 
    u0=u; 
    t0=t; 
    % % Next rkf45 step 
end
% % End of rkf45a