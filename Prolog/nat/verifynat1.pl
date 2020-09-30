% Verification of NATURAL NUMBERS, part 1 % 
%    minus(X,Y,Z): X-Y = Z, fail where Z is not a natural number (i.e., negative)
%    mod(X,Y,Z): X mod Y = Z (modulus)
%    even(X): X is even
%    odd(X): X is odd

verify :-
    writeln('Begin testing.'),
    verify(minus1),
    verify(minus2),
    verify(mod1),
    verify(mod2),
    verify(even1),
    verify(even2),
    verify(odd1),
    verify(odd2),   
    writeln('Testing complete.').

verify(P) :- 
    test(P), write('  PASS - '), writeln(P);
    not(test(P)), write('* FAIL - '), writeln(P).

getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten) :-
    Zero = zero, One = s(Zero), Two = s(One), Three = s(Two), Four = s(Three), Five = s(Four),
    Six = s(Five), Seven = s(Six), Eight = s(Seven), Nine = s(Eight), Ten = s(Nine).

test(minus1) :-
    getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,_,_),
    minus(Zero,Zero,Zero),
    minus(One,Zero,One),
    minus(One,One,Zero),
    minus(Two,One,One),
    minus(Three,One,Two),
    minus(Three,Two,One),
    minus(Four,Two,Two),
    minus(Five,Two,Three),
    minus(Five,Four,One),
    minus(Six,Four,Two),
    minus(Six,Six,Zero),
    minus(Seven,Three,Four),
    minus(Seven,Five,Two),
    minus(Eight,Two,Six),
    minus(Eight,Seven,One).


test(minus2) :-
    getNumbers1(Zero,One,Two,Three,Four,_,Six,Seven,Eight,Nine,Ten),
    minus(Nine,Zero,Nine),
    minus(Ten,Three,Seven),
    minus(Ten,Seven,Three),
    minus(Ten,Nine,One),
    not( minus(Zero,One,_) ),
    not( minus(Two,Eight,_) ),
    not( minus(Four,Six,_) ),
    not( minus(Six,Ten,_) ),
    not( minus(Eight,Nine,_) ).



test(mod1) :-
    getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),
    mod(Eighteen,One,Zero),
    mod(Eighteen,Two,Zero),
    mod(Eighteen,Three,Zero),
    mod(Eighteen,Four,Two),
    mod(Eighteen,Five,Three),
    mod(Eighteen,Six,Zero),
    mod(Eighteen,Seven,Four),
    mod(Eighteen,Eight,Two),
    mod(Eighteen,Nine,Zero),
    mod(Eighteen,Ten,Eight),
    mod(Thirty,Three,Zero),
    mod(Thirty,Four,Two),
    mod(Thirty,Five,Zero),
    mod(Thirty,Seven,Two),
    mod(Thirty,Eight,Six),
    mod(Thirty,Nine,Three),
    mod(Thirty,Ten,Zero).

test(mod2) :-
    getNumbers1(Zero,One,_,Three,_,_,_,Seven,Eight,_,Ten),
    plus(Ten,One,Eleven),
    mod(Three,Eleven,Three),
    mod(Eight,Eleven,Eight),
    mod(One,Fiftysix,One),
    mod(Eleven,Fiftysix,Eleven),
    mod(Eleven,Eleven,Zero),
    mod(Fiftysix,Eleven,One).

test(even1) :-
    getNumbers1(Zero,_,Two,_,Four,_,Six,_,Eight,_,Ten),
    even(Zero ),
    even(Two  ),
    even(Four ),
    even(Six  ),
    even(Eight),
    even(Ten  ).

test(even2) :-
    getNumbers1(_,One,_,Three,_,Five,_,Seven,_,Nine,_),
    not( even(One)   ),
    not( even(Three) ),
    not( even(Five)  ),
    not( even(Seven) ),
    not( even(Nine)  ).

test(odd1) :-
    getNumbers1(_,One,_,Three,_,Five,_,Seven,_,Nine,_),
    odd(One  ),
    odd(Three),
    odd(Five ),
    odd(Seven),
    odd(Nine ).

test(odd2) :-
    getNumbers1(Zero,_,Two,_,Four,_,Six,_,Eight,_,Ten),
    not( odd(Zero ) ),
    not( odd(Two  ) ),
    not( odd(Four ) ),
    not( odd(Six  ) ),
    not( odd(Eight) ),
    not( odd(Ten  ) ).

% Verification of NATURAL NUMBERS, part 2 % 
%    div(X,Y,Z): X/Y = Z, using integer division; do not allow division by zero
%    exp(X,Y,Z): X^Y = Z (exponentiation)
%    factorial(N,F): F is N! (factorial)


verify :-
    writeln('Begin testing.'),
    verify(div1),
    verify(div2),
    verify(exp1),
    verify(exp2),
    verify(factorial1),
    verify(factorial2),
    writeln('Testing complete.').

verify(P) :- 
    test(P), write('  PASS - '), writeln(P);
    not(test(P)), write('* FAIL - '), writeln(P).

getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten) :-
    Zero = zero, One = s(Zero), Two = s(One), Three = s(Two), Four = s(Three), Five = s(Four),
    Six = s(Five), Seven = s(Six), Eight = s(Seven), Nine = s(Eight), Ten = s(Nine).

test(div1) :-
    getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),
    div(Ten,Nine,One),
    div(Ten,Four,Two),
    div(Ten,Three,Three),
    div(Ten,Two,Five),
    div(Ten,One,Ten),
    not( div(Ten,Two,Four) ),
    not( div(Ten,Two,Six)  ),
    div(Eight,Nine,Zero),
    div(Eight,Eight,One),
    div(Eight,Seven,One),
    div(Eight,Three,Two),
    div(Seven,Five,One),
    div(Five,Seven,Zero),
    div(Five,Three,One),
    div(Five,Two,Two),
    div(Four,Two,Two),
    not( div(Three,Two,Two) ),
    div(Three,Two,One).


test(div2) :-
    getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),
    not( div(Three,Zero,_) ),
    not( div(Ten,Zero,_) ),
    div(Zero,One,Zero),
    div(Zero,Eight,Zero),
    div(One,Eight,Zero),
    div(Six,Five,One),
    div(Nine,Four,Two),
    div(Seven,Four,One),
    not( div(Seven,Four,Two) ).    

test(exp1) :-
    getNumbers1(Zero,One,Two,Three,Four,Five,_,Seven,Eight,Nine,Ten),
    exp(One,Zero,One),
    exp(One,Five,One),
    exp(Two,One,Two),
    exp(Two,Two,Four),
    exp(Two,Three,Eight),
    exp(Three,Two,Nine),
    exp(Seven,Zero,One),
    exp(Seven,One,Seven),
    exp(Eight,Zero,One),
    not(exp(One,Two,Two)),
    not(exp(Two,Two,Two)),
    not(exp(Two,Two,Eight)),
    not(exp(Seven,Two,Ten)).

test(exp2) :-
    getNumbers1(_,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,_),
    times(Eight,Two,Sixteen),
    times(Five,Five,Twentyfive),
    times(Six,Six,Thirtysix),
    times(Eight,Eight,Sixtyfour),
    times(Nine,Nine,Eightyone),
    times(Five,Twentyfive,Onetwentyfive),
    times(Sixteen,Eight,Onetwentyeight),
    exp(Two,Four,Sixteen),
    exp(Two,Six,Sixtyfour),
    exp(Two,Seven,Onetwentyeight),
    exp(Three,Four,Eightyone),
    exp(Four,Two,Sixteen),
    exp(Four,Three,Sixtyfour),
    exp(Five,One,Five),
    exp(Five,Two,Twentyfive),
    exp(Five,Three,Onetwentyfive),
    exp(Eight,Two,Sixtyfour),
    exp(Nine,Two,Eightyone),
    not(exp(Three,Three,Eightyone)),
    not(exp(Four,Three,Sixteen)),
    not(exp(Seven,Two,Thirtysix)).

test(factorial1) :-
    getNumbers1(Zero,One,Two,Three,_,_,Six,Seven,_,_,_),
    factorial(Zero,One),
    factorial(One,One),
    factorial(Two,Two),
    factorial(Three,Six),
    not( factorial(Two,Six) ), 
    not( factorial(Three,Seven) ).

test(factorial2) :-
    getNumbers1(_,_,_,_,Four,Five,Six,_,_,_,_),
    times(Six,Four,Twentyfour),
    times(Twentyfour,Five,Onetwenty),
    times(Onetwenty,Six,Seventwenty),
    factorial(Four,Twentyfour),
    factorial(Five,Onetwenty),
    factorial(Six,Seventwenty),
    not( factorial(Five,Seventwenty) ),
    not( factorial(Six,Onetwenty) ).

% Natural numbers
nat(zero).
nat(s(X)) :- nat(X).

% Less than or equal
le(zero,X) :- nat(X).
le(s(X),s(Y)) :- le(X,Y).

% plus(X,Y,Z) => nat numbers such that X+Y=Z
plus(zero,Y,Y) :- nat(Y).
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).

% minus(X,Y,Z) => X-Y = Z
minus(X,zero,X) :- nat(X).
minus(s(X),s(Y),Z) :- minus(X,Y,Z).

% mod(X,Y,Z): X mod Y = Z (modulus)
mod(X, X, zero) :- nat(X).
mod(X,Y,X) :- le(X,Y), nat(X).
mod(X,Y,Z) :- minus(X,Y,X1), mod(X1,Y,Z).

% even(X): X is even
even(X) :- nat(X), mod(X,s(s(zero)),zero).

% odd(X): X is odd
odd(X) :- nat(X), mod(X,s(s(zero)),s(zero)).

% times: X * Y = Z
times(zero,X,zero) :- nat(X).
times(s(X),Y,Z) :- le(s(X),Z), plus(XY,Y,Z), times(X,Y,XY).

% div(X,Y,Z): X/Y = Z, using integer division; do not allow division by zero
div(X,zero,Y) :- nat(fail).
div(X,X,s(zero)) :- nat(X).
div(X,Y,s(Z)) :- le(Y,X), minus(X,Y,NewX), div(NewX,Y,Z).
% div(X,Y,zero) :- nat(X).

% exp(X,Y,Z): X^Y = Z (exponentiation)
exp(X,zero,s(zero)) :- nat(X).
exp(X,s(Y),Z) :- times(X,NewZ,Z), exp(X,Y,NewZ).

% factorial(N,F): F is N! (factorial)
factorial(zero,s(zero)).
factorial(s(zero),s(zero)).
factorial(s(N),F) :- factorial(N,NewF), times(s(N),NewF,F).