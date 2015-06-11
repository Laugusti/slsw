/*This facts states an empty list is a valid board*/
valid_board([]).
/*This rule states both values in the Head tuple must be in the range 1-8, and 
  the Tail of the list is also valid*/
valid_board([(Row,Column)|Tail]) :-
	Range = [1,2,3,4,5,6,7,8],
	member(Row, Range), 
	member(Column, Range),
	valid_board(Tail).

/*This rule states an empty list contains different rows and columns*/
different_row_col([]).
/*This rule states a list has different rows and columns if the Tail has
  different rows and columns and there is no member in the Tail list with the
  same Row as the Head of list and there is no member in the Tail list with the
  same Columns as the Head of the list*/
different_row_col([(Row,Column)|Tail]) :-
	\+(member((Row,_), Tail)),
	\+(member((_,Column), Tail)),
	different_row_col(Tail).

/*This rule finds a Queen2 in the List that is diagonal to Queen1
  Two Queens are Upperleft-to-Lowerright diagonal if the difference of their
  Row and Column are the same*/
diagonal_in_list((Row1,Column1), List, (Row2,Column2)) :-
	member((Row2,Column2), List),
	DiagMinus is Row1 - Column1,
	Diag1 is Row2 - Column2,
	DiagMinus = Diag1.
/*This rule finds a Queen2 in the List that is diagonal to Queen1
  Two Queens are Lowerleft-to-Upperright diagonal if the sum of their
  Row and Column are the same*/
diagonal_in_list((Row1,Column1), List, (Row2,Column2)) :-
	member((Row2,Column2), List),
	DiagAdd is Row1 + Column1,
	Diag1 is Row2 + Column2,
	DiagAdd = Diag1.
	
/*This clause states a list with a single queen have different diagonals for
   all queens*/
different_diagonal([_|[]]).
/*This rule states all queens in a list have different diagonals if there are
  no Queens in the Tail that is diagonal to the Head and if all queens in the
  Tail have different diagonals*/
different_diagonal([Head|Tail]) :-
	\+(diagonal_in_list(Head, Tail, _)),
	different_diagonal(Tail).
	
/*This rule states: (1) the length of the Board must be 8
		    (2) the board must be valid
		    (3) all queens on the board must have different rows and columns
		    (4) all queens on the board must have different diagonals*/
eight_queens(Board) :-
	Board = [(1, _), (2, _), (3, _), (4, _), (5, _), (6, _), (7, _), (8, _)],
	valid_board(Board),
	different_row_col(Board),
	different_diagonal(Board).
