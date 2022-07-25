% definindo os valores das tensões no domínio do tempo
v1_t = 50*cos(2*pi*60*t + 36.87/180*pi);
v2_t = 81.65*cos(2*pi*60*t + 36.87/180*pi);
v3_t_module = sqrt(real(v3_f)^2 + imag(v3_f)^2);
v3_t_phase = atan(imag(v3_f)/real(v3_f));
v3_t = v3_t_module*cos(2*pi*60*t + v3_t_phase);
Veq_t = v1_t + v2_t + v3_t;

% plotando as curvas das tensões no domínio do tempo
figure(1);
plot(t, v1_t, t, v2_t, t, v3_t, t, Veq_t);
xlim([0, 2/60]);
title('Comportamento das Tensões no Domínio do Tempo');
xlabel('Tempo [s]'); ylabel('Tensão [V]'); grid on;
legend('Tensão V1 [V]', 'Tensão V2 [V]', 'Tensão V3 [V]',
       'Tensão Equivalente [V]');

% Quando v2 está em fase com v1, veq alcança um maior valor de RMS
% Vrms2 > Vrms1 > Vrms3
% max(Veq_t) = 122.55, fase = 36.87°
