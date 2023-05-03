% Programming Exercise 5: Programming in Logic 1
% by Meekah Yzabelle A. Carballo and Khublei Mo Satori Pelayo

% Facts.
% Facts - Male Family Members.
male(teodorico).
male(alfonso).
male(silver).
male(samuel).
male(leopoldo).
male(rene).
male(owen).
male(orlandez).
male(oliver).
male(theodore).
male(nikko).
male(ralph).
male(orly).
male(john).
male(doyle).
male(axl).

% Facts - Female Family Members.
female(mercedes).
female(josefina).
female(casimera).
female(catalina).
female(filomena).
female(isabel).
female(teodosia).
female(jeniffer).
female(leigh).
female(lady).
female(meekah).
female(kezia).
female(frezzy).
female(zyrah).

% Facts - Grandparent Relationships, X is the grandparent of Y.
% 4th Level.
grandparent(alfonso, meekah).
grandparent(alfonso, kezia).
grandparent(alfonso, doyle).
grandparent(alfonso, frezzy).
grandparent(alfonso, zyrah).
grandparent(alfonso, axl).

grandparent(josefina, meekah).
grandparent(josefina, kezia).
grandparent(josefina, doyle).
grandparent(josefina, frezzy).
grandparent(josefina, zyrah).
grandparent(josefina, axl).

% Facts - Grandparent Relationships, X is the grandparent of Y.
% 3rd Level.
grandparent(mercedes, jeniffer).
grandparent(mercedes, owen).
grandparent(mercedes, orlandez).
grandparent(mercedes, oliver).
grandparent(mercedes, lady).
grandparent(mercedes, theodore).
grandparent(mercedes, nikko).
grandparent(mercedes, ralph).
grandparent(mercedes, orly).
grandparent(mercedes, john).

grandparent(teodorico, jeniffer).
grandparent(teodorico, owen).
grandparent(teodorico, orlandez).
grandparent(teodorico, oliver).
grandparent(teodorico, lady).
grandparent(teodorico, theodore).
grandparent(teodorico, nikko).
grandparent(teodorico, ralph).
grandparent(teodorico, orly).
grandparent(teodorico, john).

% Facts - Parent Relationships, X is the Parent of Y.
% 1st Level
parent(mercedes, josefina).
parent(mercedes, casimera).
parent(mercedes, narcissa).
parent(mercedes, catalina).
parent(mercedes, filomena).
parent(mercedes, isabel).
parent(mercedes, teodosia).

parent(teodorico, josefina).
parent(teodorico, casimera).
parent(teodorico, narcissa).
parent(teodorico, catalina).
parent(teodorico, filomena).
parent(teodorico, isabel).
parent(teodorico, teodosia).

% 2nd Level
parent(alfonso, jeniffer).
parent(alfonso, owen).
parent(alfonso, orlandez).
parent(alfonso, oliver).

parent(josefina, jeniffer).
parent(josefina, owen).
parent(josefina, orlandez).
parent(josefina, oliver).

parent(narcissa, lady).
parent(silver, lady).

parent(catalina, theodore).
parent(catalina, nikko).

parent(samuel, theodore).
parent(samuel, nikko).

parent(isabel, ralph).
parent(isabel, orly).
parent(isabel, john).

parent(leopoldo, ralph).
parent(leopoldo, orly).
parent(leopoldo, john).

% 3rd Level
parent(rene, meekah).
parent(rene, kezia).
parent(rene, doyle).

parent(jeniffer, meekah).
parent(jeniffer, kezia).
parent(jeniffer, doyle).

parent(oliver, frezzy).
parent(oliver, zyrah).
parent(oliver, axl).

parent(leigh, frezzy).
parent(leigh, zyrah).
parent(leigh, axl).

% Rules starts here.
granpa(X, Y) :- grandparent(X, Y), parent(Z, Y), male(X).
granma(X, Y) :- grandparent(X, Y), parent(Z, Y), female(X).

father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y).

% X is an aunt of Y.
% Works til Y is undefined.
aunt(X, Y) :- sibling(X, Z), parent(Z, Y), female(X). 
uncle(X, Y) :- sibling(X, Z), parent(Z, Y), male(X).

% X is a cousin of Y. 
cousin(X, Y) :- parent(V, X), parent(W, Y), sibling(V, W).