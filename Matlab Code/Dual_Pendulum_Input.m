T = 5;
u_k = zeros(T/0.01+1,1);
[u_k x_k] = NR_Dual_Pendulum(T, u_k);

t = 0:0.01:T;

% for i = 1:3
%     [u_k x_k] = NR_Dual_Pendulum(T, u_k);
% end
close all
hold on
plot(t, x_k(1,:))
plot(t, x_k(2,:))
plot(t, x_k(3,:))
hold off

title("Plot of Positional States with Optimal Initial Input")
lgd = legend({'$x(t)$', '$\theta_1(t)$', '$\theta_2(t)$'}, 'Interpreter','latex')
lgd.Location = 'northwest';

save initialInput.mat u_k x_k;
saveas(gcf, "Step1_final_plot.png");