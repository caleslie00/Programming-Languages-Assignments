verify :-
    writeln('Begin testing.'),
%    verify(fib1),
%    verify(fib2),
%    verify(gcd1),
%    verify(gcd2),
    verify(prime),   
    writeln('Testing complete.').

verify(P) :- 
    test(P), write('  PASS - '), writeln(P);
    not(test(P)), write('* FAIL - '), writeln(P).

getNumbers1(Zero,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten) :-
    Zero = zero, One = s(Zero), Two = s(One), Three = s(Two), Four = s(Three), Five = s(Four),
    Six = s(Five), Seven = s(Six), Eight = s(Seven), Nine = s(Eight), Ten = s(Nine).

test(fib1) :-
    getNumbers1(Zero,One,Two,Three,Four,Five,Six,_,Eight,Nine,_),
    fib(Zero,Zero),
    fib(One,One),
    fib(Two,One),
    fib(Three,Two),
    fib(Four,Three),
    fib(Five,Five),
    fib(Six,Eight),
    not(fib(One,Zero)),
    not(fib(Two,Two)),
    not(fib(Six,Three)),
    not(fib(Six,Six)),
    not(fib(Six,Nine)).

test(fib2) :-
    getNumbers1(_,One,_,_,_,Five,_,Seven,Eight,Nine,_),
    plus(Five,Eight,Thirteen),
    plus(Eight,Thirteen,Twentyone),
    plus(Thirteen,Twentyone,Thirtyfour),
    plus(Eight,Nine,Seventeen),
    plus(Seventeen,One,Eighteen),
    plus(Eighteen,One,Nineteen),
    times(Eight,Seventeen,Onethirtysix),
    times(Onethirtysix,Nineteen,Twentyfiveeightyfour),
    fib(Seven,Thirteen),
    fib(Eight,Twentyone),
    fib(Nine,Thirtyfour),
    fib(Eighteen,Twentyfiveeightyfour),
    not(fib(Seven,Eight)),
    not(fib(Seven,Twentyone)),
    not(fib(Eight,Thirteen)),
    not(fib(Seventeen,Twentyfiveeightyfour)),
    not(fib(Nineteen,Twentyfiveeightyfour)).

test(gcd1) :-
    getNumbers1(_,One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),
    gcd(Two,Three,One),
    gcd(Four,Six,Two),
    gcd(Four,Seven,One),
    gcd(Four,Eight,Four),
    gcd(Five,Eight,One),
    gcd(Six,Nine,Three),
    gcd(Eight,Ten,Two),
    gcd(Nine,Six,Three),
    gcd(Ten,Eight,Two),
    not(gcd(Eight,Ten,One)),
    not(gcd(Ten,Eight,One)),
    not(gcd(Four,Eight,Eight)).

test(gcd2) :-
    getNumbers1(_,One,Two,Three,Four,Five,Six,Seven,Eight,_,Ten),
    times(Three,Four,Twelve),
    times(Two,Ten,Twenty),
    times(Three,Eight,Twentyfour),
    times(Five,Six,Thirty),
    times(Five,Seven,Thirtyfive),
    times(Five,Eight,Forty),
    times(Six,Seven,Fortytwo),
    times(Six,Ten,Sixty),
    gcd(Twentyfour,Thirtyfive,One),
    gcd(Twentyfour,Fortytwo,Six),
    gcd(Thirty,Thirtyfive,Five),
    gcd(Forty,Thirty,Ten),
    gcd(Forty,Sixty,Twenty),
    gcd(Forty,Fortytwo,Two),
    gcd(Fortytwo,Twentyfour,Six),
    gcd(Sixty,Twentyfour,Twelve),
    not(gcd(Sixty,Twentyfour,Twentyfour)),
    not(gcd(Sixty,Thirty,Ten)),
    not(gcd(Ten,Sixty,Five)),
    not(gcd(Forty,Thirty,Twenty)).

test(prime) :-
    getNumbers1(_,_,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten),
    times(Three,Ten,Thirty), 
    plus(Thirty,One,ThirtyOne), 
    times(Six,Thirty,OneEighty), 
    plus(One,OneEighty,OneEightyOne),
    plus(Seven,OneEighty,OneEightySeven),
    prime(Two),
    prime(Three),
    not( prime(Four) ),
    prime(Five),
    not( prime(Six) ),
    prime(Seven),
    not( prime(Eight) ),
    not( prime(Nine) ),
    not( prime(Ten) ), 
    not( prime(Thirty) ),
    prime( ThirtyOne ), 
    prime(OneEightyOne),
    not( prime(OneEightySeven) ).

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
mod(X,Y,X) :- X \= Y, le(X,Y), nat(X).
mod(X,Y,Z) :- minus(X,Y,X1), mod(X1,Y,Z).

% even(X): X is even
even(X) :- nat(X), mod(X,s(s(zero)),zero).

% odd(X): X is odd
odd(X) :- nat(X), mod(X,s(s(zero)),s(zero)).

% times: X * Y = Z
times(zero,X,zero) :- nat(X).
times(s(X),Y,Z) :- le(s(X),Z), plus(XY,Y,Z), times(X,Y,XY).

% div(X,Y,Z): X/Y = Z, using integer division; do not allow division by zero
div(zero,X,zero).
div(X,s(Y),zero) :- le(X,Y).
div(X,Y,s(Z)) :- Y \= zero, minus(X,Y,NewX), div(NewX,Y,Z).

% exp(X,Y,Z): X^Y = Z (exponentiation)
exp(X,zero,s(zero)) :- nat(X).
exp(X,s(Y),Z) :- times(X,NewZ,Z), exp(X,Y,NewZ).

% factorial(N,F): F is N! (factorial)
factorial(zero,s(zero)).
factorial(s(zero),s(zero)).
factorial(s(N),F) :- times(s(N),NewF,F), factorial(N,NewF).

% Verification of NATURAL NUMBERS, part 3 %

%    fib(N,F): F is the Nth Fibonacci number [ e.g., fib(0,0), fib(s(0),s(0)), fib(s(s(0)),s(0)) ]
fib(zero,zero).
fib(s(zero),s(zero)).
fib(s(s(N)),F) :- nat(N),
                  fib(s(N),X),
                  fib(N,Y),
                  plus(X,Y,F).

%    gcd(X,Y,Z): Z is the greatest common divisor between X, Y
gcd(X,zero,X) :- nat(X).
gcd(X,Y,Z) :- Y \= zero, mod(X,Y,NewX), gcd(Y,NewX,Z).

%    prime(X): indicate whether or not X is a prime number

prime(s(s(zero))).
prime(s(X)) :- odd(s(X)), not((le(F,X), le(s(s(s(zero))),F), mod(s(X),F,zero))).

% ['C:/Users/cales/OneDrive/Desktop/CS/PL/Prolog/nat/verifynat3.pl'].