dlug(C,Z) :- char_code(C,X), Z is mod(X,97).

program(P) :- open('tekst.txt',read,X),
			
		   set_input(X),
		   read_string(X,C,S),
		   close(X),
		   
		   open('szyfr.txt',write,X2),
		   set_output(X2),
		   zaszyfruj(S,P),
		   close(X2).

isLower(C) :- C < 123, C > 96.
isUpper(C) :- C < 91, C > 59.

zaszyfruj(T,P) :- atom_codes(T,X), kolejneKody(X,P).

kolejneKody([],P).
kolejneKody([L|L1],P) :- policzP(L,P), kolejneKody(L1,P).  

policzP(C,_) :- C > 122, put_char(C), !.
policzP(C,_) :- C > 90, C < 97, put_char(C), !.
policzP(C,_) :- C < 65, put_char(C), !.
policzP(C,0) :- put_char(C), !.
policzP(C,P) :- isLower(C), CP is C+P, CP < 123, put_char(CP), !.
policzP(C,P) :- isUpper(C), CP is C+P, CP < 91, put_char(CP), !.
policzP(C,P) :- isLower(C), CP is C+P, NP is mod(CP,122)-1, policzP(97,NP).
policzP(C,P) :- isUpper(C), CP is C+P, NP is mod(CP,90)-1, policzP(65,NP).