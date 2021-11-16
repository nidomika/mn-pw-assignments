u = -1:.25:1;
i = [0.01 -0.02 0.02 -0.01 0 0.08 0.22 0.6 0.98];

a = linspace(-1.5,1.5);
points = [-0.6 0.69];
extrap = interp1(u, i, a, 'linear', 'extrap');
hold on
plot(a, extrap)
pp = spline(u, i, a);
plot(a, pp)
plot(a(70), pp(70), 's', a(37), pp(37), 's')
text(a(70), pp(70)+0.1, ['(', num2str(a(70)), ',', num2str(pp(70)), ')']);
text(a(37), pp(47)+0.1, ['(', num2str(a(37)), ',', num2str(pp(37)), ')'])
plot(u, i, '*')
hold off

xlabel('u [V]')
ylabel('i [A]')
title('Wykres i(u)[A]')

legend('węzły', 'interpolacja 1. stopnia z ekstrapolacją','interpolacja 3. stopnia z ekstrapolacją', 'Location','northwest')