ydt = @(x,y) -0.3 * y;
y0 = 2;
a = 0;
b = 1;
h1 = 1/2;
h2 = 1/4;

x = linspace(0,1);
xh1 = 0:h1:1;
xh2 = 0:h2:1;
y1 = ul_euler(h1, a, b, ydt, y0)
y2 = ul_euler(h2, a, b, ydt, y0)

hold on
plot(xh1, y1, 'o')
plot(xh2, y2, '*')
hold off
title('Rozwiązanie ulepszoną metodą Eulera');
legend('dla kroku h=1/2', 'dla kroku h=1/4')
xlabel('t');
ylabel('y');
grid on;

function y = ul_euler(h, a, b, f, y0)
    x = a:h:b;
    y = zeros(1, length(x));
    y(1) = y0;
    for i = 1:length(x) - 1
        y(i+1) = y(i) + h*f(x(i)+h/2, y(i)+h/2*f(x(i), y(i)));
    end
end
