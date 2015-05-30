/*The following 2 facts represent the first two numbers in the Fibonacci sequence*/
fibonacci(1,1).
fibonacci(2,1).

/*This rule defines a recursive function the find the Nth Fibonacci number*/
fibonacci(N, Result) :-
	N > 2,
	N1 is N-1,
	N2 is N-2,
	fibonacci(N1, R1),
	fibonacci(N2, R2),
	Result is R1+R2.
