clc;
clear;

disp("Regression and Standard Error");

X = [60 62 65 70 72 48 53 73 65 82];
Y = [68 60 62 80 85 40 52 62 60 81];

n = length(X);

// Mean
mx = mean(X);
my = mean(Y);

// Regression of Y on X
b_yx = sum((X-mx).*(Y-my)) / sum((X-mx).^2);
a_yx = my - b_yx*mx;

disp("Regression equation of Y on X:");
disp("Y = " + string(a_yx) + " + " + string(b_yx) + "X");

// Estimate productivity for X = 92
x0 = 92;
y0 = a_yx + b_yx*x0;

disp("Estimated productivity for X = 92:");
disp(y0);

// Regression of X on Y
b_xy = sum((X-mx).*(Y-my)) / sum((Y-my).^2);
a_xy = mx - b_xy*my;

disp("Regression equation of X on Y:");
disp("X = " + string(a_xy) + " + " + string(b_xy) + "Y");

// Fitted values of Y
Yfit = a_yx + b_yx*X;

// Standard error of Y on X
SE_yx = sqrt(sum((Y-Yfit).^2)/(n-2));

disp("Standard error estimate Y on X:");
disp(SE_yx);

// Fitted values of X
Xfit = a_xy + b_xy*Y;

// Standard error of X on Y
SE_xy = sqrt(sum((X-Xfit).^2)/(n-2));

disp("Standard error estimate X on Y:");
disp(SE_xy);
