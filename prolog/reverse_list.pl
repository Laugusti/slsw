/*This is the base case of the reverse clause. The reverse of an empty list is an empty list*/
reverse([], []).

/*This recursive rule reverses a list. It states the reverse of a list is the 
  first element appended to the reverse of the remaining elements*/
reverse([Head|Tail], List) :-
	reverse(Tail, Head1),
	append(Head1, [Head|[]], List).
