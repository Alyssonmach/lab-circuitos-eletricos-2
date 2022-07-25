% cargas equivalentes das cargas individuais
S01 = 5e3; fp01 = 0.6; % atrasado
S02 = 15e3; fp02 = 0.5; % atrasado
S03 = 10e3; fp03 = 0.9; % adiantado

% frequência e tensão rms
f = 60; v = 220;

% definindo as potências para a primeira carga
P1 = S01*fp01;
Q1 = S01*sin(acos(fp01)); % Q1 = sqrt(S01^2 - P1^2);
S1 = P1 + j*Q1;

% definindo as potências para a segunda cargas
P2 = S02*fp02;
Q2 = S02*sin(acos(fp02)); % Q2 = sqrt(S02^2 - P2^2);
S2 = P2 + j*Q2;

% definindo as potências para a terceira carga
P3 = S03*fp03;
Q3 = S03*sin(acos(fp03)); % Q3 = sqrt(S03^2 - P3^2);
S3 = P3 - j*Q3;

% definindo as combinações das cargas (forma de potência complexa)
S12 = S1 + S2;
S23 = S2 + S3;
S13 = S1 + S3;
S123 = S1 + S2 + S3;

% definindo a potência aparente e o fator de potência da combinação das cargas
S12_ = abs(S12); f12 = real(S12)/abs(S12);
S23_ = abs(S23); f23 = real(S23)/abs(S23);
S13_ = abs(S13); f13 = real(S13)/abs(S13);
S123_ = abs(S123); f123 = real(S123)/abs(S123);

% plotando o gráfico do triângulo das potências
%figure(1);
%plot([0 P1], [0 0], [P1 P1], [0 Q1], [0 P1], [0 Q1]); grid on;
%title('Gráfico do Triângulo das Potências');
%legend('Potência Ativa [W]', 'Potência Reativa [VAr]', ...
%       'Potência Aparente [VA]');
