root(v50).
hasLeftChild(v50,v20).
hasRightChild(v50,v70).
hasLeftChild(v20,v10).
hasRightChild(v20,v40).
hasLeftChild(v40,v30).
hasLeftChild(v70,v60).
hasRightChild(v70,v80).
hasRightChild(v80,v90).

isParentOf(Parent,Child) :- hasLeftChild(Parent, Child).
isParentOf(Parent,Child) :- hasRightChild(Parent, Child).
siblings(A,B) :- isParentOf(Parent, A), isParentOf(Parent, B).
isAncestorOf(Ancestor,Descendant) :- isParentOf(Ancestor, Descendant).
isAncestorOf(Ancestor,Descendant) :- isParentOf(Ancestor, ExtendedDescendant), isParentOf(ExtendedDescendant, Descendant).
isGreaterThan(A,B) :- hasRightChild(B,A).
isGreaterThan(A,B) :- hasRightChild(B,Filler), hasRightChild(Filler,A).
isGreaterThan(A,B) :- hasRightChild(B,Filler), hasLeftChild(Filler,A).