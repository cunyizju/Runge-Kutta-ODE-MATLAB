%
% Main program ode2x2 computes the numerical
% solution to the 2 x 2 ODE system by six
% integrators
%
% Step through six integrators
for int=1:6
%
% Integration parameters
[neqn,nout,nsteps,t0,tf,abserr,relerr]=intpar;
%
% Initial condition vector
[u0]=inital(neqn,t0);
%
% Output interval
tp=tf-t0;
%
% Compute solution at nout output points
for j=1:nout
%
% Print current solution
[out]=fprint(int,neqn,t0,u0);
%
% Fixed step modified Euler integrator
if int == 1
[u]=euler2a(neqn,t0,tf,u0,nsteps);
end
%
% Variable step modified Euler integrator
if int == 2
[u]=euler2b(neqn,t0,tf,u0,nsteps,abserr,relerr);
end
%
% Fixed step classical fourth order RK integrator
if int == 3
[u]=rkc4a(neqn,t0,tf,u0,nsteps);
end
%
% Variable step classical fourth order RK integrator
if int == 4
[u]=rkc4b(neqn,t0,tf,u0,nsteps,abserr,relerr);
end
%
% Fixed step RK Fehlberg (RKF45) integrator
if int == 5
[u]=rkf45a(neqn,t0,tf,u0,nsteps);
end
%
% Variable step RK Fehlberg (RKF45) integrator
if int == 6
[u]=rkf45b(neqn,t0,tf,u0,nsteps,abserr,relerr);
end
%
% Advance solution
t0=tf;
tf=tf+tp;
u0=u;
%
% Next output
end
%
% Next integrator
end
%
% End of ode2x2