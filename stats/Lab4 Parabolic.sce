clc;
clear;

disp("Parabolic Fit");

n = input("Enter the no. of observations: ");
x = input("Enter the values of xi: ");
y = input("Enter the values of yi: ");

// Calculate required sums
Sx = sum(x);
Sxx = sum(x .* x);
Sxy = sum(x .* y);
Sx3 = sum(x .^ 3);
Sx4 = sum(x .^ 4);
Sx2y = sum((x .* x) .* y);
Sy = sum(y);

// Matrix A
A = [Sx4 Sx3 Sxx;
     Sx3 Sxx Sx;
     Sxx Sx n];

// Matrix B
B = [Sx2y;
     Sxy;
     Sy];

// Calculate coefficients
X = A \ B;

// Coefficients
a = X(1);
b = X(2);
c = X(3);

// Display coefficients
disp("Coefficient a = " + string(a));
disp("Coefficient b = " + string(b));
disp("Coefficient c = " + string(c));

disp("Parabolic equation:");
disp("y = " + string(a) + "x^2 + " + string(b) + "x + " + string(c));

// Calculate fitted values
y_fit = a .* (x .^ 2) + b .* x + c;

disp("Fitted Y values:");
disp(y_fit);

// Plot
xx = linspace(min(x), max(x), 100);
yy = a .* (xx .^ 2) + b .* xx + c;

clf();

plot(x, y, "ko");
plot(xx, yy, "b-");

xtitle("Parabolic Fit", "X Values", "Y Values");
legend(["Observed Data"; "Parabolic Fit"]);
