function verify_hyperbolic_solution()
    % 1. Setup the problem
    f = @(x)(sin(pi*x)+sin(2*pi*x));
    g = @(x)(0*x);
    [x,t,u] = fdhyperbolic_neumann(0,1,10,0.5,20,2,f,g);
    
    % 2. Verification Tests
    fprintf('Verification Tests:\n\n');
    
    % Test 1: Check Dirichlet boundary condition at x=0
    dirichlet_error = max(abs(u(1,:)));
    fprintf('1. Dirichlet BC Test (should be ≈0):\n');
    fprintf('   Maximum error at x=0: %e\n\n', dirichlet_error);
    
    % Test 2: Check Neumann boundary condition at x=1
    h = x(2) - x(1);  % spatial step size
    neumann_error = max(abs((u(end,:) - u(end-1,:))/h));
    fprintf('2. Neumann BC Test (should be ≈0):\n');
    fprintf('   Maximum error in u_x at x=1: %e\n\n', neumann_error);
    
    % Test 3: Check initial condition
    ic_error = max(abs(u(:,1) - f(x)));
    fprintf('3. Initial Condition Test (should be ≈0):\n');
    fprintf('   Maximum error at t=0: %e\n\n', ic_error);
    
    % Test 4: Check energy conservation
    energy = sum(u.^2, 1);
    energy_variation = (max(energy) - min(energy))/mean(energy);
    fprintf('4. Energy Conservation Test (should be small):\n');
    fprintf('   Relative energy variation: %e\n\n', energy_variation);
    
    % Test 5: Check CFL condition
    k = t(2) - t(1);  % time step
    c = 2;            % wave speed
    cfl = c*k/h;
    fprintf('5. CFL Condition Test (should be ≤1):\n');
    fprintf('   CFL number: %f\n\n', cfl);
    
    % Visualization of tests
    figure('Position', [100, 100, 1200, 400]);
    
    % Plot 1: Boundary conditions
    subplot(1,3,1)
    plot(t, u(1,:), 'b-', 'Label', 'x=0')
    hold on
    plot(t, (u(end,:) - u(end-1,:))/h, 'r-', 'Label', 'x=1')
    title('Boundary Conditions')
    xlabel('Time')
    ylabel('Value')
    legend('u(0,t)', 'u_x(1,t)')
    grid on
    
    % Plot 2: Energy conservation
    subplot(1,3,2)
    plot(t, energy/energy(1), 'k-')
    title('Normalized Energy')
    xlabel('Time')
    ylabel('E(t)/E(0)')
    grid on
    
    % Plot 3: Solution at different times
    subplot(1,3,3)
    plot(x, u(:,1), 'b-', 'LineWidth', 2)
    hold on
    plot(x, u(:,end), 'r--', 'LineWidth', 2)
    title('Solution Profiles')
    xlabel('x')
    ylabel('u(x,t)')
    legend('t=0', 'final')
    grid on
end