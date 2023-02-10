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
	pohon(tree(tree(tree(nil,1,nil),14,tree(nil,2,nil)),21,tree(tree(nil,05,nil),2,tree(nil,7,nil)))).
