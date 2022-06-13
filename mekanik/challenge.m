clear all
hold off
%% ------------Challenge------------ %%

%set initial conditions
G=6.67408*10^-11;
m=[1.989*10^30,1.989*10^30,3.301*10^24,4.867*10^24,5.972*10^24,6.417*10^24];

x0=[-10^12,10^12,10^12,10^12,10^12,10^12];
y0=[0,0,-57910000000,-108200000000,-149600000000,-227900000000];

vx0=[0,0,47362,35020,29780,24007];
vy0=[2000,-2000,-2000,-2000,-2000,-2000];
tmax=500000000;
dt=1000;

%simulate orbit
[x,y,vx,vy,ax,ay,t]=orbit_Nbody(G,m,x0,y0,vx0,vy0,dt,tmax);

%plots figure of movement
figure(1)
plot(x(:,1),y(:,1),x(:,2),y(:,2),x(:,3),y(:,3),x(:,4),y(:,4),x(:,5),y(:,5),x(:,6),y(:,6))
axis([-1.5*10^12 1.5*10^12 -1.5*10^12 1.5*10^12])
title('Orbit')
xlabel('x')
ylabel('y')
legend('Sun 1','Sun 2','Mercury','Venus','Earth','Mars','Location','best')

%plots moving representation of planets
figure(2)
axis([-1.5*10^12 1.5*10^12 -1.5*10^12 1.5*10^12])
multicomet(x(1:200:end,:),y(1:200:end,:));
axis([-1.5*10^12 1.5*10^12 -1.5*10^12 1.5*10^12])