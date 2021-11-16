f = @(x) 1./(1 + exp(-x));
x_i = -5:1:5;
y_i = f(x_i);

n = length(x_i) - 1;
m = 3; 

M = zeros(n+1,m+1);
for i = 0:n
    for j = 0:m
        M(i+1, j+1) = x_i(i+1)^j;
    end
end

Y = y_i';
MTM = M' * M;
MTY = M' * Y;
A = MTM \ MTY;

W = @(x, A) A(1) + A(2)*x + A(3)*x.^2 + A(4)*x.^3;

y_i_approx = W(x_i, A);
hold on
plot(x_i, y_i)
plot(x_i, y_i_approx)
title("Funkcja i jej aproksymacja wielomianowa trzeciego stopnia")
legend("funkcja","aproksymacja", 'Location','best');
xlabel("x");
ylabel("y");
hold off

% blad
diff_vector = zeros(1, n+1);
for i = 0:n
    diff_vector(i+1) = abs(y_i(i+1) - y_i_approx(i+1));
end
diff = sum(diff_vector) / (n+1)