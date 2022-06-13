%starting point for a function calculating center of mass for a system of
%one or several bodies over a period of time
function [rcmx,rcmy]=centerOfMass(m,x,y)

%initial values
n=size(x,1);%number of timesteps
N=size(m,2);%number of bodies
totM = 0;

%preallocate memory (increases performance)
rcmx=zeros(n,1);
rcmy=zeros(n,1);

%calculates total mass of system
for j=1:N
    totM=totM + m(j);
end

%simulates center of mass
for i=1:n
    for j=1:N
        rcmx(i)=rcmx(i)+m(j)*x(i,j)/totM;
        rcmy(i)=rcmy(i)+m(j)*y(i,j)/totM;
    end
end

end