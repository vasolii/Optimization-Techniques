%Η συνάρτηση plot_results_error δείχνει γραφικά την αλλαγή των a,b για
%διαφορετικές τιμές error
function plot_results_error(fun,fun_name)
element=1;
for i=0.00001:0.0005:0.004995
   [~,~,num(element)]=bisection_method(i,fun,0,3,0.01,0);
   errors(element)=i;
   element=element+1;
end
plot(errors,num,'*-',"LineWidth",2);
title(sprintf("Bisection Method results for %s with error(n) and l = 0.01",fun_name));
xlabel("ε");
ylabel("Number of iterations");
end