function [m, n] = mn_caso4(Fs, t, d, N, kbmin, kbmax, As, nps, gamma)
%MN_CASO4
alpha = fliplr(linspace(kbmin, kbmax, nps));
m = zeros(nps, 1);
n = zeros(nps, 1);
for i = 1:nps
    fmax = alpha(i) / (0.5 - alpha(i)) * Fs / N;
    Cm = fmax * alpha(i) * t * d / 2;
    Ts = As * Fs;
    es = (1 - gamma) * d / 2;
    em = d * (1 + gamma) / 2 - (alpha(i) * d) / 3;
    n(i) = Cm - Ts;
    m(i) = Cm * em + Ts * es;
end
end