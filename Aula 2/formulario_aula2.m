# dados fornecidos na questão
fase = -20; vrms = 127; irms = 10;

# definindo a tensão e a corrente no domínio fasorial
v_f = vrms*exp(i*(0/180*pi));
i_f = irms*exp(i*(fase/180*pi));

# definindo os limites de tempo para a plotagem no domínio do tempo
t = linspace(0, 2/60, 100);

# defindo a frequência angular
w = 2*pi*60;

# definindo a tensão e a corrente no domínio do tempo
v_t = vrms * sqrt(20) * cos(w*t + fase/180*pi);
i_t = irms * sqrt(20) * cos(w*t + fase/180*pi);

# plotando os gráficos da tensão e da corrente no domínio do tempo
figure(1);
plot(t, v_t, t, i_t);
title('Comportamento da Tensão e da Corrente no Domínio do Tempo');
xlabel('Tempo [s]'); grid on;
legend('Tensão [V]', 'Corrente [A]');

# plotando os gráficos da tensão e da corrente no domínio fasorial
figure(2);
plot([0 real(v_f)],[0 imag(v_f)], [0 real(i_f)],[0 imag(i_f)]);
title('Representação Fasorial da Tensão e da Corrente');
xlabel('Eixo Real'); ylabel('Eixo Imaginário'); grid on;
legend('Tensão [V]', 'Corrente [A]');
