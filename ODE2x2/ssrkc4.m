function [t,u,e] = ssrkc4(neqn,t0,u0,h) 
% % Function ssrkc4 computes an ODE solution by the classical 
% fourth order RK method for one step along the solution
% (by calls to derv to define the ODE derivative vector). 
%Italso estimates the truncation error of the solution,
% and applies this estimate as a correction to the solution 
% vector. 
% % Argument list 
% % neqn number of first order ODEs
% %t 0 initial value of independent variable
% %u 0 initial condition vector of length neqn
% %h integration step 
% %t independent variable 
% %u ODE solution vector of length neqn after 
% one rkc4 step % %e estimate of truncation error of the solution vector 
% % Derivative vector at initial (base) point 
[ut0]=derv(neqn,t0,u0); 
% % k1, advance of dependent variable vector and 
% independent variable for calculation of k2 
k1=h*ut0; 
u=u0+0.5*k1; 
t=t0+0.5*h; 
% % Derivative vector at new u, t 
[ut]=derv(neqn,t,u); 
% % k2, advance of dependent variable vector and 
% independent variable for calculation of k3 
k2=h*ut; 
u=u0+0.5*k2; 
t=t0+0.5*h; 
% % Derivative vector at new u, t 
[ut]=derv(neqn,t,u);
% % k3, advance of dependent variable vector and 
% independent variable for calculation of k4
k3=h*ut; 
u=u0+k3; 
t=t0+h;
% % Derivative vector at new u, t 
[ut]=derv(neqn,t,u); 
% % k4 
k4=h*ut; 
% % Second order step 
sum2=u0+k2; 
% % Fourth order step 
sum4=u0+(1.0/6.0)*(k1+2.0*k2+2.0*k3+k4);
t=t0+h; 
% % Truncation error estimate 
e=sum4-sum2; 
% % Fourth order solution vector (from (2,4) RK pair); 
% two ways to the same result are listed 
% u=sum2+e; 
u=sum4; 
% % End of ssrkc4

