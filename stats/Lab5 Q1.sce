clc;
clear;

disp("Partial Correlation, Multiple Correlation and Regression Planes");

X = [1 2 3 4 5 6];
Y = [3 4 5 6 7 8];
Z = [5 8 11 14 17 20];

n = length(X);

// Means
mx = mean(X);
my = mean(Y);
mz = mean(Z);

// Standard deviations
sx = sqrt(sum((X-mx).^2)/n);
sy = sqrt(sum((Y-my).^2)/n);
sz = sqrt(sum((Z-mz).^2)/n);

// Correlation coefficients
rxy = sum((X-mx).*(Y-my)) / (n*sx*sy);
ryz = sum((Y-my).*(Z-mz)) / (n*sy*sz);
rxz = sum((X-mx).*(Z-mz)) / (n*sx*sz);

disp("Correlation coefficients:");
disp("r(X,Y) = " + string(rxy));
disp("r(Y,Z) = " + string(ryz));
disp("r(X,Z) = " + string(rxz));

// Partial correlations
den1 = sqrt((1-rxz^2)*(1-ryz^2));
den2 = sqrt((1-rxy^2)*(1-ryz^2));

if abs(den1) < 1e-10 then
    disp("r1.23 = Undefined (0/0 because variables are perfectly correlated)");
else
    r1_23 = (rxy-rxz*ryz)/den1;
    disp("r1.23 = " + string(r1_23));
end

if abs(den2) < 1e-10 then
    disp("r2.13 = Undefined (0/0 because variables are perfectly correlated)");
else
    r2_13 = (rxy-rxy*ryz)/den2;
    disp("r2.13 = " + string(r2_13));
end

// Multiple correlation coefficient
denR = 1-ryz^2;

if abs(denR) < 1e-10 then
    disp("R12.3 = 1");
else
    R12_3 = sqrt((rxy^2 + rxz^2 - 2*rxy*rxz*ryz)/denR);
    disp("R12.3 = " + string(R12_3));
end

// Regression plane Y on X,Z
A1 = [sum(X.^2) sum(X.*Z) sum(X);
      sum(X.*Z) sum(Z.^2) sum(Z);
      sum(X)    sum(Z)    n];

B1 = [sum(X.*Y);
      sum(Z.*Y);
      sum(Y)];

C1 = pinv(A1)*B1;

a1 = C1(1);
b1 = C1(2);
c1 = C1(3);

disp("Regression plane Y on X,Z:");
disp("Y = " + string(a1) + "X + " + string(b1) + "Z + " + string(c1));

// Regression plane Z on X,Y
A2 = [sum(X.^2) sum(X.*Y) sum(X);
      sum(X.*Y) sum(Y.^2) sum(Y);
      sum(X)    sum(Y)    n];

B2 = [sum(X.*Z);
      sum(Y.*Z);
      sum(Z)];

C2 = pinv(A2)*B2;

a2 = C2(1);
b2 = C2(2);
c2 = C2(3);

disp("Regression plane Z on X,Y:");
disp("Z = " + string(a2) + "X + " + string(b2) + "Y + " + string(c2));

// Regression plane X on Y,Z
A3 = [sum(Y.^2) sum(Y.*Z) sum(Y);
      sum(Y.*Z) sum(Z.^2) sum(Z);
      sum(Y)    sum(Z)    n];

B3 = [sum(Y.*X);
      sum(Z.*X);
      sum(X)];

C3 = pinv(A3)*B3;

a3 = C3(1);
b3 = C3(2);
c3 = C3(3);

disp("Regression plane X on Y,Z:");
disp("X = " + string(a3) + "Y + " + string(b3) + "Z + " + string(c3));
