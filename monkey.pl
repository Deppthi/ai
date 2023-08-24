% Define actions
action(climb).
action(push).
action(walk).
action(grasp).

% Define state representation: state(MonkeyPos, MonkeyHasBanana, MonkeyOnChair, BananaPos, ChairPos)
initial_state(state(floor, no, center, ceiling, center)).
final_state(state(_, yes, _, _, _)).

% Define the conditions for valid actions
valid_action(state(MonkeyPos, MonkeyHasBanana, MonkeyOnChair, BananaPos, ChairPos), climb) :-
    MonkeyPos = chair,
    MonkeyOnChair = center,
    ChairPos = center.
valid_action(state(MonkeyPos, MonkeyHasBanana, _, BananaPos, _), grasp) :-
    MonkeyPos = BananaPos,
    MonkeyHasBanana = no.
valid_action(state(MonkeyPos, _, MonkeyOnChair, BananaPos, ChairPos), push) :-
    MonkeyPos = chair,
    MonkeyOnChair = center,
    (MonkeyPos = BananaPos ; ChairPos = BananaPos).
valid_action(state(MonkeyPos, _, MonkeyOnChair, BananaPos, ChairPos), walk) :-
    MonkeyPos \= center,
    MonkeyPos \= BananaPos,
    MonkeyPos \= ChairPos.

% Apply an action to a state to get a new state
apply_action(state(MonkeyPos, MonkeyHasBanana, MonkeyOnChair, BananaPos, ChairPos), Action, NewState) :-
    valid_action(state(MonkeyPos, MonkeyHasBanana, MonkeyOnChair, BananaPos, ChairPos), Action),
    (
        Action = climb,
        NewState = state(on_chair, MonkeyHasBanana, on_chair, BananaPos, ChairPos)
    ;
        Action = push,
        NewState = state(BananaPos, MonkeyHasBanana, center, BananaPos, MonkeyPos)
    ;
        Action = walk,
        (
            MonkeyPos = floor,
            NewMonkeyPos = ceiling
        ;
            MonkeyPos = ceiling,
            NewMonkeyPos = floor
        ),
        NewState = state(NewMonkeyPos, MonkeyHasBanana, MonkeyOnChair, BananaPos, ChairPos)
    ;
        Action = grasp,
        NewState = state(MonkeyPos, yes, MonkeyOnChair, BananaPos, ChairPos)
    ).

% Solve the problem using depth-first search
solve(State, _, []) :-
    final_state(State).
solve(State, Visited, [Action|Path]) :-
    \+ member(State, Visited),  % Avoid revisiting the same state
    apply_action(State, Action, NewState),
    solve(NewState, [State|Visited], Path).

% Example query:
% solve(state(floor, no, center, ceiling, center), [], Path).
