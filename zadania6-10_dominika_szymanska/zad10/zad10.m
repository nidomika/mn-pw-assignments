f = @(x) exp(x.^2);
x = linspace(-2, 1);
X = linspace(-2,1,7);

sum = 0;
for i = 1:length(X) - 1
    sum = sum + f(X(i)) * (X(i+1) - X(i));
end
wolfram = 17.9153;
sum
blad_bezwzgledny = abs(sum - wolfram)
blad_wzgledny = blad_bezwzgledny / wolfram
plot(x, f(x));
title('exp(x^2)');
xlabel('x');
ylabel('y');
grid on;