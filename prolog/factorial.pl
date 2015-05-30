/*The following fact represent 0!*/
factorial(0, 1).

/*This rule defines a recursive function to find the factorial of N*/
factorial(N, Result) :-
	N > 0,
	N1 is N-1,
	factorial(N1, R1),
	Result is N*R1.
