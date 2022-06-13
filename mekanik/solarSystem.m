clear all
hold off
%% ------------Satellite in orbit------------ %%

%Real values
% ---------- Mass [kg]---Speed [m/s]---Distance from sun [km]
% Solen          1.989*10^30       0                    0 
% Merkurius   3.301*10^24      47.362            57 910 000 
% Venus          4.867*10^24      35.02              108 200 000
% Jorden        5.972*10^24      29.78              149 600 000
% Mars            6.417*10^24      24.007            227 900 000

%Gravitational constant
G=6.67408*10^-11;

%Mass planets
m=[1.989*10^30,3.301*10^24,4.867*10^24,5.972*10^24,6.417*10^24];

%Distance to center of solar system
x0=[0,57910000000,108200000000,149600000000,227939100000];
y0=[0,0,0,0,0];

%Average velocity
vx0=[0,0,0,0,0];
vy0=[-0.33116308748115,47362,35020,29780,24130.8];
tmax=80000000;
dt=1000;

%simulate orbit
[x,y,vx,vy,ax,ay,t]=orbit_Nbody(G,m,x0,y0,vx0,vy0,dt,tmax);

%plots figure of movement
close all
figure(1)
axis image
plot(x(:,1),y(:,1),x(:,2),y(:,2),x(:,3),y(:,3),x(:,4),y(:,4),x(:,5),y(:,5))
hold on
[rcmx,rcmy]=centerOfMass(m,x,y);
plot(rcmx,rcmy)
title('Orbit')
xlabel('x[m]')
ylabel('y[m]')
legend('Solen','Merkurius','Venus','Jorden',' Mars','Location','best')

% Calculation of energy values
[Ek,Ep,Etot]=energy(G,m,x,y,vx,vy);

% Calculation an plot of momentum and center of mass
[momentumx,momentumy] = momentumCalculation(m,vx,vy);
[rcmx,rcmy]=centerOfMass(m,x,y);
figure(2)
plot(rcmx,rcmy)
title('Center of mass')
xlabel('x[m]')
ylabel('y[m]')
legend('Center of mass','Location','best')
figure(3)
plot(t,momentumx)
hold on
plot(t,momentumy)
title('Momentum')
xlabel('time[s]')
ylabel('momentum[kg*m/s]')
legend('Momentum in x direction','Momentum in y direction','Location','best')

% Calculation of energy values
[Ek,Ep,Etot]=energy(G,m,x,y,vx,vy);

% Plot of energy values
figure(4)
plot(t,Ek)
hold on
plot(t,Ep)
plot(t,Etot)
title('Energy')
xlabel('time[s]')
ylabel('energy[Joule]')
legend('Kinetic Energy','Potential Energy','Total Energy','Location','southeast')
hold off

%Calculate orbit

% Mercury
orbitalPeriodMercury = orbital(x(:,2),y(:,2),x(:,1),y(:,1),t)./86400

% Venus
orbitalPeriodVenus = orbital(x(:,3),y(:,3),x(:,1),y(:,1),t)./86400

% Earth
orbitalPeriodEarth = orbital(x(:,4),y(:,4),x(:,1),y(:,1),t)./86400

% Mars
orbitalPeriodMars = orbital(x(:,5),y(:,5),x(:,1),y(:,1),t)./86400