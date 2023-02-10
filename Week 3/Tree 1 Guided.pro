domains
	dtree = tree(dtree,delemen,dtree);
	nil delemen = integer
	
predicates
	nondeterm pohon(dtree)
	
clauses
	pohon(nil).
	pohon(tree(nil,_,nil)).
	pohon(tree(L,_,R)) :- pohon(L),pohon(R).
	
goal
	pohon(tree(tree(tree(nil,8,nil),10,tree(nil,12,nil)),15,tree(nil,20,tree(nil,25,nil)))).
