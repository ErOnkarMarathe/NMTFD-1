clc;clear

%Step sizes and dimensions of mesh
Re = 10000;
delta=5/sqrt(Re);
uf=1;

dy = 5*10^-3;
dx = 0.0001:0.0001:0.1;


stable = zeros(size(dx,2),1); 
u_mean = zeros(size(dx,2),1);
v_mean = zeros(size(dx,2),1);

for it=1:1:size(dx,2)
    %dx(it) = 0.1/2^it;
    [u_it,v_it] = bl_grid_sensitivity(Re, dx(it),dy, uf);
    %contourf(u_it);
    u_mean(it) = mean(mean(u_it));
    v_mean(it) = mean(mean(v_it));
end


grids = (1./dx+1)';

figure;
sgtitle('Grid independency: Grids vs. average velocity over whole domain.')
semilogx(grids,u_mean,'*'); ylim([0.84,0.90]); yline(u_mean(1)); ylabel('average of u'); legend('average of u.'); 
xlabel('The number of grids.')
grid on; hold on;
yyaxis right;
plot(grids, (dx./(dy*dy)/Re)); ylim([-1,1]); %legend('dx/(Re*dy^2 factor)');
ylabel('dx/(Re*dy^2)');


figure;
sgtitle('Grid independency: Grids vs. average velocity over whole domain.')
semilogx(grids,v_mean,'*'); ylim([0,0.02]); ylabel('average of v'); legend('average of v')
xlabel('The number of grids.')
grid on; hold on;
yyaxis right;
plot(grids, (dx./(dy*dy)/Re)); ylim([-1,1]); %legend('dx/(Re*dy^2 factor)');
ylabel('dx/(Re*dy^2)');