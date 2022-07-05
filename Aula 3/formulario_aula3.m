# dados fornecidos na questão
fase = -20; vrms = 127; irms = 10;

# definindo a tensão e a corrente no domínio fasorial
v_f = vrms * exp(i*(0/180)*pi);
i_f_conjugado = irms*exp(-i*((fase/180)*pi));

# calculando da potência aparente
S = v_f *i_f_conjugado;
# calculando a potência ativa e potência reativa
P = real(S); Q = imag(S);

# plotando o gráfico do triângulo das potências
figure(1);
plot([0 P], [0 0], [P P], [0 Q], [0 P], [0 Q]); grid on;
title('Gráfico do Triângulo das Potências');
legend('Potência Ativa [W]', 'Potência Reativa [VAr]', ...
       'Potência Aparente [VA]');
