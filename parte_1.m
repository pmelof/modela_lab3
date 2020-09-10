% Lab 3 modela
% Gustavo Hurtado - Patricia Melo
%

% ----------------------------- Parte 1 ------------------------------
% Se trabaja con dos funciones de transeferencia en retroalimentación

% Entrada dos funciones de transferencia
% Estas son de la forma H1=a/(s+b) y H2=c/(s+d)
% Se solicita ingresar a, b, c y d
disp("La función de transferencia de H1 es de la forma: a/(s+b")
a = input("Ingrese a: ");
b = input("Ingrese b: ");

disp("La función de transferencia de H2 es de la forma: c/(s+d")
c = input("Ingrese c: ");
d = input("Ingrese d: ");

% H1 y H2 están en retroalimentación, y utilizando Masón se tiene:
% X1=4(U-X2)/(s+5) y X2=2(X1)/(s+1), donde X1 es la salida de H1 y X2 la
% salida de H2

% Despejando sX1 y sX2 se obtiene:
% sX1=aU-aX2-bX1
% sX2=cX1-X2

% Volviendo al tiempo (inversa de Laplace)
% x1'(t)=au(t)-ax2(t)-bx1(t)
% x2'(t)=cx1(t)-x2(t)
% Además, la salida Y=X1
% Matricialmente: X'=AX+BU    Y=CX+DU
A=[-b -a; c -d];
B=[a; 0];
C=[1 0];
D=0;




