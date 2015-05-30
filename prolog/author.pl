/*The following facts represents Books and their authors*/
book_author('Seven Languages in Seven Weeks', 'Bruce A. Tate').
book_author('Cracking the Coding Interview', 'Gayle Laakmann McDowell').
book_author('Programming Interviews Exposed: Secrets to Landing Your Next Job', 'John Mongan').
book_author('Programming Interviews Exposed: Secrets to Landing Your Next Job', 'Noah Suojanen').

/*This rule is true if the Book parameter has an Author that is not equal to the Author parameter*/
has_other_author(Book, Author1) :-
	book_author(Book, Author2),
	\+(Author1 = Author2).

/*This rule is true if the Book parameter only has a single author*/
single_author(Book) :-
	book_author(Book, Author),
	\+(has_other_author(Book, Author)).

/*This rule is true if the number of authors for the for the Book parameter matches the NumAuthors parameter*/
number_of_authors(Book, NumAuthors) :-
        setof(Author,book_author(Book,Author),Set), length(Set,NumAuthors).

