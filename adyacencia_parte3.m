function [A] = adyacencia_parte3(n)
%adyacencia_parte3 Hace la matriz de adyacencia descrita en la parte 3
A=zeros(n,n); %inicializa
A(1,2:n)=1; %conecciones del 0 a los demas
A(2:n,1)=1; %conecciones del de los demas al 0;

impar=zeros(1,n);
par=zeros(1,n);
    for i=2:n
        if mod(i,2)==1
            par(i)=1;
        else 
            impar(i)=1;
        end
    end
A=A+diag(impar,0)+diag(impar,0);
end
