-module(listminmax).
-export([get_max/1, get_min/1, get_min_max/1]).

get_max(L) when is_list(L)->  % [4,1,7,3,9,10]
    [H|T] = L, % H = 4 , T = [1,7,3,9,10]
    get_max(H,T).

get_max(Max,[H|T]) -> % Max = 4, H = 1, T = [7,3,9,10]
    MaxVal = if Max > H -> 
                    Max;
                true ->
                    H
                end,
    get_max(MaxVal, T);
get_max(Max,[]) -> Max.

get_min(L) when is_list(L)->  % [4,1,7,3,9,10]
    [H|T] = L, % H = 4 , T = [1,7,3,9,10]
    get_min(H,T).

get_min(Min,[H|T]) -> % Max = 4, H = 1, T = [7,3,9,10]
    if Min < H -> 
        get_min(Min, T);
    true ->
        get_min(H, T)
    end;
get_min(Min,[]) -> Min.

get_min_max(L) when is_list(L) ->
    {get_max(L), get_min(L)}.