%starting point for a function calculating acceleration between several
%objects depending on position and mass
function [ax,ay]=acceleration(G,m,x,y)

%initial values
n=size(x,1);%number of timesteps
N=size(x,2);%number of bodies

%preallocate memory (increases performance)
ax=zeros(n,N);
ay=zeros(n,N);

%define a function for calculating the distance between two points
r=@(x1,x2,y1,y2)sqrt((x1-x2)^2+(y1-y2)^2);

%define functions for calculating acceleration one object feels from
%another
acx=@(i,j,k)-G*m(k)*((x(i,j)-x(i,k))/  r(x(i,j),x(i,k),y(i,j),y(i,k))^3);
acy=@(i,j,k)-G*m(k)*((y(i,j)-y(i,k))/  r(x(i,j),x(i,k),y(i,j),y(i,k))^3);

%simulates total acceleration felt for all bodies
for j = 1:N
    for k = 1:j-1
        for i=1:n
            ax(i,j)=ax(i,j)+ acx(i,j,k);
            ay(i,j)=ay(i,j)+ acy(i,j,k);
        end
    end
    for k = j+1:N
        for i=1:n
            ax(i,j)=ax(i,j)+ acx(i,j,k);
            ay(i,j)=ay(i,j)+ acy(i,j,k);
        end
    end
end

end