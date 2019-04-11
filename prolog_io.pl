poleKwadratu :- write('Podaj dlugosc boku: '), read(X), pole(X).
pole('q') :- !.
pole(X) :- write('Pole kwadratu wynosi: '), P is X * X, write(P), nl, poleKwadratu.


oblicz :- write('Podaj pierwsza liczbe: '), read(X),
		  write('Podaj druga liczbe: '), read(Y), nl,
		  A is X + Y, B is X * Y,
		  write('Suma X i Y wynosi '), write(A), nl,
		  write('Iloczyn X i Y wynosi '), write(B).
		  
podaj :- write('Podaj znak: '), get_char(X), \+ (X=q),
		 write('Podales znak: '), put_char(X).
		 
readFromFile :-
            open('dane.txt',read,X),
            current_input(Stream),
            set_input(X),
            code_reading,
            close(X),
            set_input(Stream).

code_reading :- read(Y), instructions(Y).

instructions( end_of_file ) :- !.
instructions(Y) :- \+ (Y=b), write(Y),nl,code_reading.

writeToFile :-
open('output.txt',write,X),
current_output(Stream),
set_output(X),
code_writing,
close(X),
set_output(Stream).
code_writing :- read(X), read(Y), Z is max(X,Y), write(Z).