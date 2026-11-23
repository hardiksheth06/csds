clc;
clear;

disp("Exponential Fit");

n = input("Enter the no. of observations: ");
x = input("Enter the values of x: ");
y = input("Enter the values of y: ");

// Take logarithm of y
Y = log(y);

// Calculate required sums
Sx = sum(x);
Sy = sum(Y);
Sxx = sum(x .* x);
Sxy = sum(x .* Y);

// Calculate coefficients
m = (n * Sxy - Sx * Sy) / (n * Sxx - Sx * Sx);
c = (Sy - m * Sx) / n;

// Convert back from logarithmic form
a = exp(c);
b = m;

// Calculate fitted values
yfit = a .* exp(b .* x);

disp("Coefficient a = " + string(a));
disp("Coefficient b = " + string(b));

disp("Exponential equation:");
disp("y = " + string(a) + " * exp(" + string(b) + "x)");

disp("Fitted Y values:");
disp(yfit);

// Plot
xx = linspace(min(x), max(x), 100);
yy = a .* exp(b .* xx);

clf();

plot(x, y, "ko");
plot(xx, yy, "b-");

xtitle("Exponential Fit", "X Values", "Y Values");
legend(["Observed Data"; "Exponential Fit"]);
