% Define fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(pear, green).
fruit_color(strawberry, red).

% Query to find the color of a fruit
color_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Query to find fruits of a certain color
fruits_of_color(Color, Fruits) :-
    findall(Fruit, fruit_color(Fruit, Color), Fruits).

% Example queries:
% color_of_fruit(apple, Color).
% fruits_of_color(red, RedFruits).
