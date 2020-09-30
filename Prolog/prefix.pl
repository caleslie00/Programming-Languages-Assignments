length([],0).
length([_|T],N) :- length(T,K), N is K + 1.

member(X,[X|_]).
member(X,[_|T]) :-member(X,T).

last([V],V). 
last([_|T],V) :- last(T,V).

% prefix( A, B ) - valid when list A is a prefix of list B
prefix(A,B) :- A = [].
prefix(A,B) :- A = [HA|TA], B = [HB|TB], HA = HB, prefix(TA,TB).

% suffix( A, B ) - valid when list A is a suffix of list B
suffix(A,B) :- A = [], B = [].
suffix(A,B) :- length(A,M) = length(B,M), A = [HA|TA], B = [HB|TB], HA = HB, prefix(TA,TB).
suffix(A,B) :- B = [HB|TB], suffix(A,TB).

% sublist( A, B ) - valid when list A is a sublist of list B
sublist(A,B) :- A = [].
sublist(A,B) :- A = [HA|TA], B = [HB|TB], HA = HB, prefix(TA,TB).
sublist(A,B) :- B = [HB|TB], sublist(A,TB).