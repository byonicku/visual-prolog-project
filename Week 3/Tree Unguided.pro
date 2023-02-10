domains
	dtree = tree(dtree,delemen,dtree);
	nil delemen = symbol
	
predicates
	nondeterm pohon(integer, dtree)
	nondeterm whileAksi(integer)
	nondeterm go_11227.
clauses
	pohon(_,nil).	
	pohon(Y,tree(nil,X,nil)) :- write(X," = Merupakan Daun dan berada pada tingkat ",Y),nl.
	pohon(Y,tree(L,X,R)) :- write(X," = Merupakan akar dan berada pada tingkat ",Y),nl,Z=Y+1,pohon(Z,L),pohon(Z,R).
	
	go_11227:-
		write("===<UGD_TREE_11227>==="),nl,
		write("[1] Tampil Pohon dan Tingkatan Soal"),nl,
		write("[2] Tampil Pohon dan Tingkatan NPM"),nl,
		write("[3] Tampil Pohon dan Tingkatan Tulisan"),nl,
		write("[4] Tampil Pohon dan Tingkatan Bonus"),nl,
		write("[0] Keluar"),nl, 
		write(">>> "), readint(Menu), whileAksi(Menu).
		
		whileAksi(1):-
			pohon(0,tree(tree(tree(tree(nil,"H",nil),"D",tree(nil,"I",nil)),"B",tree(tree(nil,"J",nil),"E",tree(nil, "K", nil))),"A",tree(tree(tree(nil,"L",nil),"F",tree(nil,"M", nil)),"C",tree(tree(nil,"N",nil),"G",tree(nil,"O",nil))))), nl, go_11227.
		whileAksi(2):- 
			pohon(0,tree(tree(tree(tree(nil,"H",nil),"2",tree(nil,"I",nil)),"1",tree(tree(nil,"J",nil),"7",tree(nil, "K", nil))),"1",tree(tree(tree(nil,"L",nil),"F",tree(nil,"M", nil)),"2",tree(tree(nil,"N",nil),"G",tree(nil,"O",nil))))), nl, go_11227.
		whileAksi(3):- 
			pohon(0, tree(tree(tree(tree(nil,"A",nil),"M",nil),"T",nil),"A",tree(nil,"J",tree(nil,"A",tree(nil,"Y",tree(nil,"A", nil)))))), nl, go_11227.
		whileAksi(4):-
			pohon(0, tree(tree(tree(nil,"1",nil),"14",tree(nil,"2",nil)),"21",tree(tree(nil,"2",nil),"05",tree(nil,"7",nil)))),nl, go_11227.
		whileAksi(0):- write("PROGRAM SUKSES"), nl.
		whileAksi(_):- write("Menu Tidak Ada"), nl, nl, go_11227.
goal
	go_11227.
