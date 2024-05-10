function projected_steepest_descent_method(x1_start,x2_start,s,gamma)
const_fin=0.01;

syms x1 x2
f(x1,x2) = (x1^2)/3+3*(x2^2);
v = [x1,x2]; %the vector v is the vector of the first partial derivatives of f with respect to each element of v
f_gr=gradient(f,v);
x1_x2_val(:,1)=projection([x1_start,x2_start]);% Τοποθέτηση x,y σε έναν ενιαίο πίνακα για να μπορούν να χρησιμοποιηθούν στην gradient

k=1; 
while norm(f_gr(x1_x2_val(1,k),x1_x2_val(2,k)))>=const_fin

   pr=projection(x1_x2_val(:,k)-s*f_gr(x1_x2_val(1,k),x1_x2_val(2,k)))';

   x1_x2_val(:,k+1)=x1_x2_val(:,k)+gamma*(pr-x1_x2_val(:,k));

    k=k+1; 

    if k>400 
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
title(sprintf("(f_{k}, k) with starting point x_{0},y_{0} = %d,%d γ = %.1f and s=%.1f",x1_start,x2_start,gamma,s),'FontAngle', 'italic');

%plot of Convergence of (x,y)
subplot(1,2,2);
fcontour(f);
xlim([-15 15]);
ylim([-10 15]);
hold on;
plot(x1_x2_val(1,:), x1_x2_val(2,:),'-o','Color',"#EDB120","LineWidth",1.5);
plot(x1_x2_val(1,end),x1_x2_val(2,end),"*",'Color',"#A2142F","LineWidth",2);
plot(x1_x2_min(1),x1_x2_min(2),"*","Color","g");
legend("f(x,y)","(x(k),y(k))","(x final,y final)","(x real min, y real min)",'FontSize', 13);
rectangle('Position', [-10, -8, 15, 20], 'EdgeColor', 'r',"LineWidth",2,"LineStyle","--");
xlabel("x");
ylabel("y");
title("Convergence of (x,y)",'FontAngle', 'italic','FontSize', 12);
sgtitle("\bf Projected Steepest Descent Method");


end

function pr=projection(X)
a=[-10,-8]; %katw oria
b=[5,12]; %panw oria

if X(1)<=a(1)
    pr(1)=a(1);
elseif X(1)>=b(1)
    pr(1)=b(1);
else
    pr(1)=X(1);
end    

if X(2)<=a(2)
    pr(2)=a(2);
elseif X(2)>=b(2)
    pr(2)=b(2);
else
    pr(2)=X(2);
end    

end
