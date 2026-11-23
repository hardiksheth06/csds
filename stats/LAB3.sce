clc;
clear;

// INPUT

n = input("Enter number of values: ");

x = input("Enter values of x: ");

f = input("Enter corresponding frequencies: ");


// TOTAL FREQUENCY

N = 0;

for i = 1:n
    N = N + f(i);
end


// MEAN

sum_fx = 0;

for i = 1:n
    sum_fx = sum_fx + f(i) * x(i);
end

mean_x = sum_fx / N;

disp("Mean = " + string(mean_x));


// CUMULATIVE FREQUENCY

cf = zeros(1,n);

cf(1) = f(1);

for i = 2:n
    cf(i) = cf(i-1) + f(i);
end

disp("Cumulative Frequency = ");
disp(cf);


// MEDIAN

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


// MODE

mode_x = x(1);
max_f = f(1);

for i = 2:n
    if f(i) > max_f then
        max_f = f(i);
        mode_x = x(i);
    end
end

disp("Mode = " + string(mode_x));


// FIRST CENTRAL MOMENT

m1 = 0;

for i = 1:n
    
    d = x(i) - mean_x;
    
    m1 = m1 + f(i) * d;
    
end

m1 = m1 / N;

disp("First Central Moment = " + string(m1));


// SECOND CENTRAL MOMENT

m2 = 0;

for i = 1:n
    
    d = x(i) - mean_x;
    
    m2 = m2 + f(i) * (d^2);
    
end

m2 = m2 / N;

disp("Second Central Moment = " + string(m2));


// THIRD CENTRAL MOMENT

m3 = 0;

for i = 1:n
    
    d = x(i) - mean_x;
    
    m3 = m3 + f(i) * (d^3);
    
end

m3 = m3 / N;

disp("Third Central Moment = " + string(m3));


// FOURTH CENTRAL MOMENT

m4 = 0;

for i = 1:n
    
    d = x(i) - mean_x;
    
    m4 = m4 + f(i) * (d^4);
    
end

m4 = m4 / N;

disp("Fourth Central Moment = " + string(m4));


// SKEWNESS

skewness = m3 / (m2^(3/2));

disp("Skewness = " + string(skewness));


// KURTOSIS

kurtosis = m4 / (m2^2);

disp("Kurtosis = " + string(kurtosis));


// NATURE OF CURVE - SKEWNESS

if m3 > 0 then
    
    disp("Curve is Positively Skewed");
    
elseif m3 < 0 then
    
    disp("Curve is Negatively Skewed");
    
else
    
    disp("Curve is Symmetric");
    
end

// NATURE OF CURVE - KURTOSIS

if kurtosis > 3 then
    
    disp("Curve is Leptokurtic");
    
elseif kurtosis < 3 then
    
    disp("Curve is Platykurtic");
    
else
    
    disp("Curve is Mesokurtic");
    
end

// FREQUENCY DISTRIBUTION CURVE

scf(0);
clf();

plot(x, f, "b-o");

xtitle("Frequency Distribution Curve", ...
       "X Values", "Frequency");


// MARK MEAN

plot(mean_x, 1, "ro");


// MARK MEDIAN

plot(median_x, 1, "go");

// MARK MODE

plot(mode_x, 1, "mo");


// DISPLAY LABELS

xstring(mean_x - 0.25, 0.4, "Mean");

xstring(median_x - 0.2, 0.8, "Median");

xstring(mode_x - 0.4, 1.4, "Mode");


// DISPLAY SKEWNESS NATURE

if m3 > 0 then
    
    xstring(3.2, 10.5, "Positively Skewed");
    
elseif m3 < 0 then
    
    xstring(3.2, 10.5, "Negatively Skewed");
    
else
    
    xstring(3.2, 10.5, "Symmetric");
    
end

// DISPLAY KURTOSIS NATURE

if kurtosis > 3 then
    
    xstring(3.2, 9.5, "Leptokurtic");
    
elseif kurtosis < 3 then
    
    xstring(3.2, 9.5, "Platykurtic");
    
else
    
    xstring(3.2, 9.5, "Mesokurtic");
    
end
