function k_final=levenberg_marquardt_method(x_start,y_start,option_gamma)

const_fin=10^(-4);

syms x y 
f(x,y) = (x^3)*exp(-x^2-y^4);
v = [x,y]; %the vector v is the vector of the first partial derivatives of f with respect to each element of v
f_gr=gradient(f,v);
f_gr_2=hessian(f,v);
x_y_val(:,1)=[x_start;y_start];% Τοποθέτηση x,y σε έναν ενιαίο πίνακα για να μπορούν να χρησιμοποιηθούν στην gradient
k=1;

while norm(f_gr(x_y_val(1,k),x_y_val(2,k)))>=const_fin
    mi(k)=0;
    while true
        array_check=f_gr_2(x_y_val(1,k),x_y_val(2,k))+mi(k)*eye(2);
        idiotimes=vpa(eig(array_check));

            if idiotimes(1)> 0 && idiotimes(2)>0
                break;
            else
                mi(k)=mi(k)+1;
            end 
    end

    %Υπολογισμο d
    A=array_check;
    B=-f_gr(x_y_val(1,k),x_y_val(2,k));
    d(:,k)= linsolve(A,B);

    if option_gamma==1
        gamma(k)=0.5;

    elseif option_gamma==2

        syms g
        fun_min(g)=f((x_y_val(1,k)+g*d(1,k)),(x_y_val(2,k)+g*d(2,k))); % συνάρτηση για ελαχιστοποίηση
        [a(k),b(k)]=golden_sm(0.01,0,10,fun_min); % χρήση της golden section για την ελαχιστοποιηση της παραπάνω συνάρτησης
        gamma(k)=(a(k)+b(k))/2;

    elseif option_gamma==3
        a=10^(-3); %Προεπιλεγμένες αρχικές συνθήκες
        b=1/5;
        m(k)=0;
        s=0.5;

        val(:,k)=x_y_val(:,k)-s*f_gr(x_y_val(1,k),x_y_val(2,k));

        while f(x_y_val(1,k),x_y_val(2,k))-f(val(1,k),val(2,k))<a*(b^m(k))*s*d(:,k)'*f_gr(x_y_val(1,k),x_y_val(2,k))
             m(k)=m(k)+1;
        end 
        gamma(k)=s*b^(m(k));
    end 
    x_y_val(:,k+1)=x_y_val(:,k)+gamma(k)*d(:,k);
    k=k+1;
    if k>500
        break;
    end 
   
end

gamma_option={"γ = const = 0.5","γ such that it minimizes f (x_{k}+γ_{k}d_{k})","γ based on the Armijo rule"};

set(gcf, 'Position', get(0, 'Screensize'));

%Plot f(k),k and fmin
subplot(1,2,1);
y_value=linspace(1,k,k);
plot(y_value,f(x_y_val(1,:),x_y_val(2,:)),'*-',"LineWidth",1.5);
[x_y_min,min]=fminsearch(@(z)f(z(1),z(2)),[x_start,y_start]); 
hold on;
yline(min(1),"--","Color","#D95319","LineWidth",1.5);
legend("f(k)","fmin",'FontSize', 13);
xlabel("Number of iretations k");
ylabel("Value of f_{k}");
title(sprintf("(f_{k}, k) with starting point x_{0},y_{0} = %d,%d with %s",x_start,y_start,gamma_option{option_gamma}),'FontAngle', 'italic');

%plot of Convergence of (x,y)
subplot(1,2,2);
fcontour(f);
hold on;
plot(x_y_val(1,:), x_y_val(2,:),'-','Color',"#EDB120","LineWidth",0.5);
plot(x_y_val(1,end),x_y_val(2,end),"*",'Color',"#A2142F","LineWidth",2);
plot(x_y_min(1),x_y_min(2),"*","Color","g");
legend("f(x,y)","(x(k),y(k))","(x final,y final)","(x real min, y real min)",'FontSize', 13);
xlabel("x");
ylabel("y");
title("Convergence of (x,y)",'FontAngle', 'italic','FontSize', 12);
sgtitle("\bf Levenberg Marquardt Method");

filename = sprintf('leven_%d_%d.jpg', x_start, option_gamma);
saveas(gcf,filename);

k_final=k-1;
end