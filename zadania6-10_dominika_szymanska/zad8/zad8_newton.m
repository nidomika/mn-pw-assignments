p = @(x) -0.1*x.^4 + 0.8*x.^3 - 0.6*x.^2 - 2*x + 1.5;
pdx = @(x) -0.4*x.^3 + 2.4*x.^2 - 1.2*x -2;

x = linspace(-3,6);
y = p(x);

have_solutions = zeros(3,2);
k = 1;
for i = 1:(length(y) - 1)
    if(y(i)*y(i+1) <= 0)
        have_solutions(k, 1) = x(i);
        have_solutions(k, 2) = x(i+1);
        k = k + 1;
    end
end

solutions = zeros(1,3);
for i = 1:3
    solutions(i) = newton(have_solutions(i,1), p, pdx);
end

hold on
yline(0);
plot(x, p(x))
plot(solutions, p(solutions), 'o')
annotation('textarrow', [0.21 0.25], [0.81 0.67], 'String', round(solutions(1),3))
annotation('textarrow', [0.4 0.45], [0.8 0.67], 'String', round(solutions(2),3))
annotation('textarrow', [0.7 0.57], [0.4 0.63], 'String', round(solutions(3),3))
hold off

function solution = newton(x1, f, fdx)
    solved = false;    
    while ~solved
        x1 = x1 - f(x1)/fdx(x1);
        if(abs(f(x1)/fdx(x1)) < 0.001)
            solution = x1;
            solved = true;
        end
    end
end