syms h1 h2 F0 u
A1 = input("Ingrese área recipiente 1: ");
A2 = input("Ingrese área recipiente 2: ");
R1 = input("Ingrese R recipiente 1: ");
R2 = input("Ingrese R recipiente 2: ");

%Definición de modelo fenomenológico

%Flujos
F1 = (h1 - h2)/R1;
F2 = h2/R2;

%Variación de volumen
dv1 = F0 - F1;
dv2 = F1 - F2;

%Volumen
V1 = A1*h1;
V2= A2*h2;

%Variables

%Entradas -> F1 (u)
%F0 = u;
%Salidas -> h1 y h2 (y1 ; y2)
%Estado -> h1 y h2 (x1 ; x2)
%x1 = h1;
%x2 = h2;

%Modelo estado
%X. = AX + BU
%Y = CX + DU

%Uniendo las ecuaciones del modelo fenomenológico se obtiene:
%Dado que dv1 = 0 => dh1 = 0
dh1 = F0/A1 - (h1 - h2)/(R1*A1);
dh2 = (h1 - h2)/(R1*A2) - (h2)/(R2*A2);

x1 = h1;
x2 = h2;
u = F0;

%Se obtienen las variables de estado
dx1 = -(x1)/(R1*A1) + x2/(A1*R2) + u/A1; 
dx2 = (x1)/(R1*A2) - x2/(A2*(R1+R2)) + 0*u;

mv_1 = (dx1 - x2/(A1*R2) - u/A1)/x1
mv_2 = (dx1 + (x1)/(R1*A1) - u/A1)/x2
mv_3 = (dx2 + x2/(A2*(R1+R2)))/x1
mv_4 = (dx2 - x1/(R1*A2))/x2

mv_5 =  (dx1 - (-(x1)/(R1*A1) + x2/(A1*R2)))/u
mv_6 =  (dx2 - ((x1)/(R1*A2) - x2/(A2*(R1+R2))))/u

A = [mv_1 mv_2 ; mv_3 mv_4]
B = [mv_5 ; mv_6]
C = [1 0; 0 1]
D = [0;0]

x0 = [100 ; 0];

sys = ss(double(A),double(B),double(C),double(D));
initial(sys,x0)

