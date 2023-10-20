-module(simple_loop).

-export([hello_world/0]).
-export([create_list/0]).
-export([complex_list_rec/0]).
-export([complex_list_rec_val/0]).
-export([get_list_size/1]).
-export([get_record/1, print_list_of_map/1]).

hello_world() ->
    io:format("Hello world!").

create_list() ->
    List = [X || X <- [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], X rem 2 =:= 0],
    List.

complex_list_rec() ->
    List = [begin #{paramId => 0, paramValue => 0} end || _ <- lists:seq(1, 29)],
    List.

complex_list_rec_val() ->
    List = [#{paramId => N, paramValue => N} || N <- lists:seq(1, 29)],
    List.

get_list_size(List) ->
    get_list_size(List, 0).
get_list_size([First| Rest], Count) ->
    #{paramId := Id, paramValue := _} = First,
    if (Id =/= 0) ->
        get_list_size(Rest, Count+1);
    true ->
        get_list_size(Rest, Count)
    end;
get_list_size([], Count) ->
    Count.

get_record(PrototypeEntryList) ->
    PrototypeEntryListElCount = length([Record || Record = #{paramId := Id} <- PrototypeEntryList, Id /= 0]),
    PrototypeEntryListElCount.

print_list_of_map(List) ->
    io:format(List).