syms h1 h2
A = input("Ingrese área recipiente 1 y 2: ");

%Definición de modelo fenomenológico

%Flujos
F1 = h1 - h2;
F2 = h2;

%Variación de volumen
dv1 = F1 - F1;
dv2 = F1 - F2;

%Volumen
V1 = A*h1;
V2= A*h2;

%Variables

%Entradas -> F1 (u)
%F1 = u
%Salidas -> h1 y h2 (y1 ; y2)
%Estado -> h1 y h2 (x1 ; x2)
x1 = h1;
x2 = h2;

%Modelo estado
%X. = AX + BU
%Y = CX + DU

%Uniendo las ecuaciones del modelo fenomenológico se obtiene:
%Dado que dv1 = 0 => dh1 = 0
dh1 = 0;
dh2 = (h1 - 2*h2)/A;

%Se obtienen las variables de estado
dx1 = 0*x1 + 0*x2;
dx2 = (x1 - 2*x2)/A;


A = [0 0 ; ((dx2 + 2*x2./A)./x1) ((dx2 - x1./A)./x2)]
B = [0 ; 0]
C = [1 0; 0 1]
D = [0;0]

x0 = [1 ; 0];

sys = ss(double(A),double(B),double(C),double(D));
initial(sys,x0)

