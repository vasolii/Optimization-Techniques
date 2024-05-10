%Η συνάρτηση golden_sm αποτελεί τον αλγόριθμο της μεθόδου του χρυσού τομέα.

function [a_fin,b_fin]=golden_sm(l,a,b,fun)
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

end
