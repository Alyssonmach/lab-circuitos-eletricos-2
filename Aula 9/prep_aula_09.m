% dados da questão
rf = 1; % razão da frequência (relacionando com os indutores e capacitores)
R1 = 5; X1 = rf*6; R2 = 2; Xc = -4/rf; X2 = rf*3; R3 = 4;
X12 = rf*1; E = 36*exp(j*30/180*pi);


% análise na malha 1
%E = R1*I1 + j*X1*I1 - j*X12*I2 + R2*(I1-I2);
%E = (R1 + j*X1 + R2)*I1 + (-j*X12 - R2)*I2;

% análise da malha 2
%0 = R2*(I2-I1) + j*X2*I2 - j*X12*I1 + j*Xc*I2 + R3*I2;
%0 = (-R2 - j*X12)*I1 + (R2 + j*X2 + j*Xc + R3);

% definindo a matriz A
A = [(R1 + j*X1 + R2) (-j*X12 - R2)
     (-R2 - j*X12) (R2 + j*X2 + j*Xc + R3)];
% definindo a matriz B
B = [E; 0];
% definindo a matrix X
X = inv(A)*B;

% calculando a relação de potência dos componententes com a fonte
I1 = X(1); I2 = X(2);
% S = V*I'

% análise da malha 1
SE = E*conj(I1);
SR1 = R1*I1*conj(I1);
SX1 = (j*X1*I1 - j*X12*I2)*conj(I1);
SR2 = R2*(I1-I2)*conj(I1-I2);

% análise da malha 2
SX2 = (j*X2*I2 - j*X12*I1)*conj(I2);
SXc = (j*Xc*I2)*conj(I2);
SR3 = R3*I2*conj(I2);

printf('Potência fornecida pela fonte: ');
SE
printf('Potência consumida pelos componentes: ');
soma_comp = SR1 + SX1 + SR2 + SX2 + SXc + SR3;
soma_comp
printf('Soma de todas as potências: ');
pot_total = SE - soma_comp;
pot_total
