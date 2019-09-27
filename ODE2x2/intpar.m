function [neqn,nout,nsteps,t0,tf,abserr,relerr]=intpar
%
% Function intpar sets the parameters to control the
% integration of the 2 x 2 ODE system
%
% Number of first order ODEs
neqn=2;
%
% Number of output points
nout=6;
%
% Maximum number of steps in the interval t0 to tf
nsteps=100;
%
% Initial, final values of independent variable
t0=0.0;
tf=1.0;
%
% Error tolerances
abserr=1.0e-05;
relerr=1.0e-05;
%
% End of intpar
