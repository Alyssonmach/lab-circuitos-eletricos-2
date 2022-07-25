% importando as tensões e correntes definidas
run('prep1_aula2.m');

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
