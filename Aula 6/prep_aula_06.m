Pmec75 = (0.75)*183.875;
Rend75 = 0.43; # Rend = Pmec/Pele -> Rend = 0.36 ou 36%
Pele75 = Pmec75/Rend75;

fp75 = 0.56; # fp = P/modS
modS75 = Pele75/fp75;
Q75 = sqrt(modS75^2 - Pele75^2);
S75 = Pele75 + j*Q75;

figure(1);
plot([0 Pele75], [0 0], [Pele75 Pele75],...
     [0 Q75], [0 Pele75], [0 Q75]); grid on;

# compensação do fator de potência
fp75_ = 0.95;
modS75_ = Pele75/fp75_;
Q75_ = sqrt(modS75_^2 - Pele75^2);

Qc = Q75 - Q75_;
#V = R*I;
#P = R*I^2 = V^2/R;
Vn = 220;
f = 60;
w = 2*pi*f;
# Qc = Vn^2/Xc;
Xc = Vn^2/Qc;
% Xc = 1/(w*C);
C = 1/(w*Xc);


figure(2);
plot(# triângulo das potências antes da correção
     [0 Pele75], [0 0], [Pele75 Pele75],...
     [0 Q75], [0 Pele75], [0 Q75], ...
     # triângulo das potências depois da correção
     [0 Pele75], [0 0], [Pele75 Pele75],...
     [0 Q75_], [0 Pele75], [0 Q75_]); grid on;

# análise para operação com 100% da carga (carga nominal)
Pmec100 = (1)*183.875;
Rend100 = 0.46; # Rend = Pmec/Pele -> Rend = 0.36 ou 36%
Pele100 = Pmec100/Rend100;

fp100 = 0.62; # fp = P/modS
modS100 = Pele100/fp100;
Q100 = sqrt(modS100^2 - Pele100^2);
S100 = Pele100 + j*Q100;

figure(3);
plot([0 Pele100], [0 0], [Pele100 Pele100],...
     [0 Q100], [0 Pele100], [0 Q100]); grid on;

# análise após compensação com o capacitor disponível (c75)
# aplicado ao motor com rendimento de 100%

Q100_ = Q100 - Qc;
S100_ = Pele100 + j*(Q100_);

# novo fator de potência para o motor com rend. de 100%
fp_ = Pele100/abs(S100_);

figure(4);
plot(# triângulo das potências antes da correção
     [0 Pele100], [0 0], [Pele100 Pele100],...
     [0 Q100], [0 Pele100], [0 Q100], ...
     # triângulo das potências depois da correção
     [0 Pele100], [0 0], [Pele100 Pele100],...
     [0 Q100_], [0 Pele100], [0 Q100_]); grid on;
