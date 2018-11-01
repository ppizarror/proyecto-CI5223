% Crea los espectros de la tarea

%% Crea los datos
r0 = 0.4;
suelo = 'd';
zona = 3;
categoria = 2;
tx = 0.01;
ty = 0.01;

%% Crea el espectro elastico
espectro_elastico(categoria, zona, suelo, 10, true, 5, true);

%% Crea el espectro inelastico
espectro_inelastico(categoria, zona, suelo, tx, ty, r0, 10, true, 5);