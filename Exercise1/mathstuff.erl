-module(mathstuff).

-export([get_form/1]).

get_form({square,Side}) -> Side*Side;
get_form({circle,Radius}) -> 2*3.14*Radius;
get_form({triangle,A,B,C}) -> A*B*C;
get_form({_,_}) -> "Nothing Matched".