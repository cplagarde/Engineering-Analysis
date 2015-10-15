% Function for a forward derivative


function [dx] = deriv ( x , h )
%
% Numerical Derivatives Lab
%

% Toggle this (with comments) to change from double to single precision
% x = single(x);
% h = single(h);

    % Forward difference derivative
    dx = (func (x + h) - func(x))./h;
    
end

function f = func (x)
%
% Function to evaluate is f(x) = 4x + 3x^2
%

    f = 4*x + 3*x.^2;

end
