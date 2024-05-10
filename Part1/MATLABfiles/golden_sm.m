%Η συνάρτηση golden_sm αποτελεί τον αλγόριθμο της μεθόδου του χρυσού τομέα.
% Πέρα από αυτη την δυνατότητα, αν το επιλέξουμε(n=1), μας
%επιτρέπει να δούμε γραφικά την αλλαγή των a,b κατά την διάρκεια εκτέλεσης
%της μεθόδου, δηλαδή για διάφορα k
function [a_fin,b_fin,num_fin]=golden_sm(l,a,b,fun,n,fun_name)
    k=1;
    gamma=0.618;
    x1(k)=a(k)+(1-gamma)*(b(k)-a(k));
    x2(k)=a(k)+gamma*(b(k)-a(k));
    num=1;
    while b(k)-a(k)>l
        num=num+1;
        if fun(x1(k))>fun(x2(k))
            a(k+1)=x1(k);
            b(k+1)=b(k);
            x2(k+1)=a(k+1)+gamma*(b(k+1)-a(k+1));
            x1(k+1)=x2(k);
            k=k+1;
        else
            a(k+1)=a(k);
            b(k+1)=x2(k);
            x2(k+1)=x1(k);
            x1(k+1)=a(k+1)+(1-gamma)*(b(k+1)-a(k+1));
            k=k+1;
        end
    end
    a_fin=a(length(a));
    b_fin=b(length(b));
    num_fin=num;
    % το παρακάτω plot αναφέρεται στα [a(k),k],[b(k),k]
    if n==1
        k_values=linspace(1,length(a),length(a));
        plot(k_values,a,'*-',"LineWidth",2);
        hold on;
        plot(k_values,b,'*-',"LineWidth",2);
        title(sprintf("Golden Section Method results for %s",fun_name));
        xlabel("k");
        ylabel("a,b");
    end
end
