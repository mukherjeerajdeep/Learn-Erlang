-module(time).

-export([swedish_date/0]).

swedish_date() ->
    {Year, Month, Day} = date(),
    lists:nthtail(2, integer_to_list(Year)) ++ integer_to_list(Month) ++ integer_to_list(Day).
