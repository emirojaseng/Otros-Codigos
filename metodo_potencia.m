function [sigmai, qi] = metodo_potencia(A, q0,k, tol)
%Metodo de Potencia aproxima el mayor vector propio y valor propio de A
%usando el metodo de potencia, tomando un q0 inicial, numero maximo 
% de iteraciones k y una tolerancia tol

if(size(q0,1)<size(q0,2)) %Garantiza que el vector q0 sea vertical
q0=q0';
end

q1=(A*q0)/elem_mayor(q0); %primera iteracion. q1 es el "nuevo" vector
cont=0; %contador que cuenta el numero de iteraciones
while(norm(q0-q1)/norm(q1)>tol && cont<k)
 cont=cont+1;
 q0=q1;
 q1=(A*q0)/elem_mayor(q0); %Este es el proceso importante
end  
sigmai=elem_mayor(q1);
qi=q1/norm(q1);%vuelve unitario al vep
end
