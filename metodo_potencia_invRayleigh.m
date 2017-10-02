function [sigmai, qi] = metodo_potencia_invRayleigh(A, q0, k)
%metodo_potencia_invRayleigh Metodo de potencia inversa con shift igual al
%   cociente de Rayleigh. q0 es proximo a algun vep

if(size(q0,1)<size(q0,2)) %Garantiza que el vector q0 sea vertical
q0=q0';
end

 cont=0;
 q1=q0;
while(cont<k)
 cont=cont+1;
 q0=q1;
 rho=(q0'*A*q0)/(q0'*q0); %cociente de Rayleigh
 if(rcond(A-rho*eye(size(A,1)))<10*eps) %Checa que no sea aprox singular
     break
 else
 q1=(A-rho*eye(size(A,1)))\q0; %proceso importante
q1=q1/elem_mayor(q0);
 end
end  
sigmai=1/elem_mayor(q1)+rho; %despeja para obtener el vap de A
qi=q1/norm(q1); %vuelve unitario el vep
end

