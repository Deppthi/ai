% Define symptoms and their corresponding diseases
symptom(fever, cold).
symptom(cough, cold).
symptom(sneezing, cold).
symptom(headache, cold).
symptom(fever, flu).
symptom(cough, flu).
symptom(body_ache, flu).

% Rules to determine possible diseases
possible_disease(Symptoms, Disease) :-
    symptom(Symptom, Disease),
    member(Symptom, Symptoms).

% Medical diagnosis rule
diagnose(Symptoms, Disease) :-
    possible_disease(Symptoms, Disease),
    write('You may have '), write(Disease), write('.'), nl.

diagnose(_, unknown) :-
    write('Sorry, we cannot diagnose your condition.'), nl.

% Query examples
% To diagnose based on symptoms:
% ?- diagnose([fever, cough], Disease).
