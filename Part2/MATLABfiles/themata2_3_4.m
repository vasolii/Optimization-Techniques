clc;
clear;
close all;

%Thema 2,3,4

option=2; % ανάλογα με ποιό θέμα θέλουμε να μελετήσουμε

x_start=[1,-1,0];
y_start=[1,-1,0];

for j=1:3
    for i=1:3
        figure()
        if option==2
            k_2(j,i)=steepest_descent_method(x_start(j),y_start(j),i);
        elseif option==3
            k_3(j,i)=newton_method(x_start(j),y_start(j),i);
        elseif option==4
            k_4(j,i)=levenberg_marquardt_method(x_start(j),y_start(j),i);
        end
    end
end