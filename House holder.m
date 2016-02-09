x = input('Enter vector x : ')
n = input('Number of unknown : ');

e1 = x;
e1(1) = 1;
for j = 2 : n
    e1(j) = 0;
end

sigma = -1 * sign(x(1)) * norm(x,2);
s = norm(x - sigma * e1,2);
w(1) = (x(1) - sigma ) / s;

for i = 2 : n
    w(i) = x(i) / s;
end

disp(sigma);
disp(w);