% VERIFICATION FOR PATH-FINDING ASSIGNMENT

% GRAPHS FOR TESTING PROG.LANG. PATH-FINDING ASSIGNMENT %

% SMALLEST POSSIBLE GRAPH
path( a1, a2, 1).

% LINEAR GRAPH
path( b1, b2, 1).
path( b2, b3, 2).
path( b3, b4, 3).
path( b4, b5, 5).

% CIRCULAR LINEAR GRAPH
path( c1, c2, 1).
path( c2, c3, 5).
path( c3, c4, 7).
path( c4, c1, 9).

% X
path( d3, d1, 1).
path( d3, d2, 1).
path( d3, d4, 1).
path( d3, d5, 1).


% SAMPLE
path( e1, e2,  8).
path( e1, e3, 10).
path( e2, e3,  5).
path( e2, e5, 12).
path( e3, e4,  4).
path( e4, e5,  2).

% COMPLETE (4 nodes)
path( f1, f2,  2).
path( f1, f3,  5).
path( f1, f4,  9).
path( f2, f3, 15).
path( f2, f4, 27).
path( f3, f4, 37).

% WHEEL
path( g1, g2, 11).
path( g2, g3, 15).
path( g3, g4, 29).
path( g4, g5, 35).
path( g5, g1, 41).
path( g6, g1,  3).
path( g6, g2,  3).
path( g6, g3,  3).
path( g6, g4,  3).
path( g6, g5,  3).

% INCOMPLETE
path( h1, h2,  5).
path( h2, h3, 11).
path( h3, h1, 18).
path( h4, h5,  4).
path( h5, h6,  9).
path( h6, h4, 15).

% TREE
path(  i1,  i2,  2).
path(  i1,  i3,  3).
path(  i2,  i4,  4).
path(  i2,  i5,  5).
path(  i3,  i6,  6).
path(  i3,  i7,  7).
path(  i4,  i8,  8).
path(  i4,  i9,  9).
path(  i5, i10, 10).
path(  i5, i11, 11).
path(  i6, i12, 12).
path(  i6, i13, 13).
path(  i7, i14, 14).
path(  i7, i15, 15).
path(  i8, i16, 16).
path( i16, i33, 33).

% RANDOM (LARGER THAN SAMPLE)
path( j1, j3, 10).
path( j2, j3,  8).
path( j2, j9, 23).
path( j3, j5,  9).
path( j3, j6, 13).
path( j4, j6,  7).
path( j4, j7, 19).
path( j4, j8, 22).
path( j5, j7, 15).
path( j6, j8, 18).
path( j7, j8,  4).
path( j7, j9, 29).

verify :-
    writeln('Begin testing.'),
    verify(smallest,S1),
    verify(linear,S2),
    verify(circular,S3),
    verify(x,S4),
    verify(sample,S5),
    verify(complete,S6),
    verify(wheel,S7),
    verify(incomplete,S8),
    verify(tree,S9),
    verify(random,S10),
    Score is S1+S2+S3+S4+S5+S6+S7+S8+S9+S10,
    writeln('Testing complete.'),
    write(Score), writeln(' out of 10 graphs tested successfully.').

verify(P,S) :- 
    test(P), S is 1, write('  PASS - '), writeln(P);
    not(test(P)), S is 0, write('* FAIL - '), writeln(P).

% member(X,[X|_]).
% member(X,[_|Ys]) :- member(X,Ys).

unique([]).
unique([X|Xs]) :- not(member(X,Xs)), unique(Xs).

test(smallest) :-
    solve(a1,a2,[a1,a2],1),
    solve(a2,a1,[a2,a1],1),
    not((solve(a1,a2,_,Dist),Dist\=1)).

test(linear) :-
    solve(b1,b3,[b1,b2,b3],3),
    solve(b1,b4,[b1,b2,b3,b4],6),
    solve(b1,b5,[b1,b2,b3,b4,b5],11),
    solve(b5,b1,[b5,b4,b3,b2,b1],11),
    solve(b4,b2,[b4,b3,b2],5),
    not((solve(b2,b4,_,Dist1),Dist1\=5)),
    not((solve(b1,b5,_,Dist2),Dist2\=11)),
    not((solve(b3,_,P,_),not(unique(P)))).

test(circular) :- 
    solve(c1,c4,[c1,c2,c3,c4],13),
    solve(c1,c4,[c1,c4],9),
    solve(c2,c3,[c2,c3],5),
    solve(c2,c3,[c2,c1,c4,c3],17),
    not((solve(c3,_,P,_),not(unique(P)))).

test(x) :-
    solve(d4,d1,[d4,d3,d1],2),
    solve(d4,d2,[d4,d3,d2],2),
    solve(d4,d3,[d4,d3],1),
    solve(d4,d5,[d4,d3,d5],2),
    not((solve(d2,_,P1,_),not(member(d3,P1)))),
    not((solve(d3,_,_,Len2),Len2\=1)),
    not((solve(d5,_,P3,_),not(unique(P3)))).

test(sample) :-
    solve(e1,e5,[e1,e2,e3,e4,e5],19),
    solve(e1,e5,[e1,e2,e5],20),
    solve(e1,e5,[e1,e3,e4,e5],16),
    solve(e1,e5,[e1,e3,e2,e5],27),
    not((solve(e1,e5,_,Dist),not(member(Dist,[16,19,20,27])))).

test(complete) :-
    % source from f1
    solve(f1,f2,[f1,f2],2),
    solve(f1,f2,[f1,f3,f2],20),
    solve(f1,f2,[f1,f3,f4,f2],69),
    solve(f1,f2,[f1,f4,f2],36),
    solve(f1,f2,[f1,f4,f3,f2],61),
    not((solve(f1,f2,_,A),not(member(A,[2,20,36,61,69])))),
    solve(f1,f3,[f1,f3],5),
    solve(f1,f3,[f1,f2,f3],17),
    solve(f1,f3,[f1,f2,f4,f3],66),
    solve(f1,f3,[f1,f4,f3],46),
    solve(f1,f3,[f1,f4,f2,f3],51),
    not((solve(f1,f3,_,B),not(member(B,[5,17,46,51,66])))),
    solve(f1,f4,[f1,f4],9),
    solve(f1,f4,[f1,f2,f4],29),
    solve(f1,f4,[f1,f2,f3,f4],54),
    solve(f1,f4,[f1,f3,f4],42),
    solve(f1,f4,[f1,f3,f2,f4],47),
    not((solve(f1,f4,_,C),not(member(C,[9,29,42,47,54])))),
    % source from f2
    solve(f2,f1,[f2,f1],2),
    solve(f2,f1,[f2,f3,f1],20),
    solve(f2,f1,[f2,f3,f4,f1],61),
    solve(f2,f1,[f2,f4,f1],36),
    solve(f2,f1,[f2,f4,f3,f1],69),
    not((solve(f2,f1,_,D),not(member(D,[2,20,36,61,69])))),
    solve(f2,f3,[f2,f3],15),
    solve(f2,f3,[f2,f1,f3],7),
    solve(f2,f3,[f2,f1,f4,f3],48),
    solve(f2,f3,[f2,f4,f3],64),
    solve(f2,f3,[f2,f4,f1,f3],41),
    not((solve(f2,f3,_,E),not(member(E,[7,15,41,48,64])))),
    solve(f2,f4,[f2,f4],27),
    solve(f2,f4,[f2,f1,f4],11),
    solve(f2,f4,[f2,f1,f3,f4],44),
    solve(f2,f4,[f2,f3,f4],52),
    solve(f2,f4,[f2,f3,f1,f4],29),
    not((solve(f2,f4,_,F),not(member(F,[11,27,29,44,52])))),
    % source from f3
    solve(f3,f1,[f3,f1],5),
    solve(f3,f1,[f3,f2,f1],17),
    solve(f3,f1,[f3,f2,f4,f1],51),
    solve(f3,f1,[f3,f4,f1],46),
    solve(f3,f1,[f3,f4,f2,f1],66),
    not((solve(f3,f1,_,G),not(member(G,[5,17,46,51,66])))),
    solve(f3,f2,[f3,f2],15),
    solve(f3,f2,[f3,f1,f2],7),
    solve(f3,f2,[f3,f1,f4,f2],41),
    solve(f3,f2,[f3,f4,f2],64),
    solve(f3,f2,[f3,f4,f1,f2],48),
    not((solve(f3,f2,_,H),not(member(H,[7,15,41,48,64])))),
    solve(f3,f4,[f3,f4],37),
    solve(f3,f4,[f3,f1,f4],14),
    solve(f3,f4,[f3,f1,f2,f4],34),
    solve(f3,f4,[f3,f2,f4],42),
    solve(f3,f4,[f3,f2,f1,f4],26),
    not((solve(f3,f4,_,I),not(member(I,[14,26,34,37,42])))),
    % source from f4
    solve(f4,f1,[f4,f1],9),
    solve(f4,f1,[f4,f2,f1],29),
    solve(f4,f1,[f4,f2,f3,f1],47),
    solve(f4,f1,[f4,f3,f1],42),
    solve(f4,f1,[f4,f3,f2,f1],54),
    not((solve(f4,f1,_,J),not(member(J,[9,29,42,47,54])))),
    solve(f4,f2,[f4,f2],27),
    solve(f4,f2,[f4,f1,f2],11),
    solve(f4,f2,[f4,f1,f3,f2],29),
    solve(f4,f2,[f4,f3,f2],52),
    solve(f4,f2,[f4,f3,f1,f2],44),
    not((solve(f4,f2,_,K),not(member(K,[11,27,29,44,52])))),
    solve(f4,f3,[f4,f3],37),
    solve(f4,f3,[f4,f1,f3],14),
    solve(f4,f3,[f4,f1,f2,f3],26),
    solve(f4,f3,[f4,f2,f3],42),
    solve(f4,f3,[f4,f2,f1,f3],34),
    not((solve(f4,f3,_,L),not(member(L,[14,26,34,37,42])))).

test(wheel) :-
    solve(g2,g6,[g2,g6],3),
    solve(g2,g6,[g2,g3,g6],18),
    solve(g2,g6,[g2,g3,g4,g6],47),
    solve(g2,g6,[g2,g3,g4,g5,g6],82),
    solve(g2,g6,[g2,g3,g4,g5,g1,g6],123),
    solve(g2,g6,[g2,g1,g6],14),
    solve(g2,g6,[g2,g1,g5,g6],55),
    solve(g2,g6,[g2,g1,g5,g4,g6],90),
    solve(g2,g6,[g2,g1,g5,g4,g3,g6],119).

test(incomplete) :-
    solve(h1,h3,[h1,h3],18),
    solve(h1,h3,[h1,h2,h3],16),
    not(solve(h1,h4,_,_)),
    not(solve(h3,h5,_,_)),
    solve(h5,h4,[h5,h4],4),
    solve(h5,h4,[h5,h6,h4],24),
    not(solve(h6,h2,_,_)).

test(tree) :-
    solve(i1,i33,[i1,i2,i4,i8,i16,i33],63),
    not((solve(i1,i33,_,N1),N1\=63)),
    solve(i3,i5,[i3,i1,i2,i5],10),
    solve(i2,i5,[i2,i5],5),
    not((solve(i2,i5,_,N2),N2\=5)),
    solve(i7,i4,[i7,i3,i1,i2,i4],16),
    not((solve(i7,i4,_,N3),N3\=16)),
    not((solve(i7,i4,P3,_),P3\=[i7,i3,i1,i2,i4])).

test(random) :-
    solve(j6,j9,[j6,j8,j4,j7,j9],88),
    solve(j6,j9,[j6,j8,j4,j7,j5,j3,j2,j9],114),
    solve(j6,j9,[j6,j8,j7,j9],51),
    solve(j6,j9,[j6,j8,j7,j5,j3,j2,j9],77),
    solve(j6,j9,[j6,j3,j5,j7,j9],66),
    solve(j6,j9,[j6,j3,j2,j9],44),
    solve(j6,j9,[j6,j4,j7,j9],55),
    solve(j6,j9,[j6,j4,j7,j5,j3,j2,j9],81),
    solve(j6,j9,[j6,j4,j8,j7,j9],62),
    solve(j6,j9,[j6,j4,j8,j7,j5,j3,j2,j9],88),
    not((solve(j3,j1,P,_),P\=[j3,j1])).

edge(X,Y,D) :- path(X,Y,D).
edge(X,Y,D) :- path(Y,X,D).

length([],0).
length([_|T],N) :- length(T,K), N is K + 1.

member(X,[X|_]).
member(X,[_|Ys]) :- member(X,Ys).

findPath(S,S,P,CP) :- P = [S|CP].
findPath(S,F,P,CP) :- edge(F,A,_), not(member(A,CP)), findPath(S,A,NewP,[F|CP]), P = NewP.

sumDistance([H],D) :- D is 0.
sumDistance(P,D) :- P = [H,X|T], edge(H,X,Num), sumDistance([X|T],NewD), D is NewD + Num.

solve(S,F,P,D) :- findPath(S,F,P,[]), length(P, L), L > 1, sumDistance(P, D).

% ['C:/Users/cales/OneDrive/Desktop/CS/PL/Prolog/pathfinding.pl'].