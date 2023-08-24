% Define people and their dates of birth (DOB)
dob(john, '1990-05-15').
dob(mary, '1985-10-20').
dob(michael, '2000-02-03').
dob(lisa, '1998-07-12').

% Query to retrieve a person's DOB
get_dob(Person, DOB) :-
    dob(Person, DOB).

% Query to retrieve all people born after a certain year
born_after_year(Person, Year) :-
    dob(Person, DOB),
    split_string(DOB, '-', '', [YearOfBirth|_]),
    number_string(YearOfBirthNum, YearOfBirth),
    YearOfBirthNum > Year.

% Query to retrieve all people born before a certain year
born_before_year(Person, Year) :-
    dob(Person, DOB),
    split_string(DOB, '-', '', [YearOfBirth|_]),
    number_string(YearOfBirthNum, YearOfBirth),
    YearOfBirthNum < Year.

% Example queries:
% get_dob(john, DOB).
% born_after_year(Person, 1995).
% born_before_year(Person, 1990).
