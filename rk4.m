% Solves a differenctial equation using the Runge-Kutta 4th Order Method
function [t,y] = rk4(func, yStart, tStart, tEnd, dt)


% Pre-allocates memory space for arrays
n = floor(((tEnd+0.1)-tStart)/dt);
t = (tStart:dt:tEnd)';
y = yStart;
yArray = zeros(n,1);


% Creates a loop that goes from 1 to n, solves for k1,k2,k3,& k4, ...
% replaces the values of yArray with y values, & replaces y with new y
for i = 1:1:n
    
    k1 = dt*func(t(i), y);
    k2 = dt*func(t(i)+0.5*dt, y+0.5*k1);
    k3 = dt*func(t(i)+0.5*dt, y+0.5*k2);
    k4 = dt*func(t(i)+dt, y+k3);
    
	yArray(i,:) = y + (1/6)*(k1+2*k2+2*k3+k4);
	y = yArray(i,:)

end


%%%%% Plotting %%%%%
plot(yArray,t)
xlabel('y')
ylabel('t')
grid on


end
