%starting point for a function calculating momentum in x and y direction for a system of
%one or several bodies over a period of time
function [momentumx,momentumy]=momentumCalculation(m,vx,vy)

%initial values
n=size(vx,1);%number of timesteps
N=size(m,2);%number of bodies

%preallocate memory (increases performance)
momentumx=zeros(n,1);
momentumy=zeros(n,1);

%simulate total momentum for the entire system
for i=1:n
    for j=1:N
        momentumx(i)=momentumx(i)+m(1,j)*vx(i,j);
        momentumy(i)=momentumy(i)+m(1,j)*vy(i,j);
    end
end

end
