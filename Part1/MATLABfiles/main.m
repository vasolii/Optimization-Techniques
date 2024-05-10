clc;
clear;
close all;

%Αντικειμενικές συναρτήσεις
f1=@(x) (x-1)^3+((x-4)^2)*cos(x);
f2=@(x) exp(-2*x)+(x-2)^2;
f3=@(x) (x^2)*log(0.5*x)+(sin((0.2*x)^2));

%Γραφική παράσταση των αντικειμενικών συναρτήσεων
figure();
fplot({f1, f2, f3}, [0,3],"LineWidth",2);
legend("f1(x)","f2(x)","f3(x)");
title("Objective Functions");


%Κάλεσμα συναρτήσεων για τα διάφορα ζητούμενα
for i=1:4
    
if i==1
figure();
subplot(3,1,1);
plot_results_error(f1,"f1(x)");
subplot(3,1,2);
plot_results_error(f2,"f2(x)");
subplot(3,1,3);
plot_results_error(f3,"f3(x)");
end

figure();
subplot(3,1,1);
plot_results_l(f1,"f1(x)",i);
subplot(3,1,2);
plot_results_l(f2,"f2(x)",i);
subplot(3,1,3);
plot_results_l(f3,"f3(x)",i);
hold off;

figure();
subplot(3,1,1);
ab_plot_k(f1,"f1(x)",i);
subplot(3,1,2);
ab_plot_k(f2,"f2(x)",i);
subplot(3,1,3);
ab_plot_k(f3,"f3(x)",i);
hold off;
end

% Κάλεσμα συνάρτησης για την παρουσίαση των τελικών διαστημάτων [a,b]
optimal_intervals(f1,"f1(x)");
optimal_intervals(f2,"f2(x)");
optimal_intervals(f3,"f3(x)");



