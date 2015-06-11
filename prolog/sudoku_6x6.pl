/*Need clpfd library for all_distinct/1 and ins rule*/
:- use_module(library(clpfd)).

/*List is valid if empty or elements of head are all different and the Tail of the list is valid*/
valid([]).
valid([Head|Tail]) :-
	all_distinct(Head),
	valid(Tail).

/*This is rule attempts to solve a 6x6 Sudoku puzzle*/
sudoku(Puzzle, Solution) :-
	Solution = Puzzle,
	/*Break the 4x4 puzzle into components*/
	Puzzle = [S11, S12, S13, S14, S15, S16,
		  S21, S22, S23, S24, S25, S26,
		  S31, S32, S33, S34, S35, S36,
		  S41, S42, S43, S44, S45, S46,
		  S51, S52, S53, S54, S55, S56,
		  S61, S62, S63, S64, S65, S66],
	/*All elements in the puzzle is in the range 1-6*/
	Solution ins 1..6,
	
	/*Get the rows of the Puzzle*/
	Row1 = [S11, S12, S13, S14, S15, S16],
	Row2 = [S21, S22, S23, S24, S25, S26],
	Row3 = [S31, S32, S33, S34, S35, S36],
	Row4 = [S41, S42, S43, S44, S45, S46],
	Row5 = [S51, S52, S53, S54, S55, S56],
	Row6 = [S61, S62, S63, S64, S65, S66],

	/*Get the columns of the Puzzle*/
	Col1 = [S11, S21, S31, S41, S51, S61],
	Col2 = [S12, S22, S32, S42, S52, S62],
	Col3 = [S13, S23, S33, S43, S53, S63],
	Col4 = [S14, S24, S34, S44, S54, S64],
	Col5 = [S15, S25, S35, S45, S55, S65],
	Col6 = [S16, S26, S36, S46, S56, S66],

	/*Get the Squares of the Puzzle*/
	Square1 = [S11, S12, S13, S21, S22, S23],
	Square2 = [S14, S15, S16, S24, S25, S26],
	Square3 = [S31, S32, S33, S41, S42, S43],
	Square4 = [S34, S35, S36, S44, S45, S46],
	Square5 = [S51, S52, S53, S61, S62, S63],
	Square6 = [S54, S55, S56, S64, S65, S66],

	/*This clause verifies the Rows, Columns, and Squares of the Sudoku Puzzle are all different*/
	valid([Row1, Row2, Row3, Row4, Row5, Row6,
		Col1, Col2, Col3, Col4, Col5, Col6,
		Square1, Square2, Square3, Square4, Square5, Square6]).

write_list(List) :-
	List = [S11, S12, S13, S14, S15, S16,
		  S21, S22, S23, S24, S25, S26,
		  S31, S32, S33, S34, S35, S36,
		  S41, S42, S43, S44, S45, S46,
		  S51, S52, S53, S54, S55, S56,
		  S61, S62, S63, S64, S65, S66],
	
	/*Get the rows of the Puzzle*/
	Row1 = [S11, S12, S13, S14, S15, S16],
	Row2 = [S21, S22, S23, S24, S25, S26],
	Row3 = [S31, S32, S33, S34, S35, S36],
	Row4 = [S41, S42, S43, S44, S45, S46],
	Row5 = [S51, S52, S53, S54, S55, S56],
	Row6 = [S61, S62, S63, S64, S65, S66],

	writeln(Row1),
	writeln(Row2),
	writeln(Row3),
	writeln(Row4),
	writeln(Row5),
	writeln(Row6).
