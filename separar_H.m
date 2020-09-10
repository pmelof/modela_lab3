% Se tiene H(s) = a(s+d)/((s+b)(s+d)+ac)
% La matriz sI-A = [s+b a;-c s+d]

% Se debe llegar a la siguiente forma H1=a/(s+b) y H2=c/(s+d)

% Función que separa un H(s) en H1 y H2, si es que esas estaban en
% retroalimentación.
% Entrada: Función de transferencia, det(sI-A) y matriz A.
% Salida: Dos funciones de transferencia que estan en retroalimentación.
function [H1, H2] = separar_H(H, det, A)
syms s

% Numerador y denominador de H(s)
numerador = H(1)*det;
denominador = det;

% (s+d)*(s+b)
res = det+(A(3)*A(2));

numerador = numerador/res;
% den1 + den2 = denominador, donde den2=1
den1 = (denominador-res)/res;

H1 = numerador;
H2 = den1/H1;

end
