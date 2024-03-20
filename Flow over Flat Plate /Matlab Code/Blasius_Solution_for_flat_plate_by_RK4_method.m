% ODE => { f '= g ; g' = h ; h'=-0.5*f*h }  , here η is independent variable
% initial condition f(0) = 0 , g(0) = 0 , h(0) = ? such that g(∞) = 1 ; 
% we find h(0) by obtaining improved values of h(0) that minimises the
% error g(∞)-1 to 0 
% η (similarity variable) is of the order y/δ(x) so η_max = ∞ (10)
%% solve ODE-IVP using RK-4 Method 
tic;
% range of independent variable η


dy = 0.000005; x = 0.0005;
%dy = 0.0005; x = 0.5;
%Re = 10000;
delta=5/sqrt(Re);

%x = 0.5;
y = 0:dy:2*delta;
%here======================
eta_0 = 0;
%eta_max = 10;
eta_max = max(y)*sqrt(Re/x);
% Initial conditions
f0 = 0;
g0 = 0;
h0 = [0.1 0.3];
% Step value Δη
%d_eta = 0.001;
d_eta=dy*sqrt(Re/x);
N = (eta_max - eta_0)/ d_eta;
err= 1;
%% Initializing solution
eta = eta_0 : d_eta : eta_max; % X coordinate for plot function 
while err >10^-15 
for j = 1:2
F = zeros(N+1,3);                  % f = F(N+1,1) ; g = F(N+1,2) ; h = F(N+1,3) ; j lets us choose 2 arbitrary initial conditions for h0
F(1,:) = [f0 g0 h0(j)];

%% Trail using RK-4 Method 
for i = 1:N
    k1(i,:) = d_eta*  [F(i,2)                   F(i,3)                   -(F(i,1)*F(i,3))/2 ];
    k2(i,:) = d_eta*  [F(i,2)+k1(i,2)/2    F(i,3)+k1(i,3)/2    -(  (F(i,1)+k1(i,1)/2)  *  (F(i,3)+k1(i,3)/2)  )/2 ];
    k3(i,:) = d_eta*  [F(i,2)+k2(i,2)/2    F(i,3)+k2(i,3)/2    -(  (F(i,1)+k2(i,1)/2)  *  (F(i,3)+k2(i,3)/2)  )/2 ];
    k4(i,:) = d_eta*  [F(i,2)+k3(i,2)       F(i,3)+k3(i,3)       -(  (F(i,1)+k3(i,1))     *  (F(i,3)+k3(i,3))     )/2 ];
    F(i+1,:)=F(i,:)+(1/6)*(k1(i,:)+2*k2(i,:)+2*k3(i,:)+k4(i,:));
end
g_inf(j) = F(end,2);
end
[err,index]= max(abs(1-g_inf));
P = diff(g_inf);
if P~0;
h0_new= h0(1)+(diff(h0)/diff(g_inf))*(1-g_inf(1)); %interpolated value of h0
h0(index)= h0_new; 
end
end



%% plotting
f = F(1:end,1);
g = F(1:end,2);
h = F(1:end,3);

plot(y,g);

