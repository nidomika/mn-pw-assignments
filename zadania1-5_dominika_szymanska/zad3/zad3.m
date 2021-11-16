xi = [0.1 0.3 0.6 0.8];
yi = [-1 1.2 1.0 1.5];

b = zeros(length(xi), length(yi));
b(:, 1) = yi(:);

for i = 2 : length(xi) 
    for j = i : length(xi) 
        b(j, i) = (b(j, i-1) - b(j-1, i-1)) / (xi(j) - xi(j-i+1));
    end
end

x = 0.55;
WN = @(x) b(1,1) + b(2,2) .* (x - xi(1)) + b(3,3) .* (x - xi(1)) .* (x - xi(2)) +  b(4,4) .* (x - xi(1)) .* (x - xi(2)) .* (x-xi(3));
WN(x)

plot(xi,yi,'p')
hold on
plot(x, WN(x), 's')
text(x - 0.05,WN(x) + 0.2,['(',num2str(x),',',num2str(WN(x)),')']);
x = linspace(0.1,0.8);
plot(x,WN(x))
hold off

xlabel('x')
ylabel('y')

grid on
