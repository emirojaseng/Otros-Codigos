function mayor= elem_mayor(v)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
mayor=0;
for i= 1:size(v,2)
    if(abs(norm(v(i)))>mayor)
        mayor=v(i);
    end
end
end

