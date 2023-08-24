% Predicate to solve the Towers of Hanoi puzzle
tower_of_hanoi(1, Source, _, Destination, _) :-
    write('Move disk 1 from '), write(Source), write(' to '), write(Destination), nl.
tower_of_hanoi(N, Source, Auxiliary, Destination, Temp) :-
    N > 1,
    N1 is N - 1,
    tower_of_hanoi(N1, Source, Destination, Auxiliary, Temp),
    write('Move disk '), write(N), write(' from '), write(Source), write(' to '), write(Destination), nl,
    tower_of_hanoi(N1, Auxiliary, Source, Destination, Temp).

% Example query:
% tower_of_hanoi(3, 'A', 'B', 'C', 'Temp').
