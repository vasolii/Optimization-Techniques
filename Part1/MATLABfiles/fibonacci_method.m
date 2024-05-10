%Η συνάρτηση fibonacci_method αποτελεί τον αλγόριθμο Fibonacci .
% Πέρα από αυτη την δυνατότητα, αν το επιλέξουμε(n=1), μας
%επιτρέπει να δούμε γραφικά την αλλαγή των a,b κατά την διάρκεια εκτέλεσης
%της μεθόδου, δηλαδή για διάφορα k
function [a_fin,b_fin,num_fin]=fibonacci_method(error,fun,a,b,l,option,fun_name)
    fib=(b(1)-a(1))/l;
    n=find_max_fibonacci_n(fib);
    x1(1)=a(1)+(fibonacci(n-2)/fibonacci(n))*(b(1)-a(1));
    x2(1)=a(1)+(fibonacci(n-1)/fibonacci(n))*(b(1)-a(1));
    k=1;
    while true
    if fun(x1(k))>fun(x2(k))
        a(k+1)=x1(k);
        b(k+1)=b(k);
        x1(k+1)=x2(k);
        x2(k+1)=a(k+1)+(fibonacci(n-k-1)/fibonacci(n-k))*(b(k+1)-a(k+1));
        if k==n-2
            x1(n)=x1(n-1);
            x2(n)=x1(n-1)+error;
            if fun(x1(n))>fun(x2(n))
                a(n)=x1(n);
                b(n)=b(n-1);
                break;
            else
                a(n)=a(n-1);
                b(n)=x2(n);
                break;
            end
        else
            k=k+1;
        end    
    else
         a(k+1)=a(k);
         b(k+1)=x2(k);
         x2(k+1)=x1(k);
         x1(k+1)=a(k+1)+(fibonacci(n-k-2)/fibonacci(n-k))*(b(k+1)-a(k+1));
         if k==n-2
            x1(n)=x1(n-1);
            x2(n)=x1(n-1)+error;
            if fun(x1(n))>fun(x2(n))
                a(n)=x1(n);
                b(n)=b(n-1);
                break;
            else
                a(n)=a(n-1);
                b(n)=x2(n);
                break;
            end            
         else
            k=k+1;
         end  

    end
    end
    a_fin=a(n);
    b_fin=b(n);
    num_fin=n;
    % το παρακάτω plot αναφέρεται στα [a(k),k],[b(k),k]
        if option==1
        k_values=linspace(1,n,n);
        plot(k_values,a,'*-',"LineWidth",2);
        hold on;
        plot(k_values,b,'*-',"LineWidth",2);
        title(sprintf("Fibonacci Method results for %s for error = 0.001",fun_name));
        xlabel("k");
        ylabel("a,b");
        end
end

%Η συνάρτηση αυτή βρίσκει το μέγιστο n της fibonacci(n) ακολουθίας που
%ειναι μικρότερο από ενα συγκεκριμένο limit
function max_n = find_max_fibonacci_n(limit)
    a = 0;
    b = 1;
    n = 0;

    while a < limit
        n = n + 1;
        temp = a;
        a = b;
        b = temp + b;
    end

    max_n = n;
end