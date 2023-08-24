% Define parent relationships
parent(john, mary).
parent(john, michael).
parent(mary, lisa).
parent(mary, david).
parent(michael, emma).
parent(michael, olivia).

% Define gender
male(john).
male(michael).
male(david).

female(mary).
female(lisa).
female(emma).
female(olivia).

% Define father and mother relationships
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

% Define sibling relationship
sibling(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.

% Define grandparent relationship
grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

% Define ancestor relationship
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
    parent(Parent, Descendant),
    ancestor(Ancestor, Parent).

% Example query: ancestor(john, emma).
