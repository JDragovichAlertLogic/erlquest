%% The handler for task 2

%% @doc Task2 Handler.
-module(task2).

-export([init/2]).

init(Req0, Opts) ->
    Method = cowboy_req:method(Req0),
    {Code, Message} = check_method(Method, Req0),
    Req = cowboy_req:reply(Code, #{
            <<"content-type">> => <<"text/plain">>
    }, Message, Req0),
    {ok, Req, Opts}.

check_method(<<"POST">>, Req0) -> messages:add_message(Req0);
check_method(<<"GET">>, Req0) ->
    Room = cowboy_req:binding(room, Req0),
    Messages = messages:show_messages(binary_to_atom(Room, utf8)),
    get_messages(Messages);
check_method(_Request, _Req0) -> {400, <<"Bad Request">>}.

%% Write a function here that takes a list of messages and creates one large binary string separated by newlines (\n)
%% each message is a tuple of strings like {<<"Users">>, <<"Message">>}
get_messages(Messages) -> get_messages(<<"">>, Messages).
get_messages(Acc, [{User, Message} | Messages]) ->
    get_messages(list_to_binary([User, <<": ">>, Message, <<"\n">> | Acc]), Messages);
get_messages(Acc, []) -> {200, Acc}.
