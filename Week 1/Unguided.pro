domains
	hasil = diagnosa(sesak, demam, batuk, kepala)
	sesak = String
	demam = String
	batuk = String
	kepala = String
predicates
	nondeterm cekPenyakit_1227(hasil)
	nondeterm covid(sesak, demam, batuk, kepala)
	nondeterm ringan(sesak, demam, batuk, kepala)
	nondeterm sehat(sesak, demam, batuk, kepala)
	nondeterm error	
	nondeterm input
clauses
	cekPenyakit_1227(diagnosa(Sesak, Demam, Batuk, Kepala)):-
		covid(Sesak, Demam, Batuk, Kepala) ;
		ringan(Sesak, Demam, Batuk, Kepala) ;
		sehat(Sesak, Demam, Batuk, Kepala) ;
		error.
		
	covid(Sesak, Demam, Batuk, Kepala) :-
		Sesak = "iya",
		Demam = "iya",
		Batuk = "iya",
		Kepala = "iya",
		nl, write("Anda Covid-19!").
		
	ringan(Sesak, Demam, Batuk, Kepala) :-
		Sesak = "tidak",
		Demam = "iya",
		Batuk = "tidak",
		Kepala = "iya",
		nl, write("Anda Penyakit Ringan!").
		
	sehat(Sesak, Demam, Batuk, Kepala) :-
		Sesak = "tidak",
		Demam = "tidak",
		Batuk = "tidak",
		Kepala = "tidak",
		nl, write("Anda Sehat!").
		
	error :-
		nl, write("Anda perlu ke rumah sakit!").
		
	input :-
		write("Cek Kesehatan : "), nl,
		write("Apakah kamu Sesak Nafas? "), readln(Sesak),
		write("Apakah kamu Demam? "), readln(Demam),
		write("Apakah kamu Batuk Kering? "), readln(Batuk),
		write("Apakah kamu Sakit Kepala? "), readln(Kepala),
	
		cekPenyakit_1227(diagnosa(Sesak, Demam, Batuk, Kepala)), nl.
		
goal
	input, nl.
