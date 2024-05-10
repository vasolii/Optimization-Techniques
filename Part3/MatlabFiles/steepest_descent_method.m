function k_final=steepest_descent_method(x1_start,x2_start,gamma,f)
const_fin=0.001;

syms x1 x2 
v = [x1,x2]; %the vector v is the vector of the first partial derivatives of f with respect to each element of v
f_gr=gradient(f,v);

x1_x2_val(:,1)=[x1_start;x2_start];% Τοποθέτηση x,y σε έναν ενιαίο πίνακα για να μπορούν να χρησιμοποιηθούν στην gradient

k=1;
while norm(f_gr(x1_x2_val(1,k),x1_x2_val(2,k)))>=const_fin
    d(:,k)=-f_gr(x1_x2_val(1,k),x1_x2_val(2,k));

   x1_x2_val(:,k+1)=x1_x2_val(:,k)+gamma*d(:,k);
    k=k+1;

    if k>100
        break;
    end 
    
end 

set(gcf, 'Position', get(0, 'Screensize'));

%Plot f(k),k and fmin
subplot(1,2,1);
y_value=linspace(1,k,k);
plot(y_value,f(x1_x2_val(1,:),x1_x2_val(2,:)),'*-',"LineWidth",0.5);
[x1_x2_min,min]=fminsearch(@(z)f(z(1),z(2)),[x1_start,x2_start]); 
hold on;
yline(min(1),"--","Color","#D95319","LineWidth",1.5);
legend("f(k)","fmin",'FontSize', 13);
xlabel("Number of iretations k");
ylabel("Value of f_{k}");
title(sprintf("(f_{k}, k) with starting point x_{0},y_{0} = %d,%d and γ = %.1f",x1_start,x2_start,gamma),'FontAngle', 'italic');

%plot of Convergence of (x,y)
subplot(1,2,2);
fcontour(f);
hold on;
plot(x1_x2_val(1,:), x1_x2_val(2,:),'-o','Color',"#EDB120","LineWidth",1.5);
plot(x1_x2_val(1,end),x1_x2_val(2,end),"*",'Color',"#A2142F","LineWidth",2);
plot(x1_x2_min(1),x1_x2_min(2),"*","Color","g");
legend("f(x,y)","(x(k),y(k))","(x final,y final)","(x real min, y real min)",'FontSize', 13);
xlabel("x");
ylabel("y");
title("Convergence of (x,y)",'FontAngle', 'italic','FontSize', 12);
sgtitle("\bf Steepest Descent Method");


k_final=k-1;

end




        