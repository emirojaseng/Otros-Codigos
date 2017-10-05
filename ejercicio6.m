function [G] = ejercicio6(n,p)
%aejercicio6 Crea la la matriz de adyacencia con 2n+1 puntos descrita en el ejercicio 6,
%posteriormente regresa la matriz google G correspondiente (con parametro de probabilidad p)

%__Primero crea la matriz de adyacencia A y la muestra__%
A=zeros(2*n+1,2*n+1); %inicializa
A=A+diag(ones(1,2*n-1),2); %conecciones intermedias
A(2*n,2)=1; %coneccion del ultimo impar con el 1
A(2*n+1,3)=1; %coneccion del ultimo par con el 2
        %A=A+A'; %ACTIVAR para hacer el caso bidireccional
A(1,2:2*n+1)=1; %coneccciones con el 0
A(2:2*n+1,1)=1; %conecciones con el 0

%__Crea la matriz Google G__%
s=zeros(1,2*n+1); %El vector s, donde s(i)=n_i (numero de conecciones desde i a otro punto)
    for i=1:2*n+1
        s(i)=sum(A(i,1:2*n+1));
    end

G=A*(1-p); %hasta ahora G_ij=a_ij*(1-p)
for i=1:2*n+1
G(i,1:2*n+1)=G(i,1:2*n+1)/s(i); %hasta ahora G_ij=a_ij*(1-p)/n_i
end
G=G+p/(2*n+1); %asi, finalmente queda G_ij=p/(2n+1)+a_ij*(1-p)/n_i
G=G'; %asi, finalmente queda G_ij=p/(2n+1)+a_ji*(1-p)/n_j
end
