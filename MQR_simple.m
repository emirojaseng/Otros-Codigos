function [lambdas] = MQR_simple(A, k, tol)
%MQR_simple Aplica el metodo QR simple, sin ninguna mejora rapidez
A0=A;
cont=0;
while(norm(diag(A0,-1))>tol && cont<k)
cont=cont+1;
[Q, R]=qr(A0);
A1=R*Q;
A0=A1;
end
lambdas=diag(A0);
end

