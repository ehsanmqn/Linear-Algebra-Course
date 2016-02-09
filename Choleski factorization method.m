A = input('please enter cofficient matrix of linear equation system : ')
b = input('please enter the right hand side of equation : ')
n = input('the number of unkown : ')

for i=1 : n
    for j=1 : n
        l(i,j) = 0;
        u(i,j) = 0;
    end
end

for k=1 : n-1
    if A(k,k) == 0
        disp('there is no LU solution');
        stop;
    else
        for i=k+1  : n
            A(i,k) = A(i,k) / A(k,k);
            for j=k+1 : n
                A(i,j) = A(i,j) - A(i,k) * A(k,j);
            end
        end
    end
end
        for i=1 : n
            l(i,i) = 1;
            for j=1 : i-1
                l(i,j) = A(i,j);
            end
        end
        disp('L = ');
        disp(l);
        
        for i=1 : n
            for j=i : n
                u(i,j) = A(i,j);
            end
        end
        disp('U = ');
        disp(u);
        
        X(1) = b(1);
        for i=2 : n
            s = 0;
            for j=1 : i-1
                s = s + l(i,j) * X(j);
            end
            X(i) = b(i) - s;
        end
        
        X(n) = X(n) / A(n,n);
        for i=n-1 : -1 : 1
            s = 0;
            for j=i+1 : n
                s = s + u(i,j) * X(j);
            end
            X(i) = ( X(i) - s )/ u(i,i);
        end
    disp('X = ');
    disp(X);
