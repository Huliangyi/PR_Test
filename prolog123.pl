% 文件名建议：family.prolog
% Prolog 注释与 Erlang 一样，都使用百分号 %

% 一些事实：定义父母关系与性别
parent(john, mary).
parent(john, tom).
parent(susan, mary).
parent(susan, tom).

male(john).
male(tom).
female(mary).
female(susan).

% 规则：如何定义父亲
father(X, Y) :-
    parent(X, Y),
    male(X).

% 规则：如何定义兄弟姐妹
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.   % 这里的 \= 表示“不相等”

% 经典的列表成员判断
member(X, [X|_]).
member(X, [_|T]) :-
    member(X, T).
revertrevertrevert

revertrevert
