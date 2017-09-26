function [sigmai, qi] = metodo_potencia_inv(A, q0, rho, k, tol)
%Método de Potencia aproxima el menor vector propio y valor propio de A
%usando el método de potencia inversa, tomando un q0 inicial, y una tolerancia tol

if(size(q0,1)<size(q0,2)) %Garantiza que el vector q0 sea vertical
q0=q0';
end

q1=(A-rho*eye(size(A,1)))\q0; %primera iteración
q1=q1/elem_mayor(q0);
cont=0;
while(norm(q0-q1)/norm(q1)>tol && cont<k)
 cont=cont+1;
 q0=q1;
 q1=(A-rho*eye(size(A,1)))\q0; %proceso importante
q1=q1/elem_mayor(q0);
end  
sigmai=1/elem_mayor(q1)+rho; %despeja para obtener el vap de A
qi=q1/norm(q1); %vuelve unitario el vep
end
