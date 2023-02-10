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
	nondeterm validMove(baris, kolom, ox)
	nondeterm validEdge(baris, kolom)
	nondeterm whilePilih(integer, baris, kolom, ox)
	nondeterm win(ox)
	nondeterm vertical(ox)
	nondeterm horizontal(ox)
	nondeterm diagonal(ox)
	nondeterm cekTeam(ox)
	
clauses
	%turn pergantian
	opponent('B', 'W').
	opponent('W', 'B').
	
	go:-
		initKotak,
		start('B').
	
	initKotak :- %init papan
		assertz(kotak(1,1,'B'), listKotak), assertz(kotak(1,2,' '), listKotak), assertz(kotak(1,3,'W'), listKotak),
		assertz(kotak(2,1,'B'), listKotak), assertz(kotak(2,2,' '), listKotak), assertz(kotak(2,3,'W'), listKotak),
		assertz(kotak(3,1,'B'), listKotak), assertz(kotak(3,2,' '), listKotak), assertz(kotak(3,3,'W'), listKotak).
		
	tampilPapan(Baris, Kolom) :- %print papan
		Baris <= 3,
		Kolom < 3,
		kotak(Baris, Kolom, OX),
		write(" ", OX , " ", "--"),
		Kolom1 = Kolom + 1,
		tampilPapan(Baris, Kolom1), !;
		
		Baris < 3,
		Kolom = 3,
		kotak(Baris, Kolom, OX),
		write(" ", OX , " "), nl,
		write(" |  ", "   |   ", "    | "), nl,
		Baris1 = Baris + 1,
		tampilPapan(Baris1, 1), !;
		
		Baris = 3,
		Kolom = 3,
		kotak(Baris, Kolom, OX),
		write(" ", OX , " "), nl.
	
	start(OX) :- %starting point
		tampilPapan(1, 1),
		opponent(OX, Player),
		win(Player), write(Player, " Menang"), nl, !;
		
		cekTeam(OX),
		write(OX, " Move : "), nl,
		readMove(OX), 
		opponent(OX, Player),
		start(Player).
		
	readMove(OX) :- %menu baca gerakan pion
		write(" Pilih Pion : "), nl,
		write(" Baris : "), readint(Baris),
		write(" Kolom : "), readint(Kolom),
		move(Baris, Kolom, OX);
		write("Inputan tidak valid"), nl, nl,
		tampilPapan(1, 1),
		cekTeam(OX),
		readMove(OX).
	
	move(Baris, Kolom, OX) :- %menu milih gerakan
		validMove(Baris, Kolom, OX),
		validEdge(Baris, Kolom),
		write("Pilih Gerakan Untuk Pion Ini"),nl,
		write(" 1. Atas"),nl,
		write(" 2. Bawah"),nl,
		write(" 3. Kiri"),nl,
		write(" 4. Kanan"),nl,
		write(" 5. Diagonal Kiri Atas"),nl,
		write(" 6. Diagonal Kiri Bawah"),nl,
		write(" 7. Diagonal Kanan Atas"),nl,
		write(" 8. Diagonal Kanan Bawah"),nl,
		write(" >>> "), readInt(Pilih), 
		whilePilih(Pilih, Baris, Kolom, OX);
		
		write("Inputan tidak valid"), nl, nl,
		move(Baris, Kolom, OX).
	
	%seluruh dibawah ini untuk move
	whilePilih(1, Baris, Kolom, OX):-
		Baris1 = Baris - 1,
		validMove(Baris1, Kolom, ' '),
		validEdge(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, ' '), listKotak),
		retract(kotak(Baris1, Kolom, _), listKotak),
		assertz(kotak(Baris1, Kolom, OX), listKotak);
		write("Move tidak valid"), nl, nl,
		move(Baris, Kolom, OX), nl.
		
	whilePilih(2, Baris, Kolom, OX):-
		Baris1 = Baris + 1,
		validMove(Baris1, Kolom, ' '),
		validEdge(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, ' '), listKotak),
		retract(kotak(Baris1, Kolom, _), listKotak),
		assertz(kotak(Baris1, Kolom, OX), listKotak);
		write("Move tidak valid"), nl, nl,
		move(Baris, Kolom, OX), nl.
		
	whilePilih(3, Baris, Kolom, OX):-
		Kolom1 = Kolom - 1,
		validMove(Baris, Kolom1, ' '),
		validEdge(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, ' '), listKotak),
		retract(kotak(Baris, Kolom1, _), listKotak),
		assertz(kotak(Baris, Kolom1, OX), listKotak);
		write("Move tidak valid"), nl, nl,
		move(Baris, Kolom, OX), nl.
		
	whilePilih(4, Baris, Kolom, OX):-
		Kolom1 = Kolom + 1,
		validMove(Baris, Kolom1, ' '),
		validEdge(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, ' '), listKotak),
		retract(kotak(Baris, Kolom1, _), listKotak),
		assertz(kotak(Baris, Kolom1, OX), listKotak);
		write("Move tidak valid"), nl, nl,
		move(Baris, Kolom, OX), nl.
		
	whilePilih(5, Baris, Kolom, OX):-
		Baris1 = Baris - 1,
		Kolom1 = Kolom - 1,
		validMove(Baris1, Kolom1, ' '),
		validEdge(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, ' '), listKotak),
		retract(kotak(Baris1, Kolom1, _), listKotak),
		assertz(kotak(Baris1, Kolom1, OX), listKotak);
		write("Move tidak valid"), nl, nl,
		move(Baris, Kolom, OX), nl.
		
	whilePilih(6, Baris, Kolom, OX):-
		Baris1 = Baris + 1,
		Kolom1 = Kolom - 1,
		validMove(Baris1, Kolom1, ' '),
		validEdge(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, ' '), listKotak),
		retract(kotak(Baris1, Kolom1, _), listKotak),
		assertz(kotak(Baris1, Kolom1, OX), listKotak);
		write("Move tidak valid"), nl, nl,
		move(Baris, Kolom, OX), nl.
		
	whilePilih(7, Baris, Kolom, OX):-
		Baris1 = Baris - 1,
		Kolom1 = Kolom + 1,
		validMove(Baris1, Kolom1, ' '),
		validEdge(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, ' '), listKotak),
		retract(kotak(Baris1, Kolom1, _), listKotak),
		assertz(kotak(Baris1, Kolom1, OX), listKotak);
		write("Move tidak valid"), nl, nl,
		move(Baris, Kolom, OX), nl.
	
	whilePilih(8, Baris, Kolom, OX):-
		Baris1 = Baris + 1,
		Kolom1 = Kolom + 1,
		validMove(Baris1, Kolom1, ' '),
		validEdge(Baris, Kolom),
		retract(kotak(Baris, Kolom, _), listKotak),
		assertz(kotak(Baris, Kolom, ' '), listKotak),
		retract(kotak(Baris1, Kolom1, _), listKotak),
		assertz(kotak(Baris1, Kolom1, OX), listKotak);
		write("Move tidak valid"), nl, nl,
		move(Baris, Kolom, OX), nl.
	
	whilePilih(_, Baris, Kolom, OX):-
		write("Pilihan tidak valid"), nl,
		move(Baris, Kolom, OX), nl.
		
	win(OX) :- %pas menang
		horizontal(OX), !; vertical(OX), !; diagonal(OX).
	
	vertical(OX) :- %win condition
		kotak(1, 2, OX), kotak(2, 2, OX), kotak(3, 2, OX), !;
		kotak(1, 1, 'W'), kotak(2, 1, 'W'), kotak(3, 1, 'W'), !;
		kotak(1, 3, 'B'), kotak(2, 3, 'B'), kotak(3, 3, 'B').
	
	horizontal(OX) :- %win condition
		kotak(Baris, 1, OX), kotak(Baris, 2, OX), kotak(Baris, 3, OX).
	
	diagonal(OX) :- %win condition
		kotak(1, 1, OX), kotak(2, 2, OX), kotak(3, 3, OX), !;
		kotak(1, 3, OX), kotak(2, 2, OX), kotak(3, 1, OX).
		
	cekTeam(OX):- % print daftar pion yang mungkin
		write("=====Daftar Pion====="), nl,
		validMove(Baris, Kolom, OX),
		validEdge(Baris, Kolom),
		write("Baris : ", Baris, " Kolom : ", Kolom), nl,
		1 = 2;
		1 = 1, write("====================="), nl.
	
	validMove(Baris, Kolom, OX):- % tranversal mencari semua pion
		kotak(Baris, Kolom, OX),		
		Baris >= 1, Baris <= 3,
		Kolom >= 1, Kolom <= 3.
		
	validEdge(Baris, Kolom):- %filter pion yang bisa gerak
		Baris = 1,
		Baris1 = Baris + 1,
		kotak(Baris1, Kolom, ' '), !;		
			
		Baris = 2,
		kotak(1, Kolom, ' '), !;
		
		Baris = 2,
		Baris1 = Baris + 1,
		kotak(Baris1, Kolom, ' '), !;
			
		Baris = 3,
		kotak(Baris, Kolom, ' '), !;
		
		Baris = 3,
		Baris1 = Baris - 1,
		kotak(Baris1, Kolom, ' '), !;
		
		Kolom >< 1, 
		Kolom1 = Kolom - 1,
		kotak(Baris, Kolom1, ' '), !;
		
		Kolom >< 1,
		Kolom1 = Kolom - 1,
		Baris1 = Baris - 1,
		kotak(Baris1, Kolom1, ' '), !;
		
		Kolom >< 1,
		Kolom1 = Kolom + 1,
		Baris1 = Baris - 1,
		kotak(Baris1, Kolom1, ' '), !;
		
		Kolom >< 1,
		Kolom1 = Kolom - 1,
		Baris1 = Baris + 1,
		kotak(Baris1, Kolom1, ' '), !;
		
		Kolom >< 3,
		Kolom1 = Kolom + 1,
		kotak(Baris, Kolom1, ' '), !;
		
		Kolom >< 3,
		Kolom1 = Kolom + 1,
		Baris1 = Baris + 1,
		kotak(Baris1, Kolom1, ' '), !;
		
		Kolom >< 3,
		Kolom1 = Kolom - 1,
		Baris1 = Baris + 1,
		kotak(Baris1, Kolom1, ' '), !;
		
		Kolom >< 3,
		Kolom1 = Kolom + 1,
		Baris1 = Baris - 1,
		kotak(Baris1, Kolom1, ' ').
goal
	go.
