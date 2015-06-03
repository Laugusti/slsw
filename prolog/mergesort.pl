/*This fact states an empty list splits into 2 empty lists*/
split_list([],[],[]).
/*This rule states split a list by alternately appending the Head of the list
  to the two list*/
split_list([Head|Tail], [Head|Tail1], Part2) :-
	split_list(Tail, Part2, Tail1).

/*These facts states the result of merging an empty list and another list is 
  that list*/
merge([],[],[]).
merge([Head|Tail], [], [Head|Tail]).
merge([], [Head|Tail], [Head|Tail]).
/*These 2 rules states to merge 2 sorted lists, recursively append the smaller
  'Head' to Merged list*/
merge([Head1|Tail1], [Head2|Tail2], Merged) :-
	Head1 =< Head2,
	merge(Tail1, [Head2|Tail2], Merged1),
	Merged = [Head1|Merged1].
merge([Head1|Tail1], [Head2|Tail2], Merged) :-
	Head1 > Head2,
	merge([Head1|Tail1], Tail2, Merged1),
	Merged = [Head2|Merged1].

/*This fact states an empty list sorted is an empty list*/
mergesort([],[]).
/*This fact states an single element list sorted is that single element list*/
mergesort([Head|[]],[Head|[]]).
/*This rule states, for a List of size greater 2, split the list in two and sort
  those sublists and merge the sublists*/
mergesort(List, Sorted) :-
	length(List, Size),
	Size >= 2,
	split_list(List, Part1, Part2),
	mergesort(Part1, Sorted1),
	mergesort(Part2, Sorted2),
	merge(Sorted1, Sorted2, Sorted).
