%Η συνάρτηση αυτή έχει ως στόχο το πλοτάρισμα των a,b συναρτήσει του k
%καθόλη την διάρκεια της μεθόδου για διαφορετικά l
function ab_plot_k (fun,fun_name,option)
legend_labels = [];
for i=0.01:0.03:0.1
    if option==1 % ανάλογα το option που μπαίνει ως είσοδο, εκτελείται για την ανάλογη μέθοδο
            bisection_method(0.001,fun,0,3,i,1,fun_name);
    elseif option==2
            golden_sm(i,0,3,fun,1,fun_name);
    elseif option==3
            fibonacci_method(0.001,fun,0,3,i,1,fun_name);
    elseif option==4
            bisection_derivative(i,0,3,fun,1,fun_name);
    end
hold on;
legend_labels{end+1}=(sprintf("a for l = %.2f",i));
legend_labels{end+1}=(sprintf("b for l = %.2f",i));
end
legend(legend_labels,'Location','bestoutside');
end