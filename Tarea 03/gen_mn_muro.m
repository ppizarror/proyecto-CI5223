function [m, n] = gen_mn_muro(fm, h, t, b, d, Ae, As, csis, aceroA44_28)
%GEN_MN_MURO Genera el diagrama momento-carga axial para un muro.
%
% Parametros:
%   fm              Resistencia prismatica de la albañileria (kgf/cm2)
%   h               Altura del muro (cm)
%   t               Ancho del muro (cm)
%   b               Largo del muro (cm)
%   d               Recubrimiento armadura (cm)
%   Ae              Area efectiva por unidad de largo (cm2/cm)
%   As              Area de las barras de acero (cm2)
%   csis            Indica que se aplica el caso estatico o sismico (true/false)
%   aceroA44_28     Indica si usa el acero A44-28H o el A63-42H

%% Define constantes
KGF_TON = 0.001; % Convierte kgf -> tonf
NPOINTS = 100; % Numero de untos de analisis

%% Calcula parametros del material
Es = 2100000; % Modulo de rigidez del acero (kgf/cm2)
Em = 700 * fm;
if ~csis % Caso estatico
    Fm = 0.33 * fm; % Con inspeccion especializada
else % Caso sismico
    Fm = 0.33 * fm * 1.33;
end
if aceroA44_28
    if ~csis % Caso estatico
        Fs = 1400; % kgf/cm2
    else % Caso sismico
        Fs = 1850;
    end
else
    if ~csis % Caso estatico
        Fs = 1700;
    else % Caso sismico
        Fs = 2200;
    end
end

%% Calcula parametros geometricos
Ae = Ae * b;

%% Genera los vectores
m = zeros(NPOINTS, 1);
n = zeros(NPOINTS, 1);

%% Calcula el primer punto, momento 0
fb = 0.2 * fm;
phi = 1 - (h / (40 * t))^3;
fa = fb * phi;

m(1) = 0;
n(1) = fa * Ae;

%% Caso 1
% Limite superior
Na = fa * Ae;
fl = 2 * Na / (b * t) - Fm;
n(2) = (Fm + fl) / 2 * (t * b);
m(2) = (Fm - fl) / 2 * t * b * (t / 2 - t / 3);

% Distribucion triangular en todo el ancho
n(3) = (Fm * t * b) / 2;
em = (t / 2 - t / 3);
m(3) = n(3) * em;

%% Caso 2
NPOINTS = NPOINTS - 3;
np2 = floor(NPOINTS*1/3);
NPOINTS = NPOINTS - np2;
[m2, n2] = mn_caso2(Fm, t, b, np2);
for i = 1:np2
    m(i+3) = m2(i);
    n(i+3) = n2(i);
end

%% Caso 3
nb = Es / Em; % Punto de balance
kb = nb / (nb + Fs / Fm);
np3 = floor(NPOINTS*0.5);
NPOINTS = NPOINTS - np3;
[m3, n3] = mn_caso3(Fm, t, b, nb, kb/2, As, np3);
for i = 1:np3
    m(i+3+np2) = m3(i);
    n(i+3+np2) = n3(i);
end

%% Caso 4
np4 = NPOINTS;
kbmin = max([-(As * nb + sqrt((As^2)*(nb^2)+2*b*d*As*nb)) / (b * d), ...
    -(As * nb - sqrt((As^2)*(nb^2)+2*b*d*As*nb)) / (b * d)]);
[m4, n4] = mn_caso4(Fs, t, b, nb, kbmin/2, kb/2, As, np4);
for i = 1:np4
    m(i+3+np2+np3) = m4(i);
    n(i+3+np2+np3) = n4(i);
end

%% Convierte unidades
n = n .* KGF_TON;
m = m .* KGF_TON * 0.01; % kgf*cm -> tonf*m

end