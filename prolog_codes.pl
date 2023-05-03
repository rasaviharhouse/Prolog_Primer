# 1) Last element of a list

my_last([X], X).
my_last([_|L], X) :- my_last(L, X).

# 2) First element of a list

my_first([X|_], X).

# 3) Length of a list

my_len(0, []).
my_len(N, [_|L]) :- my_len(N1, L), N is N1+1.

# 4) GCD

gcd(U, 0, U).
gcd(U, V, W) :- not(V=0), R is U mod V, gcd(V, R, W).

# 5) Ancestor

ancestor(X, X).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

parent(amy, bob).
parent(jake, amy).

# 6) printing/writing in query

# prints 3+5
write(3+5).

# prints 8
X is 3+5, write(X).

# 7) Append one list to another

append([], Y, Y).
append([A|B], Y, [A|W]) :- append(B, Y, W).

# 8) Reverse a list

append([], Y, Y).
append([A|B], Y, [A|W]) :- append(B, Y, W).

reverse([], []).
reverse([H|T], R) :- reverse(T, Y), append(Y, [H], R).

# 9) Check palindromic lists

append([], Y, Y).
append([A|B], Y, [A|W]) :- append(B, Y, W).

reverse([], []).
reverse([H|T], R) :- reverse(T, Y), append(Y, [H], R).

is_palindrome(L) :- reverse(L,L).

# 10) Kth element in a list, 1 indexed

element_at(X,[X|_],1).
element_at(X,[_|L],K) :- K > 1, K1 is K - 1, element_at(X,L,K1).

# 11) Check if the given input is a list

islist([ ]).
islist([H|T]) :- islist(T).

# 12) Check if an element is present in a list (member)

member(X, [X|_]).
member(X, [_|Y]) :- member(X, Y).

# 13) Check if a list is sorted

sorted([ ]).
sorted([X]).
sorted([A, B | T]) :- A =< B, sorted ([B|T]).

# 14) Last but one element of a list

last_but_one(X,[X,_]).
last_but_one(X, [_|T]) :- last_but_one(X, T).

# 15) Flatten a nested list structure.

my_flatten(X,[X]) :- \+ is_list(X).
my_flatten([],[]).
my_flatten([X|Xs],Zs) :- my_flatten(X,Y), my_flatten(Xs,Ys), append(Y,Ys,Zs).  # Flatten 1st element (Head), Flatten tail, append both

# 16) Connected predicate:

edge(a, b). 
edge(b, c).
edge(c, d). 
edge(c, e).
edge(c, f). 
edge(d, f).

connected(X, Y) :- edge(X, Y).
connected(X, Y) :- edge(X, Z), connected(Z, Y).

# 17)  Delete all occurrences of an element from a list

del(_, [], []).
del(X, [X|T], L) :- del(X,T,L).
del(X, [H|T1], [H|T2]) :- X \= H, del(X,T1,T2).

# 18) Check if a list if prefix of another list

prefix([ ], _).
prefix([P|Pt], [P|T]) :- prefix(Pt, T).

# 19) Check if a list if suffix of another list

suffix(S, S).
suffix(S, [H|T]) :- suffix(S, T).

# 20) Select predicate - Remove one occurrence of an element in a list

select(X, [X|T], T).
select(X, [Y|T], [Y|R]) :- select(X, T, R).

# 21) Min element in a list

min([H],H).
min([H|T], M):- min(T,M), H>M.
min([H|T], H):- min(T,M), H=<M.

# 22) Max element in a list

max([H],H).
max([H|T], H):- max(T,M), H>M.
max([H|T], M):- max(T,M), H=<M.

# 23) Factorial of a number

fact(0, 1).
fact(N,R) :- N > 0, N1 is N-1,
            fact(N1, R1), R is N*R1.