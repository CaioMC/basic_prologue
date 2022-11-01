nome(livia).
nome(fred).
nome(bolsonaro).
nome(lula).

temp(livia, 40).
temp(fred, 36).
temp(bolsonaro, 36).
temp(lula, 41).

frequencia_cardi(livia, 120).
frequencia_cardi(fred, 90).
frequencia_cardi(bolsonaro, 90).
frequencia_cardi(lula, 180).

frequencia_resp(livia, 35).
frequencia_resp(fred, 18).
frequencia_resp(bolsonaro, 20).
frequencia_resp(lula, 39).

sistolica(livia, 100).
sistolica(fred, 105).
sistolica(bolsonaro, 120).
sistolica(lula, 55).

sa_O2(livia, 100).
sa_O2(fred, 96).
sa_O2(bolsonaro, 97).
sa_O2(lula, 78).

dispneia(livia, "Nao").
dispneia(fred, "Nao").
dispneia(bolsonaro, "Nao").
dispneia(lula, "Nao").

idade_ind(livia, 55).
idade_ind(fred, 65).
idade_ind(bolsonaro, 59).
idade_ind(lula, 65).

quantidade_ind_comorbidade_inds(livia, 2).
quantidade_ind_comorbidade_inds(fred, 0).
quantidade_ind_comorbidade_inds(bolsonaro, 0).
quantidade_ind_comorbidade_inds(lula, 6).

caso_grave(P):-
    (frequencia_resp(P, FR), FR > 30);
    (sistolica(P, PS), PS < 90);
    (sa_O2(P, S02), S02 < 95);
    (dispneia(P, D), D = "Sim").

caso_medio(P):-
    (temp(P, T), T > 39);
    (sistolica(P, PS), PS >= 90, PS =< 100);
    (idade_ind(P, I), I >= 80);
    (quantidade_ind_comorbidade_inds(P, QC), QC >= 2).

caso_leve(P):-
    (temp(P, T), T >= 37, T =< 39);
    (frequencia_cardi(P, FC), FC > 100);
    (frequencia_resp(P, FR), FR >= 19, FR =< 30);
    (idade_ind(P, I), I >= 60, I =< 79);
    (quantidade_ind_comorbidade_inds(P, QC), QC = 1).

diagnostico_grave(P):-
    caso_grave(P),
    write("Caso Grave: deve ser encaminhado para o hospital").

diagnostico_medio(P):-
    caso_medio(P),
    write("Caso Medio: deve ficar em casa, em observacao por 14 dias.").

diagnostico_leve(P):-
    caso_leve(P),
    write("Caso Leve: deve ficar em casa, em observacao por 14 dias.").

testar_paciente(P) :-
    diagnostico_grave(P);
    diagnostico_medio(P);
    diagnostico_leve(P);
    write("Nenhuma alteracao clinica, paciente normal.").