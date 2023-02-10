domains
	list=string*
	list2=integer*
	list3=string*
predicates
	nondeterm menu(list,list2,list3)
	nondeterm pil(integer,list,list2,list3)
	nondeterm tampil(list,list2,list3)
	nondeterm cariBarang(string,list,list2,list3)
clauses
	menu(Produk,Harga,Asal):-
		write("===<UGD_LIST_11227>==="),nl,
		write("[1] Tambah Data Barang "),nl,
		write("[2] Lihat List Data Barang"),nl,
		write("[3] Cari Data Barang"),nl,
		write("[0] Keluar "),nl,
		write("Pilihan Menu :  "),readint(Pilih),nl,pil(Pilih,Produk,Harga,Asal).
	
	pil(1,Produk,Harga,Asal):-
		write("Input Nama Barang: "),readln(Nama),
		write("Input Harga : "),readint(Price),
		write("Input Asal : "),readln(Place),
		menu([Nama|Produk],[Price|Harga],[Place|Asal]).
	
	pil(2,Produk,Harga,Asal):-
		tampil(Produk,Harga,Asal),nl,
		menu(Produk,Harga,Asal).
	
	pil(3,Produk,Harga,Asal):-
		write("Masukkan nama Barang yang ingin dicari : "),readln(Cari),
		cariBarang(Cari,Produk,Harga,Asal),nl,
		menu(Produk,Harga,Asal).
		
	pil(0,_,_,_):-
		write("PROGRAM BERHASIL"),nl.
	
	pil(_,Produk,Harga,Asal):-
		write("Menu Tidak Ditemukan..."),nl, nl,
		menu(Produk,Harga,Asal).
		
	tampil([],[],[]).
	
	tampil([Produk2|Produk3],[Harga2|Harga3],[Asal2|Asal3]):-
		write("Nama Barang : ",Produk2),nl,
		write("Harga Barang : ",Harga2),nl,
		write("Asal : ", Asal2),nl, nl,
		tampil(Produk3,Harga3,Asal3).
	
	cariBarang(Cari,[Cari|_],[Harga|_],[Asal|_]):-
		write("Nama Barang : ",Cari), nl,
		write("Harga Barang : ",Harga), nl,
		write("Asal : ", Asal), nl.
	
	cariBarang(Cari,[_|Produk2],[_|Harga2], [_|Asal2]):-
		cariBarang(Cari,Produk2,Harga2,Asal2).
		
	cariBarang(_,[],[],[]):-
		write("Nama Barang Tidak ada"),nl.
goal
	menu(["Pensil_11227","Buku_11227","Penghapus_11227"],[2000,5000,1000],["Jepara","Yogyakarta","Semarang"]).
