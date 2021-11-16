x0 = [-0.5; -0.5];

solved = false;
while ~solved
    F = @(x0) [x0(1)*x0(2) - x0(1) - 2; x0(1)^2 - x0(2)^2 - 1];
    J = @(x0) [x0(2) - 1, x0(1); 2*x0(1), - 2*x0(2) ];
    x0 = x0 - J(x0)\F(x0);
    if (abs(F(x0)) < 0.001)
        solved = true;
    end
end

[x1,x2] = meshgrid(linspace(-2,2,30));

surf(x1, x2, x1.*x2 - x1 - 2);
hold on
surf(x1, x2, x1.^2 - x2.^2 - 1);
scatter3(x0(1),x0(2),x0(1)*x0(2) - x0(1) - 2, 'red', 'filled')
camorbit(90,0)
hold off

format shortg;
annotation("textarrow", [0.6 0.35], [0.8 0.63], 'String', round(x0,3));
xlabel('x1');
ylabel('x2');
zlabel('f(x1,x2)');
title('Rozwiązanie układu nieliniowego metodą Newtona');
grid on;
