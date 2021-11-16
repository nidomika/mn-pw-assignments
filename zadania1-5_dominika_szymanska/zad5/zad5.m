xi = [0.1 0.2 0.3];
yi = [-2.79 -2.26 -1.99];
alfa = 4.02;
beta = -2.62;
n = length(xi) - 1;

h = (xi(3) - xi(1)) / n;
d = [yi(1) + (alfa * h/3); yi(2); yi(3) - (beta * h/3)];
A = [4 2 0; 1 4 1; 0 2 4];

c = A \ d;

cminus1 = c(1) + (alfa * h/3);
cnplus1 = c(3) + (beta * h/3);
c = [cminus1 c' cnplus1];

xii = [xi(1)-3*h, xi(1)-2*h, xi(1)-1*h, xi(1)+0*h, xi(1)+1*h, xi(1)+2*h, xi(1)+3*h, xi(1)+4*h, xi(1)+5*h];

o = linspace(0.1,0.3);
S = zeros(size(o));

hold on
plot(xi, yi, 'o');
for m = 1:length(o)
    sum = 0;
    x = o(m);
    for i = 1 : length(c)
        if (x >= xii(i)) && (x <= xii(i+1))
            phi_i = (x - xii(i))^3;
        elseif (x >= xii(i+1)) && (x <= xii(i+2))
            phi_i = (x-xii(i))^3-4*(x-xii(i+1))^3;
        elseif (x >= xii(i+2)) && (x <= xii(i+3))
            phi_i = (xii(i+4)-x)^3-4*(xii(i+3)-x)^3;
        elseif (x >= xii(i+3)) && (x <= xii(i+4))
            phi_i = (xii(i+4)-x)^3;
        elseif (x >= xii(i+4)) && (x <= xii(i))
            phi_i = 0;
        end
        sum = sum + 1/h^3 * c(i) * phi_i;
    end
    S(m) = sum;
end
plot(o, S)
hold off

x = 0.55;
sum = 0;
for i = 1 : length(c)
    if (x >= xii(i)) && (x <= xii(i+1))
        phi_i = (x - xii(i))^3;
    elseif (x >= xii(i+1)) && (x <= xii(i+2))
        phi_i = (x-xii(i))^3-4*(x-xii(i+1))^3;
    elseif (x >= xii(i+2)) && (x <= xii(i+3))
        phi_i = (xii(i+4)-x)^3-4*(xii(i+3)-x)^3;
    elseif (x >= xii(i+3)) && (x <= xii(i+4))
        phi_i = (xii(i+4)-x)^3;
    elseif (x >= xii(i+4)) && (x <= xii(i))
        phi_i = 0;
    end
    sum = sum + 1/h^3 * c(i) * phi_i;
end

sum



