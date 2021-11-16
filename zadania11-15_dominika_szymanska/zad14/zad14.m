y = [2; -3];
h = 0.1;
t = 0:h:1.5;

for i = 1:length(t) - 1
    y(:,i+1) = y(:, i) + h*f(t(i), y(:,i));
end

hold on
plot(t, y(1,:))
plot(t, y(2,:))
legend('y_1','y_2', 'Location', 'best');
title('Wykres równań różniczkowych zwyczajnych');
xlabel('x');
ylabel('y');
grid on;
hold off

y = y(:, 1:3)

function dy = f(t, y)
    dy = [y(2); 4 - 0.5*y(1) + 0.4*y(2)];
end