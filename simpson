function [I] = simpson ( a, b, n, func)
%
% Numerical Derivatives Lab
%

h = (b-a)/n;
sumO = 0;
sumE = 0;

    for i = a+h: 2*h: b-h
        sumO = sumO + 4*func(i);
    end
    
    for i = a+2*h: 2*h : b-2*h
        sumE = sumE + 2*func(i);
    end
    
I = (h/3)*(func(a) + sumO + sumE + func(b));

end
