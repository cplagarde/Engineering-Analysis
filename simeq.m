%% Simeq
% Chandler Lagarde
% 10/22/2015
% Simeq solves a system of simultaneous linear equations

function [x] = simeq(A,b,n)

[L,U] = decomp (A,n);

[x] = solve(A,L,U,b,n);


end



%% LU Decomposition
% Chandler Lagarde
% 10/22/2015
% LU Decomposition using Algorithm for Crout's Method
function [L,U] = decomp (A, n)


L = zeros(n,n);
U = eye(n);

% If statement causing the function to equal zero if A(1,1) == 0
if A(1,1) == 0
    flag = 0
    return
else
    flag = 1
end

% For statement that changes first column of L
for i = 1:n
    L(i,1) = A(i,1);
end

% For statement that changes first row, except the first value, of U
for j = 2:n
    U(1,j) = A(1,j)/L(1,1);
end

% For statement that implements LU decomposition with the algorithm for
% Crout's Method
for j = 2:(n-1)
    
    for i = j:n
        sum = 0;
        for k = 1:(j-1)
            sum = sum + L(i,k) * U(k,j);
        end
        L(i,j) = A(i,j) - sum;
    end
    
    % If statement to check if any value of A on the diagnol is zero
    if A(j,j) == 0
        flag = 0
        return
    else
        flag = 1
    end
    
    for k = (j+1):n
        sum = 0;
        for i = 1:(j-1)
            sum = sum + L(j,i) * U(i,k);
        end
        U(j,k) = (A(j,k) - sum)/L(j,j);
    end
end

% Solve for the final space in the L matrix
sum = 0;
for k = 1:(n-1)
    sum = sum + L(n,k) * U(k,n);
end
L(n,n) = A(n,n) - sum;


end



%% Solve
% Chandler Lagarde
% 10/22/2015
% Solve accepts L&U, along with b, and calculates solution vector, x
function [x] = solve(A,L,U,b,n)

y = zeros(n,1);

% Forward elimination step
y(1) = b(1) / L(1,1);
for i = 2:n
    sum = 0;
    for j = 1:(i-1)
        sum = sum + L(i,j) * y(j);
    end
    y(i) = (b(i) - sum)/L(i,i);
end

% Back substitution step
x(n) = y(n);
for i = (n-1):-1:1
    sum = 0;
    for j = (i+1):n
        sum = sum + U(i,j) * x(j);
    end
    x(i) = y(i) - sum;
end


end
