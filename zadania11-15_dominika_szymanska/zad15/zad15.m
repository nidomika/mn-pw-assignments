p = @(x) 1/5 + 1/20.*x + 1./(1+exp(-2.*(x-1))) - 1./(1+exp(-3.*x));
x = linspace(-5,5,10);
y = p(x);
d = 1e-6;

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
    solutions(i) = bisect(have_solutions(i,1),have_solutions(i,2), p, d);
end

plot(linspace(-5,5), p(linspace(-5,5)))
title('Wykres funkcji f(x)');
xlabel('x');
ylabel('y');
grid on;

function solution = bisect(x1, x2, f, d)
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
        if (abs(x2-x1) < d)
            solved = true;
        end
    end
    solution = x1;
end



