function mayor= elem_mayor(v)
%elem_mayor Regresa el elemento cuyo valor absoluto sea mayor
mayor=0;
for i= 1:size(v,2)
    if(abs(norm(v(i)))>abs(mayor))
        mayor=v(i);
    end
end
end

