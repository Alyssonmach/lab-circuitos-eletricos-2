# definindo os valores das correntes no domínio do tempo
i1_t = 15*cos(2*pi*60*t + 143.13/180*pi);
i3_t_module = sqrt(real(i3_f)^2 + imag(i3_f)^2);
i3_t_phase = atan(imag(i3_f)/real(i3_f));
i3_t = i3_t_module*cos(2*pi*60*t + i3_t_phase);
i2_t = 30*cos(2*pi*60*t + i3_t_phase);
Ieq_t = i1_t + i2_t + i3_t;

# plotando as curvas das correntes no domínio do tempo
figure(1);
plot(t, i1_t, t, i2_t, t, i3_t, t, Ieq_t);
xlim([0, 2/60]);
title('Comportamento das Correntes no Domínio do Tempo');
xlabel('Tempo [s]'); ylabel('Corrente [A]'); grid on;
legend('Corrente I1 [A]', 'Corrente I2 [A]', 'Corrente I3 [A]',
       'Corrente Equivalente [A]');

# Quando i2 está em fase com i3, ieq alcança um maior valor de RMS
# Irms2 > Irms3 > Irms1
# max(Veq_t) = 34.38, fase =  -0.053148
