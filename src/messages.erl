%% The module that handles messages tasks

%% @doc Messages Module.
-module(messages).

-export([show_messages/1, add_message/1]).

show_messages(Room) ->
    [{Room, Messages}] = dets:lookup(rooms, Room),
    Messages.

add_message(Req0)->
    Room = cowboy_req:binding(room, Req0),
    case cowboy_req:has_body(Req0) of
         true ->
            {ok, Message, _Req} = cowboy_req:read_body(Req0),
            AtRoom = binary_to_atom(Room, utf8),
            [{AtRoom, OldMessages}] = dets:lookup(rooms, AtRoom),
            NewMessages = OldMessages ++ [{<<"John Doe">>, Message}],
            dets:insert(rooms, {AtRoom, NewMessages}),
            {201, <<"Message Added">>};
         false ->
            {400, <<"No Message">>}
    end.

