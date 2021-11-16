C = 1.1 * 10^-3;
R = 1 * 10^3;
I = 1.2 * 10^-3;

P = (R^2*I^2)/(C+R);

bezwC = 0.05 * abs(C);
bezwR = 0.02 * abs(R);
bezwI = 0.01 * abs(I);

pochC = -(R^2*I^2)/(C+R)^2;
pochR = (I^2*R*(2*C+R))/(C+R)^2;
pochI = (2*I*R^2)/(C+R);

bezwglP = abs(pochC)*bezwC + abs(pochR)*bezwR + abs(pochI)*bezwI
wzglP = bezwP/abs(P)

wC = abs(pochC*C)/abs(P);
wR = abs(pochR*R)/abs(P);
wI = abs(pochI*I)/abs(P);

dC = bezwC/abs(C);
dR = bezwR/abs(R);
dI = bezwI/abs(I);

wskwzglP = wC*dC + wR*dR + wI*dI