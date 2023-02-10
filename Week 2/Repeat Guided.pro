predicates
	nondeterm repeat(integer, integer, integer)
	nondeterm repeatAksi(integer, integer, integer, integer)
	nondeterm until(integer, integer, integer, integer)
	nondeterm go

clauses
	go:-
		write("Batas Awal : "), readint(Aw),
		write("Batas Akhir : "), readint(Ak),
		write("Kelipatan : "), readint(K),
		Awal = Aw, Next = K, Akhir = Ak,
		repeat(Awal, Next, Akhir).
		
	repeat (Awal, Next, Akhir) :-
		Mulai = 0,
		repeatAksi(Mulai, Awal, Next, Akhir).
	
	repeatAksi(I, Cek, Next, Akhir) :-
		I1 = I+Next,
		until(I1, Cek, Next, Akhir).
		
	until(I1, Cek, Next, Akhir) :-
		I1 < Akhir,
		I1 > Cek,
		write(I1), nl,
		repeatAksi(I1, Cek, Next, Akhir).
		
	until(I1, Cek, Next, Akhir) :-
		I1 < Akhir,
		I1 = Cek,
		write(I1), nl,
		repeatAksi(I1, Cek, Next, Akhir).
	
	until(I1, Cek, Next, Akhir) :-
		I1 < Akhir,
		I1 < Cek,
		write(I1), nl,
		repeatAksi(I1, Cek, Next, Akhir).
	
	until(I1, Cek, Next, Akhir) :-
		I1 < Akhir,
		I1 = Cek,
		write(I1), nl,
		repeatAksi(I1, Cek, Next, Akhir).
	
	until(I1, Cek, Next, Akhir) :-
		I1 = Akhir,
		I1 > Cek,
		write(I1), nl,
		repeatAksi(I1, Cek, Next, Akhir).
	
	until(I1, Cek, _, Akhir) :-
		I1 > Cek,
		I1 > Akhir.
goal 
	go.
