T = 5;
u_k = zeros(T/0.01+1,1);
[u_k x_k] = NR_Dual_Pendulum(T, u_k);

t = 0:0.01:T;

for i = 1:3
    [u_k x_k] = NR_Dual_Pendulum(T, u_k);
end
close all
hold on
plot(t, x_k(1,:))
plot(t, x_k(2,:))
plot(t, x_k(3,:))
hold off