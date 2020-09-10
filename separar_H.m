% Se tiene H(s) = a(s+d)/((s+b)(s+d)+ac)
% La matriz sI-A = [s+b a;-c s+d]

% Se debe llegar a la siguiente forma H1=a/(s+b) y H2=c/(s+d)

% Función que separa un H(s) en H1 y H2, si es que esas estaban en
% retroalimentación.
% Entrada: Función de transferencia y matriz sI-A.
% Salida: Dos funciones de transferencia que estan en retroalimentación.
function [H1, H2] = separar_H(H, matriz, det)

% det(A) = A(1)*A(4)-A(3)*A(2)
% Parte del denominador que no tiene s -A(3)*A(2)

numerador = H(1)*det;
res = det+(A(3)*A(2));


end
