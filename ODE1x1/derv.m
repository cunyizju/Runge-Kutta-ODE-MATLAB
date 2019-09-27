function [ut]=derv(neqn,t,u) 
% % Function derv computes the derivative vector 
% of the 1 x 1 ODEproblem 
% % Problem parameters 
alpha=1.0; 
lambda=1.0; 
% % Derivative vector 
ut(1)=lambda*exp(-alpha*t)*u(1);
% % End of derv 