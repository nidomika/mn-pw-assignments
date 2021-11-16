x_i = [0.2 0.3 0.4 0.5 0.6 0.7 0.8];
y_i = [0 0 1 1 0 0 0.5];
n = length(x_i) - 1;
h = (x_i(n+1)-x_i(1))/n;
l = h*(n+1)/2;
c = pi/l;

sum_sin = @(x,y, m) sum(y.*sin(m*c.*x));
sum_cos = @(x,y, m) sum(y.*cos(m*c.*x));

a_0 = (1/(n+1))*sum(y_i);
a_1 = (2/(n+1))*sum_cos(x_i, y_i, 1);
a_2 = (2/(n+1))*sum_sin(x_i, y_i, 1);
a_3 = (2/(n+1))*sum_cos(x_i, y_i, 2);
a_4 = (2/(n+1))*sum_sin(x_i, y_i, 2);

W = @(x) a_0 + a_1*cos(c.*x) + a_2*sin(c.*x) + a_3*cos(2*c.*x) + a_4*sin(2*c.*x);
hold on
plot(linspace(0, 1), W(linspace(0, 1)));
plot(x_i, y_i, 'p');
title("Aproksymacja trygonometryczna drugiego rzędu");
xlabel("x");
ylabel("y")
legend("funkcja", "węzły");
hold off