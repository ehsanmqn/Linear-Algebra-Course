A = input('Enter cofficient matrix of linear equation system : ')
b = input('Enter right hand of linear equation system : ')
n = input('Enter scal of matrix (n) : ');

% creating L and U matrices
l(1,1) = A(1,1);
for k = 2 : n
    l(k,k-1) = A(k,k-1);
end
for k = 1 : n
    u(k,k) = 1;
end

for i = 1 : n-1
    u(i,i+1) = A(i,i+1) / l(i,i);
    l(i+1,i+1) = A(i+1,i+1) - l(i+1,i) * u(i,i+1);
end
disp(l);
disp(u);

%calculating X from LUx = b
x(1) = b(1) / l(1,1);
for i = 2 : n
    x(i) = (b(i) - l(i,i-1) * x(i-1)) / l(i,i);
end

for i = n-1 : -1 : 1
    x(i) = x(i) - u(i,i+1) * x(i+1);
end

disp('Result : ');
disp(x);