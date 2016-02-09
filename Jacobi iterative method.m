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
    d(i,i) = 1 / A(i,i);
end

for i =1 : n
    for j = 1 : n
        if(i>j)
            l(i,j) = -1 * A(i,j);
        elseif (i<j)
            u(i,j) = -1 * A(i,j);
        end
    end
end

k = 1;
i=0;
while(k == 1)
    i = i+1;
    w = d * (l + u) * x;
    w = w + d * b;
    if ( norm(w - x,inf) <= tol )
        k = 0;
    else
        x = w;
    end
end

disp('k = ');
disp(i);
disp('X(1) = ');
disp(w(1));
disp('X(2) = ');
disp(w(2));
disp('X(3) = ');
disp(w(3));
