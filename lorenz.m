function [x,y,z,t]=lorenz(CI, param, h, N)
%Resuelve el sistema de lorenz con condiciones iniciales
%CI=[x0,y0,z0], parametros=[sigma,b,r], paso h, N iteraciones
%
%VALORES PROPUESTOS POR LORENZ EN SU PAPER DE 1963:
%[x,y,z,t]=lorenz([0,1,0], [10,8/3,28],0.01, 6000)

%inicializa
x=zeros(1,N);
y=zeros(1,N);
z=zeros(1,N);
t=linspace(0,h*N,N);
x(1)=CI(1);
y(1)=CI(2);
z(1)=CI(3);
sigma=param(1);
b=param(2);
r=param(3);

%Sistema de lorenz
fx=@(x,y,z) sigma*(y-x);
fy=@(x,y,z) r*x-y-x*z;
fz=@(x,y,z) x*y-b*z;

for i=1:N-1
%primer paso de forward euler
xtemp=x(i)+h*fx(x(i),y(i),z(i));
ytemp=y(i)+h*fy(x(i),y(i),z(i));
ztemp=z(i)+h*fz(x(i),y(i),z(i));

%segundo paso de forward euler
xtemp2=xtemp+h*fx(xtemp,ytemp,ztemp);
ytemp2=ytemp+h*fy(xtemp,ytemp,ztemp);
ztemp2=ztemp+h*fz(xtemp,ytemp,ztemp);

%aproximacion diferencia doble
x(i+1)=.5*(x(i)+xtemp2);
y(i+1)=.5*(y(i)+ytemp2);
z(i+1)=.5*(z(i)+ztemp2);
end

plot3(x,y,z)
title("Sistema de Lorenz");
xlabel('x');
ylabel('y');
zlabel('z');
hold
end