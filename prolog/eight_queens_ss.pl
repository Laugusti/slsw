/*This facts states an empty list is a valid board*/
valid([]).
/*This rules state a list is valid if each member is in the range 1-8 and the
  Tail of list is valid and each member is not in the Tail*/
valid([Column|Tail]) :-
	member(Column, [1,2,3,4,5,6,7,8]),
	valid(Tail),
	\+(member(Column, Tail)).

/*Two Queens are Lowerleft-to-Upperright diagonal if the sum of their Row and
  Column are the same.*/
diagonal_in_list((Row1,Column1), [Column2|Tail]) :-
	length(Tail, TailSize),
	DiagAdd is Row1 + Column1,
	Row2 is 8 - TailSize,
	Diag1 is Row2 + Column2,
	DiagAdd = Diag1.
/*Two Queens are Upperleft-to-Lowerright diagonal if the difference of their
  Row and Column are the same*/
diagonal_in_list((Row1,Column1), [Column2|Tail]) :-
	length(Tail, TailSize),
	DiagMinus is Row1 - Column1,
	Row2 is 8 - TailSize,
	Diag1 is Row2 - Column2,
	DiagMinus = Diag1.
/*The two rules above checks if the Head of the list in either of the Queens
  diagonals. This rule states the Queen has a diagonal in the list if the 
  there is a diagonal in the Tail. These 3 rules combine to state a Queen has a
  diagonal in the list if the Head of the list is diagonal or the Queen has a
  diagonal in the Tail of the List*/
diagonal_in_list(Queen, [_|Tail]) :-
	diagonal_in_list(Queen, Tail).

/*This clause states a list with a single queen have different diagonals for
   all queens*/
different_diagonal([_|[]]).
/*This rule states all queens in a list have different diagonals if there are
  no Queens in the Tail that is diagonal to the Head and if all queens in the
  Tail have different diagonals*/
different_diagonal([Column|Tail]) :-
	length(Tail, TailSize),
	Row is 8 - TailSize,
	\+(diagonal_in_list((Row, Column), Tail)),
	different_diagonal(Tail).
	
/*This rule states: (1) the length of the Board must be 8
		    (2) the board must be valid
		    (3) all queens on the board must have different diagonals*/
eight_queens(Board) :-
	length(Board, 8),
	valid(Board),
	different_diagonal(Board).
