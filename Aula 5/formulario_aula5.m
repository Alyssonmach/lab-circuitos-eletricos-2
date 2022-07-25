% dados da questão
Sm = 2e3; % 2k Va
fp = 0.95; % 0.95
Vn = 220; % 220 rms
f = 60;

% calculo da potência complexa, ativa e reativa
S = Sm*exp(i*acos(fp));
P = real(S);
Q = imag(S);

% analisando no modelo de cargas em série
I = S/Vn;
V = Vn*exp(i*0);
Rs = P/abs(I)^2;
Xs = Q/abs(I)^2;
Ls = Xs/(2*pi*f); % encontrar a indutância
printf('Carga em série, \n R = %f Ohm e L = %f H\n', Rs, Ls);

% analisando no modelo de cargas em paralelo
Rp = (Vn)^2/P;
Xp = (Vn)^2/Q;
Lp = Xp/(2*pi*f); % encontrar a indutância
printf('Carga em paralelo, \n R = %f Ohm e L = %f H\n', Rp, Lp);

printf('Carga Complexa [VA]:');
S
printf('Potência Aparente [W]:');
abs(S)
printf('Potência Ativa [VA]');
P
printf('Potência Reativa [Var]:');
Q

% plotando o gráfico do triângulo das potências
figure(1);
plot([0 P], [0 0], [P P], [0 Q], [0 P], [0 Q]); grid on;
title('Gráfico do Triângulo das Potências');
legend('Potência Ativa [VA]', 'Potência Reativa [VAr]', ...
       'Potência Aparente [W]');

figure(2);
plot([0 real(I')],[0 imag(I')], [0 real(V)],[0 imag(V)]);
title('Representação Fasorial das Correntes');
xlabel('Real [A]'); ylabel('Imag [A]'); grid on;
legend('Corrente I [A]', 'Tensão [V]');
