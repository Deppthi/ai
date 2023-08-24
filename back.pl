% Knowledge Base
% Animal hierarchy
is_a(dog, mammal).
is_a(cat, mammal).
is_a(mammal, animal).

% Predicates for inference
is_a(X, Y) :- is_a(X, Z), is_a(Z, Y).
is_a(X, X).

% Queries
query1 :- is_a(dog, animal).
query2 :- is_a(cat, animal).
query3 :- is_a(cat, mammal).

% Main goal
main :- query1, query2, query3, write('Queries are true.'), nl.
main :- write('Queries are not true.'), nl.

% Start by calling the main goal
:- main.
