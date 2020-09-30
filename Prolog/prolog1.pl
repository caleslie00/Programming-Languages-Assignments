director(chad).
administrator(edmond).
administrator(burt).
administrator(teresa).
team(giraffes).
team(camels).
coach(cordell,giraffes).
coach(wade,camels).
subscriber(eric).
subscriber(kathryn).
subscriber(mitch).
subscriber(cordell).

canUpdateTeamsPage(A, T) :- administrator(A), team(T).
canUpdateTeamsPage(D, T) :- director(D), team(T).
canUpdateTeamsPage(C, T) :- coach(C, T).
canReadTeamsPage(A, T) :- administrator(A), team(T).
canReadTeamsPage(D, T) :- director(D), team(T).
canReadTeamsPage(C, T) :- coach(C,Team).
canReadTeamsPage(S, T) :- subscriber(S), team(T).

%canUpdateTeamsPage(Role, giraffes).
%canReadTeamsPage(Person, giraffes).