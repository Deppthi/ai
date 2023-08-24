% Define students
student(john).
student(lisa).
student(michael).
student(emma).

% Define teachers
teacher(mr_smith).
teacher(ms_jones).
teacher(mr_doe).

% Define subjects and their corresponding codes
subject(math, m101).
subject(english, e201).
subject(physics, p301).
subject(history, h401).

% Define student-subject relationships
enrolled(john, math).
enrolled(john, physics).
enrolled(lisa, english).
enrolled(michael, history).
enrolled(emma, math).
enrolled(emma, history).

% Define teacher-subject relationships
teaches(mr_smith, math).
teaches(ms_jones, english).
teaches(ms_jones, physics).
teaches(mr_doe, history).

% Rule to find students enrolled in a subject
enrolled_students(Subject, Students) :-
    findall(Student, enrolled(Student, Subject), Students).

% Rule to find subjects taught by a teacher
taught_subjects(Teacher, Subjects) :-
    findall(Subject, teaches(Teacher, Subject), Subjects).

% Example queries:
% enrolled_students(math, Students).
% taught_subjects(ms_jones, Subjects).
