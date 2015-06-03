/*Base case: This clause states an empty list sorted is an empty list*/
insertion_sort([],[]).

/*This rule states a list is sorted if the Tail is sorted and the Head is
  inserted in the correct position*/
insertion_sort([Head|Tail], Sorted) :-
	insertion_sort(Tail, SortedTail),
	sorted_insert(Head, SortedTail, Sorted).

/*Base case: This clase states the sorted insert of an Element to an empty list
  is a List containing only that Element*/
sorted_insert(Element, [], [Element|[]]).

/*This rule states the sorted insert of an Element to a sorted list where the
  Element precedes the Head of the list is the Element followed by the sorted List*/
sorted_insert(Element, [Head|Tail], Sorted) :-
	Element =< Head,
	Sorted = [Element,Head|Tail].

/*This rule states the sorted insert of an Element to a sorted list in which the
  Head of the list precedes the Element is the Head followed by the SortedTail,
  where the SortedTail is the Tail of the original list with the Element 
  inserted in the correct position*/
sorted_insert(Element, [Head|Tail], Sorted) :-
	Element > Head,
	sorted_insert(Element, Tail, SortedTail),
	Sorted = [Head|SortedTail].

