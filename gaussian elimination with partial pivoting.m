% mohamadJavad Behbahani 87370006
% Ehsan Maiqani 87370040
% Gaussian Elimination with Partial Pivoting

A=input('Coefficient matrix of linear equation systems : ')
b=input('the right hand side of linear equation systems : ')
n=input('the number of unknown : ');
A(:,n+1)=b;

for k=1 : n-1
    max = -1;
    for row=k : n
        if abs(A(row,k)) > max
            max = abs(A(row,k));
            index = row;
        end
    end
    if index ~= k
        for j=k : n+1
            temp = A(k,j);
            A(k,j) = A(index,j);
            A(index,j) = temp;
        end
    end
    for row=k+1 : n
        for col=k+1 : n+1
            A(row,col) = A(row,col) - A(row,k)/A(k,k)*A(k,col);
        end
    end
end
if A(n,n)==0 && A(n,n+1)~=0
    disp('problem has no solution!')
elseif A(n,n)==0 && A(n,n+1)==0
    disp('problem has infinite solution (no uniqu solution found)!')
else
    X(n)=A(n,n+1)/A(n,n);
    for row=n-1 :-1 : 1
        sum=0;
        for col=row+1 : n
            sum = sum + A(row,col)*X(col);
        end
        X(row) = (A(row,n+1) - sum) / A(row,row);
    end
    disp('the solution is : ');
    disp(X);
end