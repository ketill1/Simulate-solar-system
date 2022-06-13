%starting point for a function calculating potential,kinetic and total energy for a system of
%one or several bodies over a period of time
function [Ek,Ep,Etot]=energy(G,m,x,y,vx,vy)

%initial values
n=size(x,1);%number of timesteps
N=size(x,2);%number of bodies

%preallocate memory (increases performance)
Ek=zeros(n,1);
Ep=zeros(n,1);

%define a function for calculating the distance between two points
r=@(x1,x2,y1,y2)sqrt((x1-x2)^2+(y1-y2)^2);

%define a function for calculating the speed given x and y velocity vectors
v=@(x,y)sqrt(x^2+y^2);

%simulates total kinetic energy of the system
for j=1:N
    for i=1:n
        Ek(i,1)=Ek(i,1)+(m(j)*((v(vx(i,j),vy(i,j)))^2))/2;
    end
end

%simulates total kinetic energy of the system
for j=1:N
    for k = j+1:N
        for i=1:n
            Ep(i,1) = Ep(i,1) - G*m(j)*m(k)/r(x(i,j),x(i,k),y(i,j),y(i,k));
        end
    end
end

%calculating total energy
Etot = Ep + Ek;

end