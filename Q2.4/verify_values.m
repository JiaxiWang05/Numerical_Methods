function verify_values()
    % Parameters
    L = 1.0;
    c = 1.0;
    
    % Test points
    x = 0.2;
    t = 0;
    
    % Calculate lambda values
    lambda0 = pi/(2*L);
    lambda1 = 3*pi/(2*L);
    lambda2 = 5*pi/(2*L);
    
    % Detailed calculation for (x=0.2, t=0)
    fprintf('\nDetailed calculation for x=0.2, t=0:\n')
    fprintf('----------------------------------------\n')
    
    % n=0 term
    term0 = (1*cos(c*lambda0*t) + 1*sin(c*lambda0*t))*sin(lambda0*x);
    fprintf('Term 0: (1*cos(0) + 1*sin(0))*sin(%.3f*0.2) = %.3f\n', lambda0, term0)
    
    % n=1 term
    term1 = (0*cos(c*lambda1*t) + 2*sin(c*lambda1*t))*sin(lambda1*x);
    fprintf('Term 1: (0*cos(0) + 2*sin(0))*sin(%.3f*0.2) = %.3f\n', lambda1, term1)
    
    % n=2 term
    term2 = (-3*cos(c*lambda2*t) + 0*sin(c*lambda2*t))*sin(lambda2*x);
    fprintf('Term 2: (-3*cos(0) + 0*sin(0))*sin(%.3f*0.2) = %.3f\n', lambda2, term2)
    
    total = term0 + term1 + term2;
    fprintf('Total: %.3f\n\n', total)
    
    % Now calculate for (x=0.5, t=1)
    x = 0.5;
    t = 1;
    fprintf('Detailed calculation for x=0.5, t=1:\n')
    fprintf('----------------------------------------\n')
    
    % n=0 term
    term0 = (1*cos(c*lambda0*t) + 1*sin(c*lambda0*t))*sin(lambda0*x);
    fprintf('Term 0: (1*cos(%.3f) + 1*sin(%.3f))*sin(%.3f*0.5) = %.3f\n', ...
        c*lambda0, c*lambda0, lambda0, term0)
    
    % n=1 term
    term1 = (0*cos(c*lambda1*t) + 2*sin(c*lambda1*t))*sin(lambda1*x);
    fprintf('Term 1: (0*cos(%.3f) + 2*sin(%.3f))*sin(%.3f*0.5) = %.3f\n', ...
        c*lambda1, c*lambda1, lambda1, term1)
    
    % n=2 term
    term2 = (-3*cos(c*lambda2*t) + 0*sin(c*lambda2*t))*sin(lambda2*x);
    fprintf('Term 2: (-3*cos(%.3f) + 0*sin(%.3f))*sin(%.3f*0.5) = %.3f\n', ...
        c*lambda2, c*lambda2, lambda2, term2)
    
    total = term0 + term1 + term2;
    fprintf('Total: %.3f\n', total)
    
    % Compare with hyperbolic_analytical function
    fprintf('\nVerification against hyperbolic_analytical function:\n')
    fprintf('----------------------------------------\n')
    u1 = hyperbolic_analytical(0.2, 0, L, c, [1, 0, -3], [1, 2]);
    u2 = hyperbolic_analytical(0.5, 1, L, c, [1, 0, -3], [1, 2]);
    fprintf('hyperbolic_analytical(0.2, 0, ...): %.3f\n', u1)
    fprintf('hyperbolic_analytical(0.5, 1, ...): %.3f\n', u2)
end