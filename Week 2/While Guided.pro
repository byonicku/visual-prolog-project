predicates
	nondeterm go
	nondeterm while(integer)
	nondeterm whileAksi(integer, integer)

clauses
	go:-
		write("Input Bilangan"), readint(Bilangan),
		while(Bilangan).
		
		while(Bilangan) :- 
			I = Bilangan,
			whileAksi(I, I).
		
		whileAksi(I, Hasil) :-
			I > 1,
			I1 = I-1,
			
			H = Hasil * I1,
			write(I), nl,
			whileAksi(I1, H).
		
		whileAksi(I, H) :-
			I = 1,
			write(I), nl,
			write("= "), write(H), nl.
		
		whileAksi(I, _) :-
			I = 0,
			H = 1,
			write("Nilai Faktorial dari Bilangan = "), write(H), nl.
goal 
	go.
