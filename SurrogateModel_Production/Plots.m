%% Plots

%% Plotting Obtained results 
plot_actual_surface(data)
%% Plots of Singular Values
figure
subplot(2,1,1)
plot_singular_values(data,svd_s)
% Computation of E(i)
subplot(2,1,2)
plot_commulative_energy(data,svd_s)

%% Plot approximated surface
figure
for i=1:3
    rank=i;
    subplot(3,1,i)
    plot_rank_approximation(data,rank,snapshot_matrix)
end
%% Plot actual vs real for a trial point
plot_approx_real(data, phi, B,G)

%% Plot of Optimal Control Function
interval= linspace(data.t0, data.Tend, 4);
[t,y]=data.direct();
subplot(2,2,2)
Ut = interp1(interval, data.b(1:4), t);
%b0=data.b0(1,1:2);
%U0= interp1(interval, b0, t);

hold on
%plot(t, U0*0.9,'--')
plot(t,Ut)
%plot(t, U0*1.1,'--')
hold off
grid on
title('Optimal control function')
ylabel('Control Function, u_1')
xlabel('time, t')

subplot(2,2,4)
Ut = interp1(interval, data.b(5:8), t);
%b0=data.b0(1,1:2);
%U0= interp1(interval, b0, t);

hold on
%plot(t, U0*0.9,'--')
plot(t,Ut)
%plot(t, U0*1.1,'--')
hold off
grid on
title('Optimal control function')
ylabel('Control Function, u_2')
xlabel('time, t')

%% Plot error vector
figure
plot(linspace(1,count,count),epsilon_vec, '-*')
%plot(linspace(1,3,3),[e(1),e(3),e(4)], '-*')
title('RMAE for each iteration')
xlabel('iterations')
ylabel('\epsilon')
box on

%% Plot of Optimized surface
[t,y_t]=data.direct();
subplot(2,2,1)
plot(data.tvector,y_t(:,1))
xlabel('t'), ylabel('y_1')
title('Optimized Surface y_1')
subplot(2,2,3)
plot(data.tvector,y_t(:,2), 'LineStyle','--')
xlabel('t'), ylabel('y_2')
title('Optimized Surface y_2')

%% Plot of Optimization criteria comparision
figure
hold on
scatter(linspace(1,count,count), repmat(b_opt_orig(1),1,3))
plot(linspace(1,count,count), [b_opt_surr_vec(1,1), b_opt_surr_vec(2,1), b_opt_surr_vec(3,1)])

scatter(linspace(1,count,count), repmat(b_opt_orig(5),1,3))
plot(linspace(1,count,count), [b_opt_surr_vec(1,5), b_opt_surr_vec(2,5), b_opt_surr_vec(3,5)])

legend({'b*(1)','$$\hat{b}$$*(1)','b*(4)','$$\hat{b}$$*(4)'},'Interpreter','Latex')

%% Plot of shrinking domains
