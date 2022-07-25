% dados da questão
% v1 = 50/36,87° V | v2 = 81,65sin(wt + pi/3) V | v3 = -1,41 + j18,75 V
% i1 = 15/143,13° A | i2 = 30cos(wt - pi/4) A | i3 = 15,79 - j0,84 A

% representação no domínio fasorial das tensões
v1_f = 50/sqrt(2)*exp(i*36.87/180*pi);
v2_f = 81.65/sqrt(2)*exp(i*-90/180*pi + pi/3);
v3_f = -1.41 + i*18.75;
Veq_f = v1_f + v2_f + v3_f;

% representação no domínio fasorial das correntes
i1_f = 15/sqrt(2)*exp(i*143.13/180*pi);
i2_f = 30/sqrt(2)*exp(i*-pi/4);
i3_f = 15.79 - i*0.84;
Ieq_f = i1_f + i2_f + i3_f;

% definindo os limites de tempo para a plotagem no domínio do tempo
t = linspace(0, 2/60, 100);

% representação no domínio do tempo das tensões
v1_t = 50*cos(2*pi*60*t + 36.87/180*pi);
v2_t = 81.65*cos(2*pi*60*t + pi/3);
v3_t_module = sqrt(real(v3_f)^2 + imag(v3_f)^2);
v3_t_phase = atan(imag(v3_f)/real(v3_f));
v3_t = v3_t_module*cos(2*pi*60*t + v3_t_phase);
Veq_t = v1_t + v2_t + v3_t;

% representação no domínio do tempo das correntes
i1_t = 15*cos(2*pi*60*t + 143.13/180*pi);
i2_t = 30*cos(2*pi*60*t - pi/4);
i3_t_module = sqrt(real(i3_f)^2 + imag(i3_f)^2);
i3_t_phase = atan(imag(i3_f)/real(i3_f));
i3_t = i3_t_module*cos(2*pi*60*t + i3_t_phase);
Ieq_t = i1_t + i2_t + i3_t;
