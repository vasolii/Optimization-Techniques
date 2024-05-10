clc;
clear;
close all;

syms x1 x2 
f(x1,x2) = (x1^2)/3+3*(x2^2);
figure();
fsurf(f,'ShowContours','on');
title ("3D plot of f(x1,x2) = x1^2/3+3*x2^2 and Contour lines");
xlabel("x1");
ylabel("x2");
v = [x1,x2]; %the vector v is the vector of the first partial derivatives of f with respect to each element of v
f_gr=gradient(f,v);
syms g1 g2
x_k=[x1;x2]-[g1;g2].*f_gr;

fprintf("Για να συγκλίνει η ακολουθία {x_k} στο 0 θα πρέπει:\n");
sygklish=x_k.*[1/x1;1/x2];
sygklish=simplify(sygklish);

eqn1 = sygklish == [-1;-1]; %gia max
eqn2= sygklish ==[1,1]; %gia min


% Λύση των εξισώσεων για τις μεταβλητές g, x1, x2
result1 = solve(eqn1, g1,g2, 'ReturnConditions', true);
result2 = solve(eqn2, g1,g2, 'ReturnConditions', true);

% Εκτύπωση των τιμών των μεταβλητών για κάθε εξίσωση
fprintf("%d < γ < %.2f",max(result2.g1,result2.g2),min(result1.g1,result1.g2))

figure();
steepest_descent_method(2,2,0.1,f);
figure();
steepest_descent_method(2,2,0.3,f);
figure();
steepest_descent_method(2,2,3,f);
figure();
steepest_descent_method(2,2,5,f);
