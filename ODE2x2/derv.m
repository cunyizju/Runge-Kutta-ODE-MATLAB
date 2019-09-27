function [ut]=derv(neqn,t,u)
%
% Function derv computes the derivative vector
% of the 2 x 2 ODE problem
%
% Problem parameters
a=5.5;
b=4.5;
%
% Derivative vector
ut(1)=-a*u(1)+b*u(2);
ut(2)= b*u(1)-a*u(2);
%
% End of derv