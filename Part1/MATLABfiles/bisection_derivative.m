%Η συνάρτηση bisection_derivative αποτελεί τον αλγόριθμο της μεθόδου διχοτόμου 
% με χρήση παραγώγων. Πέρα από αυτη την δυνατότητα, αν το επιλέξουμε(n=1), μας
%επιτρέπει να δούμε γραφικά την αλλαγή των a,b κατά την διάρκεια εκτέλεσης
%της μεθόδου, δηλαδή για διάφορα k
function [a_fin,b_fin,num_fin]=bisection_derivative(l,a,b,fun,option,fun_name)
    n_min = find_min_n(l,a,b);
    k=1;
    a(k)=a;
    b(k)=b;
    x_val=zeros(n_min);
    syms x;
    f(x)=fun(x);
    df=diff(f);
    while true
        x_val(k)=(a(k)+b(k))/2;
        if vpa(subs(df,x,x_val(k)))>0
            a(k+1)=a(k);
            b(k+1)=x_val(k);
        else
            a(k+1)=x_val(k);
            b(k+1)=b(k);
        end   
        if k~=n_min
            k=k+1;
        else 
            break;
        end
    end
    a_fin=a(length(a));
    b_fin=b(length(b));
    num_fin=n_min;
    % το παρακάτω plot αναφέρεται στα [a(k),k],[b(k),k]
    if option==1
    k_values=linspace(1,length(a),length(a));
    plot(k_values,a,'*-',"LineWidth",2);
    hold on;
    plot(k_values,b,'*-',"LineWidth",2);
    title(sprintf("Bisection Method with Derivatives using the derivative for %s",fun_name));
    xlabel("k");
    ylabel("a,b");
    end
end

%Η συνάρτηση αυτή βρίσκει το ελάχιστο n βημάτων έτσι ώστε να ισχύει η
%προυπόθεση για την εκτέλεση της μεθόδου διχοτόμου με χρήση παραγώγων
function min_n = find_min_n(l, a, b)
    n=1;
    while (1/2)^n>l/(b-a)
        n=n+1;
    end
    min_n=n;
end