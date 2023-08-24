% Define diseases
disease(hypertension).
disease(diabetes).
disease(celiac_disease).
disease(high_cholesterol).

% Define diet recommendations for diseases
diet(hypertension, 'Low-sodium diet: Avoid high-salt foods and processed foods. Eat fruits, vegetables, whole grains, and lean proteins.').
diet(diabetes, 'Carbohydrate-controlled diet: Monitor carbohydrate intake and choose complex carbs. Include lean proteins, healthy fats, and plenty of vegetables.').
diet(celiac_disease, 'Gluten-free diet: Avoid wheat, barley, and rye. Choose gluten-free grains, lean proteins, fruits, and vegetables.').
diet(high_cholesterol, 'Low-cholesterol diet: Limit saturated fats and trans fats. Include high-fiber foods, such as oats, beans, and nuts. Choose lean proteins and vegetables.').
diet(unknown_disease, 'Please consult a doctor for personalized diet recommendations based on your condition.').

% Rule to suggest a diet for a given disease
suggest_diet(Disease, Diet) :-
    disease(Disease),
    diet(Disease, Diet).

% Main predicate to start diet suggestion
start_suggest_diet :-
    write('Enter the disease: '), read(Disease),
    suggest_diet(Disease, Diet),
    write('Diet recommendation for '), write(Disease), write(': '), write(Diet), nl.

% Query: start_suggest_diet.
