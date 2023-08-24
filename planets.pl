% Define planets and their properties
planet(mercury, rocky, small).
planet(venus, rocky, medium).
planet(earth, rocky, medium).
planet(mars, rocky, small).
planet(jupiter, gas_giant, large).
planet(saturn, gas_giant, large).
planet(uranus, ice_giant, medium).
planet(neptune, ice_giant, medium).

% Define planet moons
moon(earth, moon).
moon(mars, phobos).
moon(mars, deimos).
moon(jupiter, io).
moon(jupiter, europa).
moon(jupiter, ganymede).
moon(jupiter, callisto).
moon(saturn, titan).
moon(uranus, miranda).
moon(neptune, triton).

% Rule to find planets of a certain type
planets_of_type(Type, Planets) :-
    findall(Planet, planet(Planet, Type, _), Planets).

% Rule to find moons of a planet
moons_of_planet(Planet, Moons) :-
    findall(Moon, moon(Planet, Moon), Moons).

% Example queries:
% planets_of_type(rocky, RockyPlanets).
% moons_of_planet(jupiter, JupiterMoons).
