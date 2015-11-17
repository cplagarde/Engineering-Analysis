%% Non-Linear Curve Fitting
% Chandler Lagarde
% Engineering Analysis 



% Function finds a polynomial trend line given a set of independent...
% and dependent data. x &  y are data points, and m is the order of...
% the desired polynomial.
function [A,b,c,xp,yp] = polyfit(m,x,y)

	% Preallocation
	A = zeros(m+1);
	b = zeros(m+1,1);

	% Fill Matrix A and b
	for i = 1:1:m+1
		sumxy = sum((x.^(i-1)).*y);
		for j = 1:i
			k = i + j - 2;
			A(i,j) = sum(x.^k);
			A(j,i) = A(i,j);
		end
		b(i) = sumxy;
	end

	% Solve for coefficient vactor
	c = A\b;

	% Create curve from coefficients
	% Allocate space for vectors
	np = 20;
	xp = linspace(min(x),max(x),np);
	yp = zeros(length(xp),1);
	L = length(xp);

	% Fill yp vector
	for i = 1:1:L
		sumxp = 0;
		for j = 1:1:m+1
			sumxp = sumxp + (c(j)*xp(i)^(j-1));
		end
		yp(i) = sumxp;
	end

	%% Plotting

	plot(x,y,'o',xp,yp)
end
