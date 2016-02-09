A = input ('Cofficeiont matrix of linear equation sestem : ')
b = input ('The right hand of linear equation system : ')
n = input ('The number of unkown :')

A(:,n+1) = b;
% in this section we find maximum element of any rows
for row=1 : n
    max(row) = -1;
    for col=1 : n
        if abs(A(row,col)) > max(row)
            max(row) = abs(A(row,col));
        end
    end
end

flag = 1;
for k=1 : n-1
    % in this section we find maximum element of column k
    maximum = -1;
    for row=k : n
        if abs(A(row,k)/max(row)) > maximum
            maximum = abs(A(row,k)/max(row));
            index = row;
            % index is the smalest positive number that indicate the
            % maximum element location
        end
    end
  
    if (A(index,k) / max(index)) == 0
        disp('no such problem');
        flag=-1;
        break;
    else
        for col=1 : n+1
            temp=A(index,col);
            A(index,col)=A(k,col);
            A(k,col)=temp;
        end
        for row=k+1 : n
            for col=k+1 : n+1
                A(row,col) = A(row,col) - (A(row,k)/A(k,k))*A(k,col);
            end
        end
    end
end % end of k loop
if flag ~= -1 
    if A(n,n) == 0 && A(n,n+1) ~= 0 
        disp('System has no solution!');
        break;
    elseif A(n,n) == 0 && A(n,n+1) == 0  
        disp('System has infinite solution');
        break;
    else
        X(n) = A(n,n+1)/A(n,n);
        for i=n-1 : -1 : 1
            sum=0;
            for j=i+1 : n
                sum = sum + A(i,j)*X(j);
            end
            X(i) = (A(i,n+1)-sum)/A(i,i);
        end
    end
    disp('Solution is : ');
    disp(X);
end % end of flag condition