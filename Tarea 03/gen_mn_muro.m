function [m, n] = gen_mn_muro(fm, h, b, t, d, dp, As, csis, aceroA44_28)
%GEN_MN_MURO Genera el diagrama momento-carga axial para un muro.
%
% Parametros:
%   fm              Resistencia prismatica de la albañileria (kgf/cm2)
%   h               Altura del muro (cm)
%   b               Largo del muro (cm)
%   t               Ancho del muro (cm)
%   d               Recubrimiento armadura (cm)
%   d'              Recubrimiento armadura (cm)
%   Ae              Area efectiva por unidad de largo (cm2/cm)
%   As              Area de las barras de acero (cm2)
%   csis            Indica que se aplica el caso estatico o sismico (true/false)
%   aceroA44_28     Indica si usa el acero A44-28H o el A63-42H

%% Define constantes
KGF_TON = 0.001; % Convierte kgf -> tonf
NPOINTS = 100; % Numero de untos de analisis

%% Calcula parametros del material
Es = 2100000; % Modulo de rigidez del acero (kgf/cm2)
if ~csis % Caso estatico
    Em = 700 * fm;
else
    Em = 800 * fm;
end
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

% Calcula la carga axial
fb = 0.2 * fm;
phi = 1 - (h / (40 * min([b, t])))^3;
Fa = fb * phi;
if csis
    Fa = Fa * 1.33;
end

%% Calcula parametros geometricos
Ae = b * t;

%% Genera los vectores
m = zeros(NPOINTS, 1);
n = zeros(NPOINTS, 1);

%% Calcula el primer punto, momento 0
Na = Fa * Ae;

m(1) = 0;
n(1) = Na;

%% Caso 1
% Limite superior
m(2) = (Fm - Fa) * t * b * (b / 2 - b / 3);
n(2) = Na;

% Distribucion triangular en todo el ancho
n(3) = (Fm * t * b) / 2;
em = (b / 2 - b / 3);
m(3) = n(3) * em;

%% Caso 2
NPOINTS = NPOINTS - 3;
np2 = floor(NPOINTS*1/3);
NPOINTS = NPOINTS - np2;
[m2, n2] = mn_caso2(Fm, b, t, d, np2, dp/d);
for i = 1:np2
    m(i+3) = m2(i);
    n(i+3) = n2(i);
end

%% Caso 3
nb = Es / Em; % Punto de balance
kb = nb / (nb + Fs / Fm);
np3 = floor(NPOINTS*0.5);
NPOINTS = NPOINTS - np3;
[m3, n3] = mn_caso3(Fm, t, d, nb, kb, As, np3, dp/d);
for i = 1:np3
    m(i+3+np2) = m3(i);
    n(i+3+np2) = n3(i);
end

%% Caso 4
np4 = NPOINTS;
kbmin = max([-(As * nb + sqrt((As^2)*(nb^2)+2*t*d*As*nb)) / (t * d), ...
    -(As * nb - sqrt((As^2)*(nb^2)+2*t*d*As*nb)) / (t * d)]);
[m4, n4] = mn_caso4(Fs, t, d, nb, kbmin/2, kb/2, As, np4, dp/d);
for i = 1:np4
    m(i+3+np2+np3) = m4(i);
    n(i+3+np2+np3) = n4(i);
end

%% Convierte unidades
n = n .* KGF_TON;
m = m .* KGF_TON * 0.01; % kgf*cm -> tonf*m

end