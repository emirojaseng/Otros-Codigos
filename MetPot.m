function [vap,vep] = MetPot(A, q0, tol)
%Método de Potencia aproxima el mayor vector propio y valor propio de A
%usando el método de potencia, tomando un q0 inicial, y una tolerancia tol
q0=q0';
q1=(A*q0)/elem_mayor(q0);
cont=0;
while(norm(q0-q1)/norm(q1)>tol)
 cont=cont+1;
 q0=q1;
 q1=(A*q0)/elem_mayor(q0);
end  
vap=elem_mayor(q1)
vep=q1
cont
end

