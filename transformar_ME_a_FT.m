% Continuación de la parte 1
% Suponiendo las siguientes matrices:
% A=[-b -a;c -d]
% B=[a;0]
% C= [1 0]
% D=0
% Función que recibe las matrices del modelo de estado y lo pasa a función
% de transferencia, entregando H1 y H2 por separado.
% H = Y/U = C((sI-A)^-1)B+D
% Entrada: Las matrices A, B, C y D.
% Salida: Dos funciones de transferencia.
function [H1, H2] = transformar_ME_a_FT(A, B, C, D)
syms s

sI = [s 0;0 s];
res = sI-A;
det=(res(1)*res(4)-(res(2)*res(3)));
adj=[res(4) -res(3);-res(2) res(1)];
%inversa=(1/det)*adj;
% C(adj(sI-A))
res=C*adj;
% C(adj(sI-A))B
res=res*B;
% C(adj(sI-A))B+D
res=res+D;
% C(inversa(sI-A))B+D
H =(1/det)*res;     % Función de transferencia final

% Separando H(s) en H1 y H2
[H1, H2] = separar_H(H, det, A);
H1 = simplifyFraction(H1);
H2 = simplifyFraction(H2);

end