/*This fact states a List concatenated to an empty list is that List*/
concatenate([], List, List).

/*This rule states concatenating List1 to List 2 gives you List 3 if the heads
  of List1 and List2 are the same, and it be proven that ocncatenating the tail
  of List1 with List2 gives you the tail of List3*/
concatenate([Head|Tail1], List, [Head|Tail2]) :-
	concatenate(Tail1, List, Tail2).
