clc;
clear;
close all;

delta_t = 0.001;
delta_x = 0.01;
gama = delta_t/(delta_x*2);
x = 1;
partitions = (x/delta_x) + 1;
U = zeros(partitions,1);
for i = 1:partitions
    if (((i - 1)*delta_x) < 0.5)
        U(i,1) = 1;
    else
        U(i,1) = 0;
    end
end
Uinitial = U;
dx = 0:delta_x:1;
for time = 0:delta_t:1
    U_prime = U;
    U(1,1) = U_prime(1,1) - gama*(U_prime(2,1) - 1);
    
    for i = 2: partitions - 1
        U(i,1) = U_prime(i,1) - gama*(U_prime(i+1) - U_prime(i - 1));
    end
    U(partitions,1) = U_prime(partitions,1) - gama*(0 - U_prime(partitions - 1,1));
    plot(dx,Uinitial,'r',dx,U,'b');
    axis ([0 1 0 2]);
    suptitle(['time = ', num2str(time)]);
    pause(0.02);
    
end
    