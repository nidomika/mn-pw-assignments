x = linspace(-1.5,1.5);
a = -1.5;
b = 1.5;
n = [3 5 6 8 9];

f = @(x) 1./(1+25*x.^2);
y = f(x);

plot(x, y, 'k', 'LineWidth', 1.5) % wykres funkcji

figure(1);
hold on
for i = 1 : length(n)
    xrowno = linspace(-1.5,1.5,n(i));
    yrowno = f(xrowno);
    yl = lagrange(xrowno, yrowno, x); % interpolacja Lagrange'a

    yr = zeros(size(x));
    for j = 1 : length(x)
        yr(j) = y(j) - yl(j);
    end
    avg = mean(yr);
    fprintf('średni błąd dla %d węzłów: %d\n', n(i), avg)
    s = rand(1,3);
    plot(x, yl, 'color', s)
    plot(x, yr, '-.', 'color', s)
end
hold off

title('Interpolacje dla równoodległych węzłów')
xlabel('x');
ylabel('y');
grid on
legend('funkcja Czebyszewa', 'interpolacja', 'odpowiadający interpolacji błąd')

function yy = lagrange(x, y, xx)
   yy = zeros(size(xx));
    for z = 1 : length(xx)
        n = length(x) - 1;
        sum = 0;
        for i = 1 : n+1
            prod = 1;
            for j = 1 : n+1
                if j ~= i
                    prod = prod * (xx(z)-x(j))/(x(i)-x(j));
                end
            end
            sum = sum + y(i) * prod;
        end
        yy(z) = sum;
    end
end