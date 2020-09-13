syms l1 l2 F0 F1 F2 u A1 A2 R1 R2
F0 = input("Ingrese flujo inicial recipiente 1: ");
A1 = input("Ingrese área recipiente 1: ");
A2 = input("Ingrese área recipiente 2: ");
R1 = input("Ingrese R recipiente 1: ");
R2 = input("Ingrese R recipiente 2: ");
l1 = input("Ingrese nivel recipiente 1: ");
l2 = input("Ingrese nivel recipiente 2: ");

%Definición de modelo fenomenológico

%Flujos
F1 = (l1 - l2)/R1;
F2 = l2/R2;

%Variación de volumen
dv1 = F0 - F1;
dv2 = F1 - F2;

%Volumen
V1 = A1*l1;
V2= A2*l2;

%Variables
x1 = l1;
x2 = l2;
u = F0;

disp("Entradas -> F0 (u)")
disp("Salidas -> l1 y l2 (y1 ; y2)")
disp("Estado -> l1 y l2 (x1 ; x2)")

%Modelo estado
%X. = AX + BU
%Y = CX + DU



%Uniendo las ecuaciones del modelo fenomenológico se obtiene:
%Dado que dv1 = 0 => dl1 = 0
dl1 = F0/A1 - (l1 - l2)/(R1*A1);
dl2 = (l1 - l2)/(R1*A2) - (l2)/(R2*A2);

disp("Las variables de estado son:")
disp("dx1 = -(x1)/(R1*A1) + x2/(A1*R2) + u/A1")
disp("dx2 = (x1)/(R1*A2) - x2/(A2*(R1+R2)) + 0*u")

disp("Variables de estado evaluadas:")
%Se obtienen las variables de estado
dx1 = -(x1)/(R1*A1) + x2/(A1*R2) + u/A1
dx2 = (x1)/(R1*A2) - x2/(A2*(R1+R2)) + 0*u

%Se realizan operaciones convenientes para obtener los valores de A y B.
mv_1 = (dx1 - x2/(A1*R2) - u/A1)/x1;
mv_2 = (dx1 + (x1)/(R1*A1) - u/A1)/x2;
mv_3 = (dx2 + x2/(A2*(R1+R2)))/x1;
mv_4 = (dx2 - x1/(R1*A2))/x2;
mv_5 =  (dx1 - (-(x1)/(R1*A1) + x2/(A1*R2)))/u;
mv_6 =  (dx2 - ((x1)/(R1*A2) - x2/(A2*(R1+R2))))/u;

disp("Se generan las matrices para el modelo de estado")
%Se generan las matrices A, B, C y D para %X. = AX + BU  ; Y = CX + DU
disp("Matriz A:")
A = [mv_1 mv_2 ; mv_3 mv_4]
disp("Matriz B:")
B = [mv_5 ; mv_6]
disp("Matriz C:")
C = [1 0; 0 1]
disp("Matriz D:")
D = [0;0]

disp("** Presione enter para graficar comportamiento del modelo de estado **")
input("")
disp("Generando gráfico ...")

x0 = [1 ; 0];
sys = ss(double(A),double(B),double(C),double(D));
initial(sys,x0)

