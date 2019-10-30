%% The module that handles room tasks

%% @doc Task1 Handler.
-module(rooms).

-export([show_rooms/0, add_room/1]).

show_rooms() ->
    Rooms = dets:foldl(fun ({Name, _}, Acc) -> [atom_to_list(Name) | Acc] end, [], rooms),
    list_to_binary(lists:join(",", Rooms)).

add_room(Name) when is_binary(Name)->
    dets:insert(rooms, binary_to_atom(Name, utf8)).
