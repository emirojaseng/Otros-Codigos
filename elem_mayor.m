function mayor= elem_mayor(v)
%elem_mayor Regresa el elemento cuyo valor absoluto sea mayor
mayor=0;
if(size(v,1)<size(v,2)) %Garantiza que el vector q0 sea vertical
v=v';
end

for i= 1:size(v,1)
    if(abs(norm(v(i)))>abs(mayor))
        mayor=v(i);
    end
end
end
