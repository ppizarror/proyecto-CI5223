function [m, n] = mn_caso4(Fs, t, b, N, kbmin, kbmax, As, nps)
%MN_CASO4
alpha = fliplr(linspace(kbmin, kbmax, nps));
m = zeros(nps, 1);
n = zeros(nps, 1);
for i = 1:nps
    fmax = alpha(i) / (0.5 - alpha(i)) * Fs / N;
    Cm = fmax * alpha(i) * t * b / 2;
    Ts = As * Fs;
    em = (t / 2 - (alpha(i) * t) / 3);
    n(i) = Cm - Ts;
    m(i) = Cm * em;
end
end