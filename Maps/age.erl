-module(age).

-export([getAge/1]).

getAge(Name, AddAge) ->
  AgeMap =
    #{"Alice" => 23,
      "Bob" => 42,
      "Carol" => 17},
  % maps:get(Name, AgeMap, -1),
  maps:foreach(fun(K, V) ->
                  if K == Name ->
                    io:format("Key:~p, Value:~p ~n", [K, V+AddAge]);
                  true ->
                    io:format("Didn't matched the Name:~p", Name)
                  end
               end, AgeMap).
