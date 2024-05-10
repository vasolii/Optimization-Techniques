clc;
clear;
close all;

%Thema 1

syms x y 
f(x,y) = (x^3)*exp(-x^2-y^4);
figure();
fsurf(f,'ShowContours','on');
title ("3D plot of f(x,y) = x^3e^{-x^2-y^4} and Contour lines");
xlabel("x");
ylabel("y");