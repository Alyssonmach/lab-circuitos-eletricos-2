fp = 0.95; % fator de potência
Vn = 9; % tensão nominal (controlada para simulações em lab)
f = 60; % frequência
Ls = 48e-3; % indutância fornecida da montagem em série


% dimensionamento com a corrente máxima do indutor
% I = 220e-3; % corrente máxima que o indutor suporta
% Sm = Vn*conj(I);
% S = Sm*exp(i*acos(fp));
% P = real(S);
% Q = imag(S);
% Rs = P/abs(I)^2;
% Xs = Q/abs(I)^2;
% Ls = Xs/(2*pi*f); % verificação do valor de Ls com base em Xs obtido

% outra forma de analisar a montagem do circuito em série sem depender de fp
%Ls = 48e-3;
%Xs = 2*pi*f*Ls;
%Q  = abs(I)^2*Xs;
%P = sqrt(Sm^2 - Q^2);
%Rs = P/abs(I)^2;

% dimensionamento com a potência máxima do resistor (1/2 W)
Pmax = 1/2;
Imax = Pmax/Vn;
Sm = Pmax/fp;
S = Sm*exp(i*acos(fp));
P = real(S);
Q = imag(S);

% análise do circuito em série
Ls = 48e-3;
Xs = 2*pi*f*Ls;
Q1 = abs(Imax)^2*Xs;
Rs = P/abs(Imax)^2;

% análise do circuito em paralelo
Rp = abs(Vn)^2/P;
Xp = abs(Vn)^2/Q;
Lp = Xp/(2*pi*f);

printf('Ls = %f H e Rs = %f Ohm \n', Ls, Rs);
printf('Lp = %f H e Rp = %f Ohm \n', Lp, Rp);

% compensação unitária do fator de potência
fp_uni = 1;
modS_ = P/fp_uni;
Q_ = sqrt(modS_^2 - P^2);

Qc = Q - Q_;
Xc = Vn^2/Qc;
C = 1/(2*pi*f*Xc);

printf('Compensação Unitária do Fator de Potência C = %f F \n', C);
