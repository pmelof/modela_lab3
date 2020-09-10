% Continuación de la parte 1
% Suponiendo las siguientes matrices:
% A=[-b -a;c -d]
% B=[a;0]
% C= [1 0]
% D=0

syms s


% Función que recibe las matrices del modelo de estado y lo pasa a función
% de transferencia, entregando H1 y H2 por separado.
% H = Y/U = C((sI-A)^-1)B+D
% Entrada: Las matrices A, B, C y D.
% Salida: Dos funciones de transferencia.
function [H1, H2] = transformar_ME_a_FT(A, B, C, D)

sI = [s 0;0 s];
res = sI-A;
det=(res(1)*res(4)-(res(2)*res(3)));
adj=[res(4) -res(3);-res(2) res(1)];
%inversa=(1/det)*adj;
% C((sI-A)^1)
res2=C*adj;
% C((sI-A)^1)B
res2=res2*B;
% C((sI-A)^1)B+D
res2=res2*B+D;
H=(1/det)*res2;     % Función de transferencia final




end