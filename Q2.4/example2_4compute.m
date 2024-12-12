function visualize_hyperbolic_neumann()
    % Define parameters and functions
    f = @(x)(sin(pi*x)+sin(2*pi*x));
    g = @(x)(0*x);
    
    % Compute solution
    [x,t,u] = fdhyperbolic_neumann(0,1,10,0.5,20,2,f,g);
    
    % Create visualizations
    figure('Position', [100, 100, 1200, 400]);
    
    % 1. Surface plot
    subplot(1,3,1)
    surf(t,x,u)
    title('3D Surface Plot of Solution')
    xlabel('Time (t)')
    ylabel('Position (x)')
    zlabel('u(x,t)')
    colorbar
    shading interp
    
    % 2. Contour plot
    subplot(1,3,2)
    contourf(t,x,u,20)
    title('Contour Plot of Solution')
    xlabel('Time (t)')
    ylabel('Position (x)')
    colorbar
    
    % 3. Animation setup (select time snapshots)
    subplot(1,3,3)
    hold on
    plot(x,u(:,1),'b-','LineWidth',2)  % Initial condition
    plot(x,u(:,end),'r--','LineWidth',2)  % Final state
    title('Solution Profiles')
    xlabel('Position (x)')
    ylabel('u(x,t)')
    legend('t = 0','t = T')
    grid on
    
    % Add energy conservation plot
    figure('Position', [100, 550, 400, 300]);
    energy = sum(u.^2, 1);  % Compute discrete energy
    plot(t, energy, 'k-', 'LineWidth', 2)
    title('Energy Evolution')
    xlabel('Time (t)')
    ylabel('Discrete Energy')
    grid on
    
    % Create animation
    figure('Position', [550, 550, 400, 300]);
    for j = 1:length(t)
        plot(x, u(:,j), 'b-', 'LineWidth', 2)
        title(sprintf('Time t = %.3f', t(j)))
        xlabel('Position (x)')
        ylabel('u(x,t)')
        grid on
        ylim([min(min(u))-0.1, max(max(u))+0.1])
        drawnow
        pause(0.05)
    end
end