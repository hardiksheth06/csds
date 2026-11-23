clc;
clear;

// ======================================
// LAB-II
// MEASURES OF CENTRAL TENDENCY
// DISCRETE / UNGROUPED DATA
// ======================================

// Input
n = input("Enter number of values: ");
x = input("Enter values of x: ");
f = input("Enter corresponding frequencies: ");


// ======================================
// MEAN
// ======================================

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


// ======================================
// MEDIAN
// ======================================

// Find middle position(s)

if modulo(N,2) <> 0 then
    
    // Odd number of observations
    p = (N + 1) / 2;
    
    for i = 1:n
        if cf(i) >= p then
            median_x = x(i);
            break;
        end
    end
    
else
    
    // Even number of observations
    p1 = N / 2;
    p2 = (N / 2) + 1;
    
    for i = 1:n
        if cf(i) >= p1 then
            median1 = x(i);
            break;
        end
    end
    
    for i = 1:n
        if cf(i) >= p2 then
            median2 = x(i);
            break;
        end
    end
    
    median_x = (median1 + median2) / 2;
    
end

disp("Median = " + string(median_x));


// ======================================
// MODE
// ======================================

mode_x = x(1);
max_f = f(1);

for i = 2:n
    if f(i) > max_f then
        max_f = f(i);
        mode_x = x(i);
    end
end

disp("Mode = " + string(mode_x));


// ======================================
// STANDARD DEVIATION
// ======================================

sd_sum = 0;

for i = 1:n
    d = x(i) - mean_x;
    sd_sum = sd_sum + f(i) * (d^2);
end

sd = sqrt(sd_sum / N);

disp("Standard Deviation = " + string(sd));


// ======================================
// COEFFICIENT OF VARIATION
// ======================================

cv = (sd / mean_x) * 100;

disp("Coefficient of Variation = " + string(cv));


// ======================================
// FREQUENCY DISTRIBUTION CURVE
// ======================================

scf(0);
clf();

plot(x, f, "b-o");

xtitle("Frequency Distribution Curve", "X Values", "Frequency");


// Mark Mean
plot(mean_x, 0, "ro");

// Mark Median
plot(median_x, 0, "go");

// Mark Mode
plot(mode_x, 0, "mo");
