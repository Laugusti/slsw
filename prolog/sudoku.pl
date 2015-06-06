/*Need clpfd library for all_different/1 and ins rule*/
:- use_module(library(clpfd)).

/*List is valid if empty or elements of head are all different and the Tail of the list is valid*/
valid([]).
valid([Head|Tail]) :-
	all_different(Head),
	valid(Tail).

/*This is rule attempts to solve a 4x4 Sudoku puzzle*/
sudoku(Puzzle, Solution) :-
	Solution = Puzzle,
	/*Break the 4x4 puzzle into components*/
	Puzzle = [S11, S12, S13, S14,
		  S21, S22, S23, S24,
		  S31, S32, S33, S34,
		  S41, S42, S43, S44],
	/*All elements in the puzzle is in the range 1-4*/
	Solution ins 1..4,
	
	/*Get the rows of the Puzzle*/
	Row1 = [S11, S12, S13, S14],
	Row2 = [S21, S22, S23, S24],
	Row3 = [S31, S32, S33, S34],
	Row4 = [S41, S42, S43, S44],

	/*Get the columns of the Puzzle*/
	Col1 = [S11, S21, S31, S41],
	Col2 = [S12, S22, S32, S42],
	Col3 = [S13, S23, S33, S43],
	Col4 = [S14, S24, S34, S44],

	/*Get the Squares of the Puzzle*/
	Square1 = [S11, S12, S21, S22],
	Square2 = [S13, S14, S23, S24],
	Square3 = [S31, S32, S41, S42],
	Square4 = [S33, S34, S43, S44],

	/*This clause verifies the Rows, Columns, and Squares of the Sudoku Puzzle are all different*/
	valid([Row1, Row2, Row3, Row4,
		Col1, Col2, Col3, Col4,
		Square1, Square2, Square3, Square4]).
