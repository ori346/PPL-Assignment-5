:- module('ex5',
        [author/2,
         genre/2,
         book/4
        ]).

/*
 * **********************************************
 * Printing result depth
 *
 * You can enlarge it, if needed.
 * **********************************************
 */
maximum_printing_depth(100).
:- current_prolog_flag(toplevel_print_options, A),
   (select(max_depth(_), A, B), ! ; A = B),
   maximum_printing_depth(MPD),
   set_prolog_flag(toplevel_print_options, [max_depth(MPD)|B]).



author(1, "Isaac Asimov").
author(2, "Frank Herbert").
author(3, "William Morris").
author(4, "J.R.R Tolkein").


genre(1, "Science").
genre(2, "Literature").
genre(3, "Science Fiction").
genre(4, "Fantasy").

book("Inside The Atom", 1, 1, 500).
book("Asimov's Guide To Shakespeare", 1, 2, 400).
book("I, Robot", 1, 3, 450).
book("Dune", 2, 3, 550).
book("The Well at the World's End", 3, 4, 400).
book("The Hobbit", 4, 4, 250).
book("The Lord of the Rings", 4, 4, 1250).

% You can add more facts.
% Fill in the Purpose, Signature as requested in the instructions here
authorOfGenre(GenreName, AuthorName):-author(Id,AuthorName)
    		,book(BookName ,Id,GenreId , _X),genre(GenreId , GenreName).
%max of list
max_l([X],X) :- !, true.
%max_l([X],X). %unuse cut
%max_l([X],X):- false.
max_l([X|Xs], M):- max_l(Xs, M), M >= X.
max_l([X|Xs], X):- max_l(Xs, M), X >  M.

longestBook(AuthorId, BookName):- findall(Length , book(_X , AuthorId ,_G , Length), Result),
    max_list(Result ,Y), 
    book(BookName , AuthorId ,_G ,Y) .

versatileAuthor(AuthorName):-author(Id, AuthorName),
    						findall(Genre , book(_N , Id , Genre ,_L) ,Result) 
    						, length( Result ,X) , X > 2. 