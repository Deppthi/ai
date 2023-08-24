% Define actions and their costs
action(a, s, 5).
action(s, d, 2).
action(s, c, 3).
action(c, d, 2).

% Define heuristic values (estimated distances to goal)
heuristic(s, 3).
heuristic(c, 1).
heuristic(d, 0).

% Best First Search algorithm
best_first_search(CurrentState, Goal, Path, Cost) :-
    best_first_search_helper([(CurrentState, [])], Goal, Path, Cost).

% Base case: Reached the goal
best_first_search_helper([(Goal, Path)|_], Goal, Path, 0).

% Recursive case: Expand the next node based on heuristic
best_first_search_helper([(_, CurrentPath)|Rest], Goal, Path, Cost) :-
    expand(CurrentPath, NextPaths),
    add_heuristic(NextPaths, NextPathsHeuristic),
    sort(NextPathsHeuristic, SortedPaths),
    best_first_search_helper(Rest, Goal, Path, Cost),
    append(SortedPaths, Rest, UpdatedQueue),
    length(UpdatedQueue, Len),
    Len < 4.  % Limit the number of paths to avoid infinite loops

% Expand a path by applying possible actions
expand(Path, NewPaths) :-
    findall((NewState, [Action|Path]), apply_action(Path, Action, NewState), NewPaths).

% Apply an action to a path to get a new state
apply_action([CurrentState|Rest], Action, NewState) :-
    action(CurrentState, NewState, _),
    \+ member(NewState, Rest).

% Add heuristic values to paths
add_heuristic([], []).
add_heuristic([(State, Path)|Rest], [(State, Path, Heuristic)|UpdatedRest]) :-
    heuristic(State, Heuristic),
    add_heuristic(Rest, UpdatedRest).

% Example query:
% best_first_search(a, d, Path, Cost).
