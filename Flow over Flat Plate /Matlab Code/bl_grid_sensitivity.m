function [ru,rv] = bl_grid_sensitivity(Re, dx,dy, uf)  
    %Step sizes and dimensions of mesh
    delta=5/sqrt(Re);
    x = 0:dx:1;
    y = 0:dy:2*delta;
    
    m = size(y,2);
    n = size(x,2);
    
    %Boundary conditions
    u = zeros(m,n);
    v = zeros(m,n);
    %u(1:end,1:end) = NaN;
    %v(1:end,1:end) = NaN;
     
    
    u(end,1:end) = uf; %top j=end, i=1:end
    u(1,1:end) = 0; % base i=1:end, j=1
    u(1:end, 1) = uf;  %left i=1, j=1:end
    u(1,1) = 0;
    
    v(1,1:end) = 0; % base
    v(1:end, 1) = 0;  %left
    
    
    for j=1:1:n-1
        for i=2:1:m-1
           
            u(i,j+1) = u(i,j)+(1/Re)*(u(i+1,j)-2*u(i,j)+u(i-1,j))/u(i,j)*dx/(dy^2)-v(i,j)*(u(i+1,j)-u(i-1,j))/(2*u(i,j))*dx/dy;
            v(i,j+1) = v(i-1,j+1)-0.5*dy/dx*(u(i,j+1)-u(i,j)+u(i-1,j+1)-u(i-1,j));
            
        end
        i=m;
        v(i,j+1) = v(i-1,j+1)-0.5*dy/dx*(u(i,j+1)-u(i,j)+u(i-1,j+1)-u(i-1,j));
        
    end

    ru = u;
    rv = v;

end