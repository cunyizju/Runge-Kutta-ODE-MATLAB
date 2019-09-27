function [out]=fprint(ncase,neqn,t,u) 
% % Function fprint displays the numerical and 
% exact solutions to the 1 x 1 ODEproblem 
% % Return current value of independent variable 
% (MATLAB requires at least one return argument) 
out=t; 
% % Problem parameters 
u0=1.0; 
alpha=1.0; 
lambda=1.0; 
% % Print a heading for the solution at t = 0 
if(t<=0.0) 
    % % Label for ODE integrator 
    % % Fixed step modified Euler 
    if(ncase==1) 
        fprintf('\n\n euler2a integrator\n\n');
% % Variable step modified Euler 
    elseif(ncase==2) 
        fprintf('\n\n euler2b integrator\n\n'); 
        % % Fixed step classical fourth order RK 
    elseif(ncase==3) 
        fprintf('\n\n rkc4a integrator\n\n'); 
        % % Variable step classical fourth order RK 
    elseif(ncase==4) 
        fprintf('\n\n rkc4b integrator\n\n'); 
        % % Fixed step RK Fehlberg 45 
    elseif(ncase==5) 
        fprintf('\n\n rkf45a integrator\n\n'); 
        % % Variable step RK Fehlberg 45 
    elseif(ncase==6) 
        fprintf('\n\n rkf45b integrator\n\n'); 
    end
    % % Heading 
    fprintf(' t u1 u1e u1-u1e\n'); 
    % % End of t = 0heading 
end
% % Numerical and analytical solution output 
% % Analytical solution 
ue(1)=u0*exp(lambda/alpha*(1.0-exp(-alpha*t))); 
% % Difference between exact and numerical solutions 
diff=u-ue; 
% % Display the numerical and exact solutions, and their 
% difference 
fprintf('%10.2f %10.5f %10.5f %10.5f\n',t,u,ue(1), diff); 
% % End of fprint
