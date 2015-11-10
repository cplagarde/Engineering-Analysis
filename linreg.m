%% Linear Regression
% Chandler Lagarde
% Finds a linear trend line given a set of independent and dependent data.



function [a1,a0,r2] = linreg(x,y)

% Parameters
n = length(x);
xavg = mean(x);
yavg = mean(y);

% Sum of given data using MATLAB's built in sum function
sumx = sum(x);
sumy = sum(y);
sumx2 = sum(x.*x);
sumxy = sum(x.*y);

% Linear constants
a1 = (n*sumxy-(sumx*sumy))/(n*sumx2-(sumx)^2);
a0 = yavg-a1*xavg;

% Standard deviation and r^2 value
st = sum((y-mean(y)).^2);

sr = 0;
for i = 1:1:n
    sr = sr + (y(i)-a0-a1*x(i))^2;
end

r2 = (st - sr)/(st);


% Plot
xp = linspace(min(x),max(x),20)
yp = a0+a1*xp
plot(x,y,'o',xp,yp)
xlabel('Velocity')
ylabel('Drag Force')

end
