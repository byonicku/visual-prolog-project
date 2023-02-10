predicates
	nondeterm for(integer, integer)
	nondeterm forAksi(integer, integer)

clauses
	for(Awal, Akhir):-
		I = Awal,
		forAksi(I, Akhir).
	forAksi(I, Akhir):-
		I <= Akhir,
		I1 = I+1,
		write("Input : "), readln(A),
		write("Output : "), write(A), nl, nl,
		forAksi(I1, Akhir).
	forAksi(I, Akhir) :- I > Akhir.
goal
	for(1, 7).
