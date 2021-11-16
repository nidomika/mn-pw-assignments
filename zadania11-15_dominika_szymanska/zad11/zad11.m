I = @(x) 1./(1+exp(-0.25.*x));
x = linspace(-2,3);
a = -2;
b = 3;

plot(x, I(x))
title('Wykres funkcji 1/(1+exp(-0.25*x))')
xlabel('x');
ylabel('y');

n1 = [-0.577350  0.577350];
n2 = [-0.774597 0 0.774597];
n3 = [-0.861136 -0.339981 0.339981 0.861136];
n4 = [-0.906180 -0.538469 0 0.538469 0.906180];

A1 = [1 1];
A2 = [5/9 8/9 5/9];
A3 = [0.347855 0.652145 0.652145 0.347855];
A4 = [0.236927 0.478629 0.568889 0.478629 0.236927];

k1 = legendre(n1, a, b, I, A1)
k2 = legendre(n2, a, b, I, A2)
k3 = legendre(n3, a, b, I, A3)
k4 = legendre(n4, a, b, I, A4)

dokladna = simpson(1000, a, b, I)

function value = legendre(n, a, b, f, A)
    sum = 0;
    for i = 1:length(n)
        x = (b-a)/2 * n(i) + (b+a)/2;
        sum = sum + A(i) * f(x);
    end
    value = (b-a)/2 * sum;
end

function sum = simpson(n, a, b, f)
    h = (b-a)/n;
    x = a:h:b;
    sum = 0;
    for i = 0:2:n-2
        sum = sum + (h/3) * (f(x(i+1))+4*f(x(i+2))+f(x(i+3)));
    end
end