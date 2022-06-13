%starting point for a function calculating orbit time
%for an object around a set point
function orbitalPeriod = orbital(x,y,cx,cy,t)

%calculating position line for reference
k = (y(1)-cy(1))/(x(1)-cx(1));
if (x(1)-cx(1)) == 0
    kxm=@(x)10^25*x;
else
    kxm=@(x)k*x;
end

%help variables
prevOrbitalEndTimePosition = 1;
n=1;
orbitalPeriod = 0;

%checks if the orbit starts above or below the position line
if kxm(x(2)) < y(2)
    startPosition = 1;
    prevPosition = 1;
else
    startPosition = -1;
    prevPosition = -1;
end

%checks over time for change in position in relation to the position line
for i = 2:size(x)
    
    %checks current position
    if kxm(x(i)) < y(i)
        position = 1;
    else
        position = -1;
    end
    
    %calculates orbit time when an orbit is completed
    if position ~= prevPosition
        if position == startPosition
            if prevOrbitalEndTimePosition == 1
                orbitalPeriod(n) = (t(i)+t(i-1))/2-t(prevOrbitalEndTimePosition);
            else
                orbitalPeriod(n) = (t(i)+t(i-1))/2-(t(prevOrbitalEndTimePosition)+t(prevOrbitalEndTimePosition-1))/2;
            end
            prevOrbitalEndTimePosition = i;
            n=n+1;
            prevPosition = position;
        else
            prevPosition = position;
        end
    end
    
end

end