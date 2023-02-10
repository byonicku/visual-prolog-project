predicates
	nondeterm go_11227(integer, integer, integer, integer)
	nondeterm while_11227(integer, integer, integer, integer, integer)
	nondeterm cekBulan_11227(integer, integer, integer, integer)
	nondeterm cekTahun_11227(integer, integer, integer, integer)
clauses	
	cekBulan_11227(Hari, Bulan, Tahun, Count) :-
		Hari > 31,
		Bulan1 = Bulan + 1,
		Hari1 = Hari - 31,
		go_11227(Hari1, Bulan1, Tahun, Count).
	cekBulan_11227(Hari, Bulan, Tahun, Count) :-
		Bulan > 12,
		cekTahun_11227(Hari, Bulan, Tahun, Count).
	cekBulan_11227(Hari, Bulan, Tahun, Count) :-
		Hari < 32,
		go_11227(Hari, Bulan, Tahun, Count).
		
	cekTahun_11227(Hari, Bulan, Tahun, Count) :-
		Bulan > 12,
		Tahun1 = Tahun + 1,
		Bulan1 = Bulan - 12,
		go_11227(Hari, Bulan1, Tahun1, Count).
	cekTahun_11227(Hari, Bulan, Tahun, Count) :-		
		Bulan < 13,
		go_11227(Hari, Bulan, Tahun, Count).
		
	go_11227(Hari, Bulan, Tahun, Count):-
		write("================"), nl,
		write("Tahun ", Tahun, " Bulan ", Bulan, " Hari ", Hari), nl,
		write("Count Time ", Count), nl,
		write("================"), nl,
		write("1. Lewati 1 Hari"), nl,
		write("2. Lewati 1 Minggu"), nl,
		write("3. Lewati 1 Bulan"), nl,
		write("4. Lewati 1 Tahun"), nl,	
		write("5. Keluar"), nl,
		write(">>> "), readInt(Switch),
		while_11227(Switch, Hari, Bulan, Tahun, Count).
		
		while_11227(Switch, Hari, Bulan, Tahun, Count) :- Switch=1,
			Hari1 = Hari + 1,
			Count1 = Count + 1,
			cekBulan_11227(Hari1, Bulan, Tahun, Count1).
		while_11227(Switch, Hari, Bulan, Tahun, Count) :- Switch=2,
			Hari1 = Hari + 7,
			Count1 = Count + 7,
			cekBulan_11227(Hari1, Bulan, Tahun, Count1).
		while_11227(Switch, Hari, Bulan, Tahun, Count) :- Switch=3,
			Bulan1 = Bulan + 1,
			Count1 = Count + 31,
			cekTahun_11227(Hari, Bulan1, Tahun, Count1).
		while_11227(Switch, Hari, Bulan, Tahun, Count) :- Switch=4,
			Tahun1 = Tahun + 1,
			Count1 = Count + 372,
			go_11227(Hari, Bulan, Tahun1, Count1).
		while_11227(Switch, _, _, _, _) :- Switch=5,
			write("Nico Herlim - 210711227 - PKB A"), nl, nl.
		while_11227(_, Hari, Bulan, Tahun, Count) :-
			write("Inputan Invalid"), nl, nl,
			go_11227(Hari, Bulan, Tahun, Count).
goal
	go_11227(0, 0, 0, 0).
