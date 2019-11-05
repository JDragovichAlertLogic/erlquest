%% The module that handles room tasks

%% @doc Task1 Handler.
-module(rooms).

-export([show_rooms/0, add_room/1]).

show_rooms() ->
    Rooms = dets:foldl(fun ({Name, _}, Acc) -> [atom_to_list(Name) | Acc] end, [], rooms),
    {200, list_to_binary(lists:join(",", Rooms))}.

add_room(Req0) ->
    case cowboy_req:has_body(Req0) of
         true ->
            {ok, Name, _Req} = cowboy_req:read_body(Req0),
            dets:insert(rooms, {binary_to_atom(Name, utf8), []}),
            {201, <<"Room created">>};
         false ->
            {400, <<"No Room supplied">>}
    end.
