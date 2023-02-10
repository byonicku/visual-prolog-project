domains
	kolom, baris = integer
	ox = char
facts - listKotak
	kotak(baris, kolom, ox)
predicates
	nondeterm opponent(ox, ox)
	nondeterm go
	nondeterm initKotak
	nondeterm tampilPapan(baris, kolom)
	nondeterm start(ox)
	nondeterm readMove(ox)
	nondeterm move(baris, kolom, ox)
	nondeterm validMove(baris, kolom)
	nondeterm anyValidMove
	nondeterm win(ox)
	nondeterm vertical(ox)
	nondeterm horizontal(ox)
	nondeterm diagonal(ox)
clauses
	opponent('O', 'X').
	opponent('X', 'O').
	
	go:-
		initKotak,
		start('O').
	
	initKotak :-
		assertz(kotak(1,1,' '), listKotak), assertz(kotak(1,2,' '), listKotak), assertz(kotak(1,3,' '), listKotak),
		assertz(kotak(2,1,' '), listKotak), assertz(kotak(2,2,' '), listKotak), assertz(kotak(2,3,' '), listKotak),
		assertz(kotak(3,1,' '), listKotak), assertz(kotak(3,2,' '), listKotak), assertz(kotak(3,3,' '), listKotak).
		
	tampilPapan(Baris, Kolom) :-
		Baris <= 3,
		Kolom < 3,
		kotak(Baris, Kolom, OX),
		write(" ", OX , " ", "|"),
		Kolom1 = Kolom + 1,
		tampilPapan(Baris, Kolom1), !;
		
		Baris < 3,
		Kolom = 3,
		kotak(Baris, Kolom, OX),
		write(" ", OX , " "), nl,
		Baris1 = Baris + 1,
		tampilPapan(Baris1, 1), !;
		
		Baris = 3,
		Kolom = 3,
		kotak(Baris, Kolom, OX),
		write(" ", OX , " "), nl.
	
	start(OX) :-
		opponent(OX, Player),
		win(Player), write(Player, " Menang"), nl, tampilPapan(1,1), !;
		
		write("YOU : X"), nl,
		write("COM : O"), nl,
		tampilPapan(1, 1),
		anyValidMove,
		readMove(OX), nl,
		opponent(OX, Player),
		start(Player), !;
		
		write("Seri"), nl.
	
	anyValidMove :-
		kotak(_,_,' ').
		
	readMove(OX) :-
		write(OX, " Move : "), nl,
		write(" Baris : "), readint(Baris),
		write(" Kolom : "), readint(Kolom),
		move(Baris, Kolom, OX).
	
	move(Baris, Kolom, OX) :-
		validMove(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, OX), listKotak);
		
		write("Inputan tidak valid"), nl,
		readMove(OX).
	
	validMove(Baris, Kolom)	:-
		kotak(Baris, Kolom, ' '),
		Baris >= 1, Baris <= 3,
		Kolom >= 1, Kolom <= 3.
		
	win(OX) :-
		horizontal(OX), !; vertical(OX), !; diagonal(OX).
	
	vertical(OX) :-
		kotak(1, Kolom, OX), kotak(2, Kolom, OX), kotak(3, Kolom, OX).
	
	horizontal(OX) :-
		kotak(Baris, 1, OX), kotak(Baris, 2, OX), kotak(Baris, 3, OX).
	
	diagonal(OX) :-
		kotak(1, 1, OX), kotak(2, 2, OX), kotak(3, 3, OX), !;
		kotak(1, 3, OX), kotak(2, 2, OX), kotak(3, 1, OX).
goal
	go.
