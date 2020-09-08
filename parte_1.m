% Lab 3 modela
% Gustavo Hurtado - Patricia Melo
%

% ----------------------------- Parte 1 ------------------------------
% Se trabaja con dos funciones de transeferencia en retroalimentación

% Entrada dos funciones de transferencia
% Estas son de la forma H1=a/(s+b) y H2=c/(s+d)
% Se solicita ingresar a, b, c y d
disp("La función de transferencia de H1 es de la forma: a/(s+b")
a = input("Ingrese a: ")
b = input("Ingrese b: ")

disp("La función de transferencia de H2 es de la forma: c/(s+d")
c = input("Ingrese c: ")
d = input("Ingrese d: ")

% Pasando las funciones de transferencia H1 y H2 en retroalimentación a
% solo una función H(s). Luego se separa H(s) en serie dejando el nuevo H1
% como 1/denominador y el nuevo H2 como el numerador

% Se aplica la inversa de Laplace al nuevo H1
% Obteniendo la ecucación diferencial:
% z''(t) + (d+b)z'(t) + (bd+ac)z(t) = u(t)  Con z como salida de H1
% Con esto definimos las variables de estado
% x1=z, x2=z'
% Obteniendo primeras derivadas
% x1'=x2, x2'=u-(d+b)x2-(bd+ac)x1
% Escrito de manera matricial -> X'=AX+BU
A_H1=[0 1;-(b*d+a*c) -(d+b)]
B_H1=[0;1]

% z es la salida de H1 y a la vez la entrada de H2
% De esta forma se tiene: z->as+ad->y
% Se aplica la inversa de Laplace al nuevo H2
% Obteniendo la ecucación diferencial:
% y(t) = az'(t)+adz(t)
% Con esto definimos las variables de estado
% x1=z, x2=z'
% y=adx1+ax2
% Escrito de manera matricial -> Y=CX+DU
C_H2=[a*d a]
D_H2=[0;0]


