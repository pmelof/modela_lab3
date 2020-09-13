syms h1 h2 F1 F2 A
A = input("Ingrese área recipiente 1 y 2: ");
F1 = input("Ingrese flujo inicial recipiente 1: ");
h1 = input("Ingrese nivel recipiente 1: ");
h2 = input("Ingrese nivel recipiente 2: ");

%Definición de modelo fenomenológico

%Flujos
F1 = h1 - h2;
F2 = h2;

%Variación de volumen
dv1 = F1 - F1;
dv2 = F1 - F2;

%Volumen de agua
V1 = A*h1;
V2= A*h2;

%Variables

disp("Entradas -> F1 (u)")
disp("Salidas -> h1 y h2 (y1 ; y2)")
disp("Estado -> h1 y h2 (x1 ; x2)")

x1 = h1;
x2 = h2;
u = F1;
%Modelo estado
%X. = AX + BU
%Y = CX + DU

%Uniendo las ecuaciones del modelo fenomenológico se obtiene:
%Dado que dv1 = 0 => dh1 = 0
dh1 = 0;
dh2 = (h1 - 2*h2)/A;

disp("Las variables de estado son:")
disp("dx1 = 0")
disp("dx2 = x1/A - 2*x2/A")

%Se obtienen las variables de estado
disp("Variables de estado evaluadas:")
dx1 = 0*x1 + 0*x2
dx2 = (x1 - 2*x2)/A

disp("Se generan las matrices para el modelo de estado")
%Se generan las matrices A, B, C y D para %X. = AX + BU  ; Y = CX + DU
disp("Matriz A:")
A = [0 0 ; ((dx2 + 2*x2/A)/x1) ((dx2 - x1/A)/x2)]
disp("Matriz B:")
B = [0 ; 0]
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

