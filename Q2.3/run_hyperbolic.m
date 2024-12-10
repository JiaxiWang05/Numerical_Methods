% Set parameters
x = 0.5;          % spatial position spatial coordinate where the solution is computed.
t = 1.0;          % time at which the solution is computed.
L = 1.0;          % domain length, used to calculate the eigenvalues 
c = 1.0;          % wave speed
A = [1, 0, -3];   % coefficients for cosine terms array of coefficients	for the initial displacement
B = [1, 2];       % coefficients for sine terms  array of coefficients, initial velocity 


% Call the function
u = hyperbolic_analytical(x, t, L, c, A, B)