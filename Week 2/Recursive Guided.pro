predicates 
	nondeterm faktorial(integer, integer)
	
clauses
	faktorial(1, 1) :- !.
	
	faktorial (X, FactX) :-
		Y = X - 1,
		faktorial(Y, FactY),
		FactX = X * FactY.
		
goal
	faktorial(5, FactX).
