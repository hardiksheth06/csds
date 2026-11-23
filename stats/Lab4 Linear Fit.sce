clc;
clear;


disp("Linear Fit");

n = input("Enter the no. of observations: ");

x = input("Enter the values of x: ");
y = input("Enter the values of y: ");

// Required summations
Sx = sum(x);
Sy = sum(y);
Sxx = sum(x.*x);
Sxy = sum(x.*y);

// Normal equations
A = [Sxx Sx;
     Sx n];

B = [Sxy;
     Sy];

// Calculate coefficients
X = inv(A)*B;

m = X(1);
c = X(2);

// Display results
disp("Slope m = " + string(m));
disp("Intercept c = " + string(c));

disp("Linear equation:");
disp("y = " + string(m) + "x + " + string(c));

// Calculate fitted values
y_fit = m.*x + c;

disp("Fitted Y values:");
disp(y_fit);

// Plot
xx = linspace(min(x), max(x), 100);
yy = m.*xx + c;

clf();

plot(x, y, "ko");
plot(xx, yy, "b-");

xtitle("Linear Fit", "X Values", "Y Values");

legend(["Observed Data"; "Linear Fit"]);
