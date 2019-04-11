change(you,i).
change(are, [am,not]).
change(french, german).
change(do,no).
change(X,X).

alter([],[]).
alter([X|Y],[Z|C]) :- change(X,Z), alter(Y,C).

append([],Y,Y).
append([X|X1],Y,[X|Z1]) :- append(X1,Y,Z1).

listlen([],0).
listlen([X|X1],N):- listlen(X1,N1), N is N1+1.

listlengen([],A,A).
listlengen(X,A,N):- listlen(X,N1), N is N1+A.

isInteger(0).
isInteger(X) :- isInteger(Y), X is Y + 1.

ismember(X,[X|_]).
ismember(X,[_|Y]) :- ismember(X,Y).

sum_to(1,1) :- !.
sum_to(N,S) :- N1 is N-1, sum_to(N1,S1), S is S1+N.

%program :- open('test.txt',read,X), code_reading_from(X), close(X).

typing_error('q','w').
typing_error('c','v').

check_line(Z) :- get_char(X), check_pair('\n',X,Z).

check_pair(_,'\n',yes) :- !.
check_pair(X,Y,no) :- typing_error(X,Y), check_pair(Y,C,Z).
check_pair(X,Y,Z) :- get_char(C), check_pair(Y,C,Z).

typing_error2('q','w','q').
typing_error2('c','v','c').

check_line2 :- get_char(X), check_pair2('\n',X).

check_pair2(X,'\n') :- !.
check_pair2(X,Y) :- typing_error2(X,Y,Z), get_char(C), check_pair2(Y,C).
check_pair2(X,Y) :- put_char(Y), get_char(C), check_pair2(Y,C).

% ===============================================================
% PROLOG 1

zad1(A,B) :- B is (A+10)*5.

dzielnik(X,Y) :- M is mod(X,Y), M==0.

nwd(_,_,1,1) :- !.
nwd(X,Y,D,D) :- dzielnik(X,D), dzielnik(Y,D), !.
nwd(X,Y,D,Z) :- D1 is D-1, nwd(X,Y,D1,Z).

nwdStart(X,Y,Z) :- X>Y, D is Y, !, nwd(X,Y,D,Z).
nwdStart(X,Y,Z) :- D is X, nwd(X,Y,D,Z).


% ===============================================================
% PROLOG 2

% ZAD1

dodaj(X,L,[X|L]).

% ZAD2

rozdziel([],[],[]).
rozdziel([L|L1],[L|X],Y) :- L > 0, !, rozdziel(L1,X,Y).
rozdziel([L|L1],X,[L|Y]) :- rozdziel(L1,X,Y).

% ZAD5

ile([],_,0) :- !.
ile([L|L1],X,N) :- ile(L1,X,N).
ile([X|L1],X,N) :- ile(L1,X,N1), N is N1+1.

ile2([],_,0).
ile2([X|L1],X,N) :- !, ile(L1,X,N1), N is N1+1.
ile2([_|L1],X,N) :- ile(L1,X,N).

% ZAD3

ktora(X,Y,X) :- length(X,XN), length(Y,YN), XN>YN, write('Pierwsza lista dluzsza'), !.
ktora(X,Y,Y) :- length(X,XN), length(Y,YN), XN<YN, write('Druga lista dluzsza'), !.
ktora(X,Y,[X,Y]) :- length(X,XN), length(Y,YN), XN==YN, write('Listy takiej samej dlugosci'), !.

porownajDlugosc(X,Y,Z) :- ktora(X,Y,Z).

% ===============================================================
% PROLOG 3

z('q') :- !.
z(X) :- P is X*X, write('Pole wynosi: '), write(P), polekwad.
polekwad :- write('Podaj dlug boku: '), read(X), z(X).

spr('q') :- !.
spr(X) :- write('Podales znak: '), put_char(X), nl, wyswietl.
wyswietl :- write('Podaj znak: '), get_char(X), !, spr(X).

program :- open('test.txt', read, X),
		   set_input(X),
            














