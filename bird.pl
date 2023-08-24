% Define birds and whether they can fly
bird(sparrow, true).
bird(penguin, false).
bird(eagle, true).
bird(ostrich, false).

% Query to check if a bird can fly
can_fly(Bird) :-
    bird(Bird, true),
    write(Bird), write(' can fly.').
can_fly(Bird) :-
    bird(Bird, false),
    write(Bird), write(' cannot fly.').

% Example queries:
% can_fly(sparrow).
% can_fly(penguin).
