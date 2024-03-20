clear;
clc;

%initialization
n_points = 40;
dom_length = 1;
h = dom_length/n_points;
x = 0:h:dom_length;
y = 0:h:dom_length;
dt = 0.00015625;%%dt < 0.00015625$$
t_dom = 0.1;
t = 0:dt:t_dom;
Re = 1;
delta = 50; %%%% randomly selected value%%%%%

u_final(n_points,n_points) = 0;
v_final(n_points,n_points) = 0;
p_final(n_points,n_points) = 1;
u_final(1,:) = 1;

u(n_points+1,n_points) = 0;
v(n_points,n_points+1) = 0;
p(n_points+1,n_points+1) = 1;
u(1,:) = 2;

u_new(n_points+1,n_points) = 0;
v_new(n_points,n_points+1) = 0;
p_new(n_points+1,n_points+1) = 1;
u_new(1,:) = 2;

error = 1;
iteration = 0;
error_re = 0.1;
x_dom = ((1:n_points)-1).*h;
y_dom = 1-((1:n_points)-1).*h;
[X,Y] = meshgrid(x_dom,y_dom);


while error > error_re
for i = 2:n_points
    for j = 2:n_points-1
        
        pressure = -(p(i,j+1)-p(i,j))/h;
        diffusion = (1/Re)*(((u(i+1,j) - 2*u(i,j) + u(i-1,j))/(h*h)) +((u(i,j+1) - 2*u(i,j) + u(i,j-1))/(h*h)));
        advection_x = ((0.5*(u(i,j)+u(i,j+1)))^2 + (0.5*(u(i,j)+u(i,j-1)))^2)/h;
        advection_y = ((0.25*(u(i,j)+u(i-1,j))*(v(i-1,j)+v(i-1,j+1)))-(0.25*(u(i,j)+u(i+1,j))*(v(i,j)+v(i,j+1))))/h;
        u_new(i,j) = u(i,j) + dt*(diffusion -advection_x-advection_y+pressure);
        
    end
end

u_new(1,:) = 2 - u_new(2,:);
u_new(n_points +1, :) = -u_new(n_points,:);
u_new(2:n_points,1)=0;
u_new(2:n_points,n_points)=0;

for i = 2:n_points-1
    for j = 2:n_points
        
        pressure = -(p(i,j)-p(i+1,j))/h;
        diffusion = (1/Re)*(((v(i+1,j) - 2*v(i,j) + v(i-1,j))/(h*h)) +((v(i,j+1) - 2*v(i,j) + v(i,j-1))/(h*h)));
        advection_x = ((0.25*(u(i,j)+u(i+1,j))*(v(i,j)+v(i,j+1)))-(0.25*(u(i,j-1)+u(i+1,j-1))*(v(i,j)+v(i,j-1))))/h;
        advection_y = ((0.5*(v(i,j)+v(i+1,j)))^2 + (0.5*(v(i,j)+v(i-1,j)))^2)/h;
        v_new(i,j) = v(i,j) + dt*(diffusion -advection_x- advection_y +pressure);
        
    end
end

v_new(:,1) = -v_new(:,2);
v_new(:,n_points +1) = -v_new(:,n_points);
v_new(1,2:n_points)=0;
v_new(n_points,2:n_points)=0;


for i = 2:n_points
    for j = 2:n_points
        
        p_new(i,j) = p(i,j) - delta*dt*(u(i,j) - u(i,j-1) + v(i-1,j) - v(i,j))/h;
        
    end
end

p_new(1,:) = p_new (2,:);
p_new(n_points + 1,:) = p_new(n_points,:);
p_new(:,1) = p_new(:,2);
p_new(:,n_points + 1) = p_new(:,n_points);

error = 0;
for i = 2:n_points -1
    for j = 2:n_points -1
        
        error = error +abs((u_new(i,j) - u_new(i,j-1) + v_new(i-1,j) - v_new(i,j))/h); 
        
    end
end

u = u_new;
v = v_new;
p = p_new;
iteration = iteration +1;

end

for j = 1:n_points
        for i = 1:n_points 
        u_final(i,j) = 0.5*(u(i,j) +u(i+1,j));
        v_final(i,j) = 0.5*(v(i,j)+v(i,j+1));
        p_final(i,j) = 0.25*(p(i,j)+p(i+1,j)+p(i,j+1)+p(i+1,j+1));
        end
        figure(1);
        title('Re = 1')
        if j ==8
        subplot(3,3,1)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,p_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.02')
        end
        if  j ==8
        subplot(3,3,2)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,u_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.02')
        end
        if j ==8
        subplot(3,3,3)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,v_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.02')
        end
        if j ==16 
        subplot(3,3,4)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,p_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.04')
        end
        if  j ==16 
        subplot(3,3,5)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,u_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.04')
        end
        if j ==16 
        subplot(3,3,6)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,v_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.04')
        end
        if j ==24
        subplot(3,3,7)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,p_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.06')
        end
        if j ==24
        subplot(3,3,8)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,u_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.06')
        end
        if j ==24
        subplot(3,3,9)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,v_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.06')
        end
        figure(2);
        title('Re = 1')
        if j ==32
        subplot(3,3,1)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,p_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.08')
        end
        if j ==32
        subplot(3,3,2)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,u_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.08')
        end
        if j ==32
        subplot(3,3,3)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,v_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.08')
        end
        if j ==n_points 
        subplot(3,3,4)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,p_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.1')
        end
        if j ==n_points 
        subplot(3,3,5)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,u_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.1')
        end
        if j ==n_points 
        subplot(3,3,6)
        x1 = meshgrid(x_dom);
        y1 = meshgrid(y_dom);
        plot(x1,y1)
        contourf(X,Y,v_final,10,'LineStyle','none')
        colorbar
        colormap('jet')
        xlabel('x')
        ylabel('y')
        title(' at t = 0.1')
        end
end
figure(3);
for j = 1:n_points
        for i = 20
        contourf(X,Y,u_final,10,'LineStyle','none')
        colorbar
        colormap('jet')    
        end
end

             