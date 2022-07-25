run('../Aula 3/prep_aula3.m');

% análise quando as chaves 2 e 3 estão fechadas
printf("Carga Equivalente em Potência Complexa: %s\n", num2str(S23));
fp23 = real(S23) / abs(S23);
printf("Fator de Potência (Atrasada): %f\n", fp23);

printf('=== Modelo em Paralelo ===\n---\n');
ativo_paral = (abs(v)^2)/(S23_*fp23);
reativo_paral = (abs(v)^2)/(sqrt(S23_^2 - (S23_*fp23)^2));
printf('Parâmetro da Pot. Ativa: %f\n', ativo_paral);
printf('Parâmetro da Pot. Reativa: %f\n', reativo_paral);
printf('=== Modelo em Série ===\n---\n');
I = S23/v;
ativo_serie = (S23_*fp23)/abs(I)^2;
reativo_serie = (sqrt(S23_^2 - (S23_*fp23)^2))/abs(I)^2;
printf('Parâmetro da Pot. Ativa: %f\n', ativo_serie);
printf('Parâmetro da Pot. Reativa: %f\n', reativo_serie);
