valid_board([]).
valid_board([(X,Y)|Tail]) :-
	Range = [1,2,3,4,5,6,7,8],
	member(X, Range), 
	member(Y, Range),
	valid_board(Tail).

different_row_col([]).
different_row_col([(X,Y)|Tail]) :-
	\+(member((X,_), Tail)),
	\+(member((_,Y), Tail)),
	different_row_col(Tail).

diagonal_in_list((X1,Y1), List, (X2,Y2)) :-
	member((X2,Y2), List),
	DiagMinus is X1 - Y1,
	Diag1 is X2 - Y2,
	DiagMinus = Diag1.
diagonal_in_list((X1,Y1), List, (X2,Y2)) :-
	member((X2,Y2), List),
	DiagAdd is X1 + Y1,
	Diag1 is X2 + Y2,
	DiagAdd = Diag1.
	
different_diagonal([_|[]]).
different_diagonal([Head|Tail]) :-
	\+(diagonal_in_list(Head, Tail, _)),
	different_diagonal(Tail).
	
eight_queens(Board) :-
	length(Board, 8),
	valid_board(Board),
	different_row_col(Board),
	different_diagonal(Board).
