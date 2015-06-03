/*The following fact states X is smaller than Y if X greater than or equal to Y
  and Y is smaller than X if X is greath than Y*/
smaller(X,Y,X) :- X=<Y.
smaller(X,Y,Y) :- X>Y.

/*This facts states the smallest element in a list with single element is that element*/
smallest_element([Head|[]], Head).
/*This rule states the smalles element in a list is either the Head of the list
  or the smallest element in the Tail of the list*/
smallest_element([Head|Tail], Smallest) :-
	smallest_element(Tail, Smallest1),
	smaller(Head, Smallest1, Smallest).
