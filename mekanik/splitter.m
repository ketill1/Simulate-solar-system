%starting point for a function taking n evenly split point
%from a vector v and making a new vector smallsize
function smallsize = splitter(v,n)

%calculating vector steps
dv=floor(size(v,1)/n);

%preallocate memory (increases performance)
smallsize = zeros(n,1);

%initial value
smallsize(1)=v(1);

%creates the new vector
for i= 2:n
    smallsize(i) = v(dv*i);
end

end