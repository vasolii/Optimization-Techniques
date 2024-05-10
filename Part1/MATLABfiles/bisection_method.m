%Η συνάρτηση bisection_method αποτελεί τον αλγόριθμο της μεθόδου της
%διχοτόμου. Πέρα από αυτη την δυνατότητα, αν το επιλέξουμε(n=1), μας
%επιτρέπει να δούμε γραφικά την αλλαγή των a,b κατά την διάρκεια εκτέλεσης
%της μεθόδου, δηλαδή για διάφορα k
function [a_fin,b_fin,num_fin]= bisection_method(error,fun,a1,b1,l,n,fun_name)
k=1;
a(1)=a1;
b(1)=b1;
num=0;
    while b(k)-a(k)>l
            x1=((a(k)+b(k))/2)-error;
            x2=((a(k)+b(k))/2)+error;
            funx1=fun(x1);
            funx2=fun(x2);
            num=num+2;
            if funx1<funx2
                a(k+1)=a(k);
                b(k+1)=x2;
            else
                a(k+1)=x1;
                b(k+1)=b(k);
            end
            k=k+1;
    end   
    a_fin=a(length(a));
    b_fin=b(length(b));
    num_fin=num;
    % το παρακάτω plot αναφέρεται στα [a(k),k],[b(k),k]
    if n==1
        k_values=linspace(1,length(a),(length(a)));
        plot(k_values,a,'*-',"LineWidth",2);
        hold on;
        plot(k_values,b,'*-',"LineWidth",2);
        title(sprintf("Bisection Method results for %s for error = 0.001",fun_name));
        xlabel("k");
        ylabel("a,b");
    end
end