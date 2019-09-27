function [t,u,e] = ssrkf45(neqn,t0,u0,h) 
% % Function ssrkf45 computes an ODE solution by the RK 
% Fehlberg 45 method for one step along the solution (by
% calls to derv to define the ODE derivative vector). It
% also estimates the truncation error of the solution, 
% and applies this estimate as a correction to the solution 
% vector. 
% % Argument list 
% % neqn number of first order ODEs 
% %t 0 initial value of independent variable 
% %u 0 initial condition vector of length neqn 
% %h integration step
% %t independent variable 
% %u ODE solution vector of length neqn after 
% one rkf45 step
% %e estimate of truncation error of the solution vector 
%
% Derivative vector at initial (base) point 
[ut0]=derv(neqn,t0,u0); 
% % k1, advance of dependent variable vector and 
% independent variable for calculation of k2 
k1=h*ut0; 
u=u0+0.25*k1;
t=t0+0.25*h;
% % Derivative vector at new u, t
[ut]=derv(neqn,t,u); 
% % k2, advance of dependent variable vector and
% independent variable for calculation of k3
k2=h*ut; 
u=u0+(3.0/32.0)*k1... 
    +(9.0/32.0)*k2; 
t=t0+(3.0/8.0)*h; 
% % Derivative vector at new u, t 
[ut]=derv(neqn,t,u); 
% % k3, advance of dependent variable vector and 
% independent variable for calculation of k4 
k3=h*ut; 
u=u0+(1932.0/2197.0)*k1... 
    -(7200.0/2197.0)*k2... 
    +(7296.0/2197.0)*k3; 
t=t0+(12.00/13.0)*h; 
% % Derivative vector at new u, t
[ut]=derv(neqn,t,u); 
% % k4, advance of dependent variable vector and 
% independent variable for calculation of k5 
k4=h*ut; 
u=u0+( 439.0/ 216.0)*k1... 
    -( 8.0 )*k2... 
    +(3680.0/ 513.0)*k3... 
    -( 845.0/4104.0)*k4; 
t=t0+h; 
% % Derivative vector at new u, t 
[ut]=derv(neqn,t,u); 
%
% k5, advance of dependent variable vector and 
% independent variable for calculation of k6 
k5=h*ut; 
u=u0-( 8.0/ 27.0)*k1...
    +( 2.0 )*k2... 
    -(3544.0/2565.0)*k3... 
    +(1859.0/4104.0)*k4...
    -( 11.0/ 40.0)*k5; 
t=t0+0.5*h;
% % Derivative vector at new u, t 
[ut]=derv(neqn,t,u); 
% % k6 
k6=h*ut; 
% % Fourth order step 
sum4=u0+( 25.0/ 216.0)*k1... 
    +( 1408.0/2565.0)*k3... 
    +( 2197.0/4104.0)*k4... 
    -( 1.0/ 5.0)*k5; 
% % Fifth order step 
sum5=u0+( 16.0/ 135.0)*k1... 
    +( 6656.0/12825.0)*k3... 
    +(28561.0/56430.0)*k4... 
    -( 9.0/ 50.0)*k5... 
    +( 2.0/ 55.0)*k6; 
t=t0+h; 
% % Truncation error estimate 
e=sum5-sum4; 
% % Fifth order solution vector (from (4,5) RK pair); 
% two ways to the same result are listed
% u=sum4+e; 
u=sum5; 
% % End of ssrkf45
