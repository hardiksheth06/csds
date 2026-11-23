clc;
clear;

// Input
n = input("Enter number of class intervals: ");

l = input("Enter lower limits: ");
u = input("Enter upper limits: ");
f = input("Enter corresponding frequencies: ");


// CLASS MIDPOINTS

x = zeros(1,n);

for i = 1:n
    x(i) = (l(i) + u(i)) / 2;
end

disp("Class Midpoints = ");
disp(x);


// MEAN

fx = f .* x;

sum_fx = 0;
N = 0;

for i = 1:n
    sum_fx = sum_fx + fx(i);
    N = N + f(i);
end

mean_x = sum_fx / N;

disp("Mean = " + string(mean_x));


// ======================================
// CUMULATIVE FREQUENCY
// ======================================

cf = zeros(1,n);

cf(1) = f(1);

for i = 2:n
    cf(i) = cf(i-1) + f(i);
end

disp("Cumulative Frequency = ");
disp(cf);


// MEDIAN

p = N / 2;

for i = 1:n
    if cf(i) >= p then
        median_class = i;
        break;
    end
end

if median_class == 1 then
    cf_before = 0;
else
    cf_before = cf(median_class - 1);
end

h = u(median_class) - l(median_class);

median_x = l(median_class) + ...
           ((p - cf_before) / f(median_class)) * h;

disp("Median = " + string(median_x));

// MODE

max_f = f(1);
modal_class = 1;

for i = 2:n
    if f(i) > max_f then
        max_f = f(i);
        modal_class = i;
    end
end

f1 = f(modal_class);

if modal_class == 1 then
    f0 = 0;
else
    f0 = f(modal_class - 1);
end

if modal_class == n then
    f2 = 0;
else
    f2 = f(modal_class + 1);
end

h = u(modal_class) - l(modal_class);

mode_x = l(modal_class) + ...
         ((f1 - f0) / (2*f1 - f0 - f2)) * h;

disp("Mode = " + string(mode_x));


// STANDARD DEVIATION

sd_sum = 0;

for i = 1:n
    d = x(i) - mean_x;
    sd_sum = sd_sum + f(i) * (d^2);
end

sd = sqrt(sd_sum / N);

disp("Standard Deviation = " + string(sd));


// COEFFICIENT OF VARIATION

cv = (sd / mean_x) * 100;

disp("Coefficient of Variation = " + string(cv));


// HISTOGRAM

scf(0);
clf();

max_f = max(f);

for i = 1:n
    
    xx = [l(i) u(i) u(i) l(i)];
    yy = [0 0 f(i) f(i)];
    
    xfpoly(xx, yy, 0);
    
    plot([l(i) u(i) u(i) l(i) l(i)], ...
         [0 0 f(i) f(i) 0]);
end

xtitle("Histogram", "Class Intervals", "Frequency");


// FREQUENCY DISTRIBUTION CURVE

scf(1);
clf();

plot(x, f, "b-o");

xtitle("Frequency Distribution Curve", ...
       "Class Midpoints", "Frequency");


plot([mean_x mean_x], [0 max_f], "r");

plot([median_x median_x], [0 max_f], "g");

plot([mode_x mode_x], [0 max_f], "m");

