p = @(x) -0.1*x.^4 + 0.8*x.^3 - 0.6*x.^2 - 2*x + 1.5;
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
    solutions(i) = bisect(have_solutions(i,1),have_solutions(i,2), p);
end

hold on
yline(0);
plot(x, p(x))
plot(solutions, p(solutions), 'o')
format shortg
annotation('textarrow', [0.21 0.25], [0.81 0.67], 'String', round(solutions(1),3))
annotation('textarrow', [0.4 0.45], [0.8 0.67], 'String', round(solutions(2),3))
annotation('textarrow', [0.7 0.57], [0.4 0.63], 'String', round(solutions(3),3))

xlabel('x');
ylabel('y');
title('p = -0.1x^4 + 0.8x^3 - 0.6x^2 - 2x + 1.5')
hold off

function solution = bisect(x1, x2, f)
    solved = false;   
    while ~solved
        a = x1;
        b = x2;
        c = (a + b)/2;
        if (f(a)*f(c)<= 0)
            b = c;
        elseif (f(b)*f(c) <= 0)
            a = c;
        end
        x1 = a;
        x2 = b;
        if (abs(x2-x1) < 0.001)
            solved = true;
        end
    end
    solution = x1;
end



