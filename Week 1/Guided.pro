domains
	kendaraan = kategori (jumlahRoda, muatan)
	jumlahRoda = Integer
	muatan = Integer
predicates
	nondeterm cekKendaraan(kendaraan)
	nondeterm motor(kendaraan)
	nondeterm mobil(kendaraan)
clauses
	cekKendaraan(kategori(JumlahRoda, Muatan)):-
		motor(kategori(JumlahRoda, Muatan));
		mobil(kategori(JumlahRoda, Muatan)).
	motor(kategori(JumlahRoda, Muatan)):-
		JumlahRoda = 2,
		Muatan = 2,
		write ("Kendaraan yang kamu punya adalah motor"), nl.
	mobil(kategori(JumlahRoda, Muatan)):-
		JumlahRoda = 4,
		Muatan = 6,
		write ("Kendaraan yang kamu punya adalah mobil"), nl.
goal
	cekKendaraan(kategori(4, 6)).
