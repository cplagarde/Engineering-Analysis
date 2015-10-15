function root = newton(x, stop, func)
%
% Newton-Raphson Lab
%

maxiter = 25;
% defines the max iteration to 25 times
i = 0;
% defines initial value of i
h = 1*exp(-8);
% defines the step size (h) as the optimum step size for double...
% precision

    while (i <= maxiter && abs(func(x)) > stop)
        i = i + 1;
        % i is increasing by one every time the loop runs
        x = x - func(x)/deriv (x, h, func);
        %runs the newton-raphson method
    end
root = x;
end

function dx = deriv ( x , h, func )

    % Forward difference derivative
    dx = (func (x + h) - func(x))./h;
    
end
