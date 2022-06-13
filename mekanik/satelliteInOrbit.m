
%% ------------Satellite in orbit------------ %%

% Initial values
clear all
hold off
G=1;
m=[0.01,10];
x0=10;
y0=0;
vx0=0;
vy0=0.75;
%Escape velocity by sqrt(2*G*M/r) for us sqrt(2)
tmax=100;
dt=0.0001;

% Calculation of satellite values
[x,y,vx,vy,ax,ay,t]=orbit_1body(G,m(1,2),x0,y0,vx0,vy0,dt,tmax);

% Planet values
y2=zeros(size(y,1),1);
x2=zeros(size(x,1),1);
vy2=zeros(size(vy,1),1);
vx2=zeros(size(vx,1),1);
ay2=zeros(size(ay,1),1);
ax2=zeros(size(ax,1),1);
x=[x x2];
y=[y y2];
vx=[vx vx2];
vy=[vy vy2];
ax=[ax ax2];
ay=[ay ay2];

% Plot of movement
close all
figure(1)
axis image
plot(x(:,1),y(:,1))
hold on
[rcmx,rcmy]=centerOfMass(m,x,y); %Calculation of center of mass
plot(rcmx,rcmy)
smallax = splitter(ax,10); % splitter is used to get 
                           % a managable amount of arrows
smallay = splitter(ay,10);
smallx = splitter(x,10);
smally = splitter(y,10);
smallvx = splitter(vx,10);
smallvy = splitter(vy,10);
quiver(smallx,smally,smallvx,smallvy,0.5);
quiver(smallx,smally,smallax,smallay,0.5);
plot(0,0,'o')
title('Orbit')
xlabel('x[m]')
ylabel('y[m]')
legend('Orbit','Center of Mass','Velocity','Acceleration','Planet','Location','southwest')
hold off

% Calculation of energy values
[Ek,Ep,Etot]=energy(G,m,x,y,vx,vy);

% Plot of energy values
figure(2)
plot(t,Ek)
hold on
plot(t,Ep)
plot(t,Etot)
title('Energy')
xlabel('time[s]')
ylabel('energy[Joule]')
legend('Kinetic Energy','Potential Energy','Total Energy','Location','southeast')
hold off

% Calculation of momentum
[momentumx,momentumy] = momentumCalculation(m,vx,vy);

% Plot of momentum
figure(3)
plot(t,momentumx)
hold on
plot(t,momentumy)
title('Momentum')
xlabel('time[s]')
ylabel('momentum[kg*m/s]')
legend('Momentum in x direction','Momentum in y direction','Location','southeast')


% Orbit time calculation
orbitalPeriod = orbital(x(:,1),y(:,1),x(:,2),y(:,2),t)./(3600*24)