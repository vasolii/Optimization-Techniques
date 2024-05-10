%Η συνάρτηση αυτή παρουσιάζει γραφικά τα τελικά διαστήματα [a,b] για όλες
%τις μεθόδους όπου μελετήθηκαν
function optimal_intervals(fun,fun_name)
% κάλεσμα και των 4 συναρτήσεων για ίδιες παραμέτρους
name_method={"Bisection Method","Golden Section Method","Fibonacci Method","Bisection Method with Derivatives"};
[a(1),b(1)]=bisection_method(0.001,fun,0,3,0.01,0);
[a(2),b(2)]=golden_sm(0.01,0,3,fun,0);
[a(3),b(3)]=fibonacci_method(0.001,fun,0,3,0.01,0);
[a(4),b(4)]=bisection_derivative(0.01,0,3,fun,0);
length=zeros(1,4);
figure();
for i=1:4
     plot([a(i), b(i)], [i,i],"*-","LineWidth",2);
     texta=sprintf("a = %.3f",a(i));
     textb=sprintf("b = %.3f",b(i));
     text(a(i)-0.001,i+0.2,texta,"FontWeight","bold");
     text(b(i)-0.0025,i+0.2,textb,"FontWeight","bold");
     length(i)=b(i)-a(i);
     legend_labels{i} = sprintf('%s Length: %.3f', name_method{i}, length(i));
     hold on;
end

legend(legend_labels,"Location",'southoutside');
ylim([0, 5]);
title(sprintf("Optimal intervals for %s",fun_name));
end