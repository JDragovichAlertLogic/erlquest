%% The handler for task 1

%% @doc Task1 Handler.
-module(task1).

-export([init/2]).

init(Req0, Opts) ->
    Method = cowboy_req:method(Req0),
    {Code, Message} = check_method(Method, Req0),
    Req = cowboy_req:reply(Code, #{
            <<"content-type">> => <<"text/plain">>
    }, Message, Req0),
    {ok, Req, Opts}.

%% Write a function that takes two arguments, a binary string, and the request.
%% When the string matches <<"POST">> returnthe add_room function from the rooms module.
%% If the string is <<"GET">> return show_rooms from the same module.
%% Otherwise return {400, <<"a clever bad request message">>}.
check_method(<<"POST">>, Req0) -> rooms:add_room(Req0);
check_method(<<"GET">>, _Req0) -> rooms:show_rooms();
check_method(_Request, _Req0) -> {400, <<"Bad Request">>}.
