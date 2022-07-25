% Dados da Questão: Motor A = Linha 10 | Motor B: Linha 5 | Vn = 220

% primeira questão
Pmec50A = (0.50)*2206.5;
Rend50A = 0.77;
Pele50A = Pmec50A/Rend50A;

fp50A = 0.68;
modS50A = Pele50A/fp50A;
Q50A = sqrt(modS50A^2 - Pele50A^2);
S50A = Pele50A + j*Q50A;

Pmec75A = (0.75)*2206.5;
Rend75A = 0.81;
Pele75A = Pmec75A/Rend75A;

fp75A = 0.77;
modS75A = Pele75A/fp75A;
Q75A = sqrt(modS75A^2 - Pele75A^2);
S75A = Pele75A + j*Q75A;

Pmec100A = (1)*2206.5;
Rend100A = 0.815;
Pele100A = Pmec100A/Rend100A;

fp100A = 0.83;
modS100A = Pele100A/fp100A;
Q100A = sqrt(modS100A^2 - Pele100A^2);
S100A = Pele100A + j*Q100A;

printf('Motor A | Rendimento: 0.50 | Potência Reativa = %f [Var] \n', Q50A);
printf('Motor A | Rendimento: 0.75 | Potência Reativa = %f [Var] \n', Q75A);
printf('Motor A | Rendimento: 0.100 | Potência Reativa = %f [Var] \n', Q100A);

% segunda questão
fp50A_ = 0.95;
modS50A_ = Pele50A/fp50A_;
Q50A_ = sqrt(modS50A_^2 - Pele50A^2);

QcA = Q50A - Q50A_;
Vn = 220;
f = 60;
w = 2*pi*f;
Xc = Vn^2/QcA;
C = 1/(w*Xc);

printf('---\n');
printf('Valor do Capacitor para Correção de Potência: %f [F] \n', C);
printf('Potência Reativa Antes da Correção de Potência: %f [Var] \n', Q50A);
printf('Potência Reativa Depois da Correção de Potência: %f [Var] \n', Q50A_);

% terceira questão
Pmec50B = (0.50)*551.625;
Rend50B = 0.50;
Pele50B = Pmec50B/Rend50B;

fp50B = 0.48;
modS50B = Pele50B/fp50B;
Q50B = sqrt(modS50B^2 - Pele50B^2);
S50B = Pele50B + j*Q50B;

Pmec75B = (0.75)*551.625;
Rend75B = 0.58;
Pele75B = Pmec75B/Rend75B;

fp75B = 0.60;
modS75B = Pele75B/fp75B;
Q75B = sqrt(modS75B^2 - Pele75B^2);
S75B = Pele75B + j*Q75B;

Pmec100B = (1)*551.625;
Rend100B = 0.61;
Pele100B = Pmec100B/Rend100B;

fp100B = 0.69;
modS100B = Pele100B/fp100B;
Q100B = sqrt(modS100B^2 - Pele100B^2);
S100B = Pele100B + j*Q100B;

printf('---\n')
printf('Motor B | Rendimento: 0.50 | Potência Reativa = %f [Var] \n', Q50B);
printf('Motor B | Rendimento: 0.75 | Potência Reativa = %f [Var] \n', Q75B);
printf('Motor B | Rendimento: 0.100 | Potência Reativa = %f [Var] \n', Q100B);

% quarta questão
function calcula_fator_pot (SA, SB, Qcap)
  S = SA + SB; P = real(S); Q = imag(S);
  Q_ = Q - Qcap; S_ = P + j*(Q_);
  fp_sc = P/abs(S); fp_cc = P/abs(S_);

  printf('Fator de Potência sem o capacitor = %f F \n', fp_sc);
  printf('Fator de Potência com o capacitor = %f F \n', fp_cc);
endfunction

% quinta questão
% maior valor: Motor A: 100% | Motor B: 0%
% menor valor: Motor A: 50% | Motor b: 50%

% calculo para o caso do menor valor de fp
S = S50A + S50B; P = real(S); Q = imag(S);
Q_ = Q - QcA;

figure(1);
plot([0 Pele100A], [0 0], [Pele100A Pele100A], ...
     [0 (Q100A - QcA)], [0 Pele100A], [0 (Q100A - QcA)], ...
     [0 P], [0 0], [P P],...
     [0 Q_], [0 P], [0 Q_]); grid on;
title('[Maior Valor: Motor A: 100% | Motor B: 0%] [Menor Valor: Motor A: 50% | Motor B: 50%]');

% sexta questão

function p = pot_ativa (SA, SB)
  S = SA + SB;
  p = real(S);
  return

endfunction

figure(2)
bar([pot_ativa(S50A, 0)
     pot_ativa(S75A, 0)
     pot_ativa(S100A, 0)
     pot_ativa(S50A, S50B)
     pot_ativa(S75A, S50B)
     pot_ativa(S100A, S50B)
     pot_ativa(S50A, S75B)
     pot_ativa(S75A, S75B)
     pot_ativa(S100A, S75B)
     pot_ativa(S50A, S100B)
     pot_ativa(S75A, S100B)
     pot_ativa(S100A, S100B)]);
title('Gráfico das Potências Ativas');

xticklabel=["50%|0%";"75%|0%";"100%|0%";
            "50%|50%";"75%|50%";"100%|50%";
            "50%|75%";"75%|75%";"100%|75%";
            "50%|100%";"75%|100%";"100%|100%";];
set(gca,'xticklabel',xticklabel);
legend('Rend. Motor A | Rend. Motor B');


