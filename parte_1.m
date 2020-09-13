% Laboratorio 3 Modelación y Simulación
% Gustavo Hurtado - Patricia Melo
%

% ----------------------------- Parte 1 ------------------------------
% Se trabaja con dos funciones de transeferencia en retroalimentación

% Entrada dos funciones de transferencia
% Estas son de la forma H1=a/(s+b) y H2=c/(s+d)
% Se solicita ingresar a, b, c y d
disp("La función de transferencia de H1 es de la forma: a/(s+b)")
a = input("Ingrese a: ");
b = input("Ingrese b: ");

disp("La función de transferencia de H2 es de la forma: c/(s+d)")
c = input("Ingrese c: ");
d = input("Ingrese d: ");

% H1
disp("Función de transferencia 1: ")
n1 = [0 a];
d1 = [1 b];
H1 = tf(n1,d1)

% H2
disp("Función de transferencia 2: ")
n2 = [0 c];
d2 = [1 d];
H2 = tf(n2,d2)

disp("Transformando de función de transferencia a modelo de estado ...")

% H1 y H2 están en retroalimentación, y utilizando Masón se tiene:
% X1=a(U-X2)/(s+b) y X2=c(X1)/(s+d), donde X1 es la salida de H1 y X2 la
% salida de H2.

% Despejando sX1 y sX2 se obtiene:
% sX1=aU-aX2-bX1
% sX2=cX1-dX2

% Volviendo al tiempo (inversa de Laplace)
% x1'(t)=au(t)-ax2(t)-bx1(t)
% x2'(t)=cx1(t)-x2(t)
% Además, la salida Y=X1
% Matricialmente: X'=AX+BU    Y=CX+DU
A = [-b -a; c -d];
B = [a; 0];
C = [1 0];
D = 0;

% Se muestran las matrices del modelo de estado:
disp("Generando matrices ...")
disp("Matriz A: ")
A
disp("Matriz B: ")
B
disp("Matriz C: ")
C
disp("Matriz D: ")
D


% A partir del modelo de estado ahora se hace el proceso inverso,
% transformando así de ME a FT (función de transferencia), entregando como
% resultado las dos H ingresadas al inicio.

disp("Transformando de modelo de estado a función de transferencia ...")
% Se guardan las funciones de transferencia en H3 y H4 para poder comparar
% entre H1 y H2 que son las originales.
[H3, H4] = transformar_ME_a_FT(A, B, C, D);

% Funciones obtenidas:
H3
H4

disp("** Presione enter para graficar comportamiento del modelo de estado ** ")
input("")
disp("Generando gráfico ...")
% Graficando
x0 = [1 ; 0];

sys = ss(double(A),double(B),double(C),double(D));
initial(sys,x0)



