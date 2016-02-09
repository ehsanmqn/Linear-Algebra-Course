A = input('Enter cofficient matrix of linear equation system : ');
b = input('enter right hand of linear equation system : ');
n = input('enter number of unknown : ');

for i=1 : n
    for j=1 : n
        l(i,j) = 0;
    end
end
for i=1 : n
    d(i) = 0;
end

d(1) = A(1,1);
for i=2 : n
    l(i,1) = A(1,i) / A(1,1);
end

for j=2 : n
    for i=j+1 : n
        s = 0;
        for k=1 : i-1
            s = s + l(j,k) * l(i,k) * d(k);
        end
        l(i,j) = ( A(j,i) - s ) / d(j);
    end
    s = 0;
    for k=1 : j-1
        s = s + l(j,k) * l(j,k) * d(k);
    end
    d(j) = A(j,j) - s;
end

for i=1 : n
    s = 0;
    for j=1 : i-1
        s = s + l(i,j) * d(j) * X(j);
    end
    X(i) = ( b(i) - s ) / d(i);
end

for i=n-1 : -1 : 1
    s = 0;
    for j=i+1 : n
        s = s + l(j,i) * X(j);
    end
    X(i) = X(i) - s;
end
disp(l);
disp(d);
disp(X);