%Η συνάρτηση plot_results_l δείχνει γραφικά την αλλαγή του n για
%διαφορετικές τιμές l
function plot_results_l(fun,fun_name,option)
element=1;
for i=0.01:0.005:0.1
   if option==1  % ανάλογα το option που μπαίνει ως είσοδο, εκτελείται για την ανάλογη μέθοδο
        [~,~,k(element)]=bisection_method(0.001,fun,0,3,i,0);
   elseif option==2
        [~,~,k(element)]=golden_sm(i,0,3,fun,0);
   elseif option==3
        [~,~,k(element)]=fibonacci_method(0.001,fun,0,3,i,0);
   elseif option==4
        [~,~,k(element)]=bisection_derivative(i,0,3,fun,0);
   end
   l(element)=i;
   element=element+1;
end
name_method={"Bisection Method","Golden Section Method","Fibonacci Method","Bisection Method with Derivatives"};
plot(l,k,'*-',"LineWidth",2);
title(sprintf("%s results for %s with error = 0.001 and l(n)",name_method{option},fun_name));
xlabel("l");
ylabel("Number of iterations");
end