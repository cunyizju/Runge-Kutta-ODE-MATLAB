function [u]=euler2b(neqn,t0,tf,u0,nsteps,abserr,relerr) 
% % Function euler2b computes an ODE solution by a variable 
% step modified Euler method for a series of points along 
% the solution by repeatedly calling function sseuler for 
%asingle modified Euler step. The truncation error is 
% estimated along the solution to adjust the integration 
% step according to a specified error tolerance. 
% % Argument list 
% % neqn number of first order ODEs 
% %t 0 initial value of independent variable 
% %t f final value of independent variable 
% %u 0 initial condition vector of length neqn 
% % nsteps maximum number of modified Euler steps 
% % abserr absolute error tolerance 
% % relerr relative error tolerance 
%%u ODE solution vector of length eqn after 
% nsteps steps 
% % Initial integration step 
h=(tf-t0)/8.0; 
% % Minimum allowable step 
hmin=(tf-t0)/nsteps; 
% % Start integration 
t=t0; 
% % While independent variable is less than the final 
% value, continue the integration 
while t <= tf*0.999 
    % %I fthe next step along the solution will go past 
    % the final value of the independent variable, set 
    % the step to the remaining distance to the final 
    % value 
    if t+h > tf h=tf-t; 
    end
    % % Single modified Euler step 
    [t,u,e]=sseuler(neqn,t0,u0,h); 
    % % Flag for the end of the integration 
    nfin1=1; 
    % % Check if any of the ODEs have violated the error 
    % criteria 
    for i=1:neqn 
        if abs(e(i)) > abs(u(i))*relerr+abserr 
            % % Error violation, so integration is not complete. 
            % Reduce integration step because of error violation 
            % and repeat integration from the base point 
            h=h/2.0; 
            nfin1=0; 
            break; 
        end
    end
    % %I fthe current step is less than the minimum 
    % allowable step, set the step to the minimum 
    % allowable value and continue integration from 
    % new base point 
    if h < hmin h=hmin; 
        nfin1=1; 
    end
% %I fthere is no error violation, continue the 
% integration from new base point 
if nfin1 == 1 
    u0=u; 
    t0=t; 
    % % Test if integration step can be increased 
    for i=1:neqn 
        if abs(e(i)) > (abs(u(i))*relerr+abserr)/4.0 
            % % Integration step cannot be increased 
            nfin1=0; 
            break; 
        end
    end
    % % Increase integration step 
    if nfin1 == 1 
        h=h*2.0; 
    end
    % % Continue for no error violation (nfin1=1) 
end
% % Continue while 
end 
% % End of euler2b

