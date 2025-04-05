% Facts
male(john).
male(paul).
male(mike).
female(susan).
female(anna).
female(lisa).

parent(john, paul).
parent(susan, paul).
parent(john, anna).
parent(susan, anna).
parent(paul, mike).
parent(lisa, mike).

% Rules
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandfather(X, Y) :- male(X), grandparent(X, Y).
grandmother(X, Y) :- female(X), grandparent(X, Y).


% OUTPUT
% Basic queries to ask
/*- male(paul).
true.

?- female(john).
false.
?- parent(john, paul).
true.

?- parent(X, anna).
X = john ;
X = susan.


?- sibling(paul, anna).
true.

?- sibling(X, anna).
X = paul ;
false.*/
