function [lambdas] = MQR_dynamic(A, k, tol)
%MQR_dynamic Método QR con shift dinamico y factorizacion hessenberg
A=hess(A);
n=size(A,1);
lambdas=zeros(n,1);
while(n>1)
cont=0;
    while(abs(A(n,n-1))>tol && cont<k)
        cont=cont+1;
        rho=A(n,n);
        [Q,R]=qr(A-rho*eye(size(A,1)));
        A=R*Q+rho*eye(size(A,1));
    end
    lambdas(n)=A(n,n);
    n=n-1;
    A=A(1:n,1:n);    
end
lambdas(1)=A(1,1);
end

