function [lambdas] = MQR_simple(A, k, tol)
%MQR_simple Aplica el metodo QR simple, sin ninguna mejora rapidez
cont=0;
while(norm(diag(A,-1))>tol && cont<k) %Criterio para detenerlo
cont=cont+1;
[Q, R]=qr(A); %factoriza en QR
A=R*Q; %A_{i+1}=R_iQ_i
end
lambdas=diag(A);
end

