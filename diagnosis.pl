% Define symptoms
symptom(fever).
symptom(cough).
symptom(headache).
symptom(sore_throat).
symptom(rash).

% Define diseases and their symptoms
disease(cold, [cough, sore_throat]).
disease(flu, [fever, cough, headache]).
disease(measles, [fever, rash, cough]).
disease(allergies, [sore_throat, cough]).

% Rule to check if a patient has a certain disease
has_disease(Patient, Disease) :-
    disease(Disease, Symptoms),
    has_symptoms(Patient, Symptoms).

% Rule to check if a patient has certain symptoms
has_symptoms(_, []).
has_symptoms(Patient, [Symptom|Rest]) :-
    symptom(Symptom),
    write('Does '), write(Patient), write(' have '), write(Symptom), write('? (yes/no): '), read(Response),
    Response = yes,
    has_symptoms(Patient, Rest).

% Rule to diagnose diseases for a patient
diagnose(Patient, Disease) :-
    has_disease(Patient, Disease),
    write('Diagnosis for '), write(Patient), write(': '), write(Disease), nl.
diagnose(Patient, 'Unknown') :-
    write('Diagnosis for '), write(Patient), write(': Unknown disease.'), nl.

% Main predicate to start diagnosis
start_diagnosis :-
    write('Enter patient name: '), read(Patient),
    diagnose(Patient, Disease).

% Query: start_diagnosis.
