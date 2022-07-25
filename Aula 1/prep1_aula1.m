% dados da questão
% v1 = 8sin(wt) V | v2 = -3 + j5 V | v3 = 12,86/31,18° V
% i1 = 4,47/63,44° A | i2 = 3,16cos(wt - 116,57°) A | i3 = 2 - j2 A

% representação no domínio fasorial das tensões
v1_f = 8/sqrt(2)*exp(i*(-90/180*pi));
v2_f = -3 + i*5;
v3_f = 12.86/sqrt(2)*exp(i*31.18/180*pi);
Veq_f = v1_f + v2_f + v3_f;

% representação no domínio fasorial das correntes
i1_f = 4.47*exp(i*31.18/180*pi);
i2_f = 3.16/sqrt(2)*exp(i*-116.57/180*pi);
i3_f = 2 - i*2;
Ieq_f = i1_f + i2_f + i3_f;

% definindo os limites de tempo para a plotagem no domínio do tempo
t = linspace(0, 2/60, 100);

% representação no domínio do tempo das tensões
v1_t = 8*cos(2*pi*60*t  + (-90/180*pi));
v2_t_module = sqrt(real(v2_f)^2 + imag(v2_f)^2);
v2_t_phase = atan(imag(v2_f)/real(v2_f)); % arctan en radianos
v2_t = v2_t_module*cos(2*pi*60*t + v2_t_phase);
v3_t = 12.86*cos(2*pi*60*t + 31.18/180*pi);
Veq_t = v1_t + v2_t + v3_t;

% representação no domínio do tempo das correntes
i1_t = 4.47 * cos(2*pi*60*t + 63.44/180*pi);
i2_t = 3.16 * cos(2*pi*60*t - 116.57/180*pi);
i3_t_module = sqrt(real(i3_f)^2 + imag(i3_f)^2);
i3_t_phase = atan(imag(i3_f)/real(i3_f));
i3_t = i3_t_module*cos(2*pi*60*t + i3_t_phase);
Ieq_t = i1_t + i2_t + i3_t;

% plotagem da figura 1
figure(1);
plot([0 real(v1_f)],[0 imag(v1_f)], [0 real(v2_f)],[0 imag(v2_f)],
     [0 real(v3_f)],[0 imag(v3_f)], [0 real(Veq_f)],[0 imag(Veq_f)]);
title('Representação Fasorial das Tensões');
xlabel('Real [V]'); ylabel('imag [V]'); grid on;
legend('Tensão V1 [V]', 'Tensão V2 [V]', 'Tensão V3 [V]',
       'Tensão Equivalente [V]');

% plotagem da figura 2
figure(2);
plot([0 real(i1_f)],[0 imag(i1_f)], [0 real(i2_f)],[0 imag(i2_f)],
     [0 real(i3_f)],[0 imag(i3_f)], [0 real(Ieq_f)],[0 imag(Ieq_f)]);
title('Representação Fasorial das Correntes');
xlabel('Real [A]'); ylabel('imag [A]'); grid on;
legend('Corrente I1 [A]', 'Corrente I2 [A]', 'Corrente I3 [A]',
       'Corrente Equivalente [A]');

% plotagem da figura 3
figure(3);
plot(t, v1_t, t, v2_t, t, v3_t, t, Veq_t);
xlim([0, 2/60]);
title('Comportamento das Tensões no Domínio do Tempo');
xlabel('Tempo [s]'); ylabel('Tensão [V]'); grid on;
legend('Tensão V1 [V]', 'Tensão V2 [V]', 'Tensão V3 [V]',
       'Tensão Equivalente [V]');

% plotagem da figura 4
figure(4);
plot(t, i1_t, t, i2_t, t, i3_t, t, Ieq_t);
xlim([0, 2/60]);
title('Comportamento das Correntes no Domínio do Tempo');
xlabel('Tempo [s]'); ylabel('Corrente [A]'); grid on;
legend('Corrente I1 [A]', 'Corrente I2 [A]', 'Corrente I3 [A]',
       'Corrente Equivalente [A]');
