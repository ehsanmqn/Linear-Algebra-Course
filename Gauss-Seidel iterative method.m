A = input('Enter cofficient matrix of linear equation system : ')
b = input('Enter right hand of linear equation system : ')
n = input('Enter number of unknown : ');
x = input('Enter initial matrix of x : ')
tol = input('Enter value of e : ');

for i = 1 : n
    for j = 1 : n
        l(i,j) = 0;
        u(i,j) = 0;
        w(i,j) = 0;
    end
end

for i = 1 : n
    d(i,i) = A(i,i);
    l(1,i) = 0;
    u(i,1) = 0;
    for j = 1 : i-1
        l(i,j) = -1  * A(i,j);
    end
    for j = i+1 : n
        u(i,j) = -1 * A(i,j);
    end
end

t = inv(d-l) * u;
c = inv(d-l) * b;

k = 1;
i = 0;
while(k == 1)
    i = i+1;
    w = t * x + c;
    if( norm(w - x,inf) <= tol)
        k = 0;
    else
        x = w;
    end
end

disp('Result : ');
disp(w);