%% The handler for task 1

%% @doc Task1 Handler.
-module(task1).

-export([init/2]).

init(Req0, Opts) ->
    Method = cowboy_req:method(Req0),
    {Code, Message} = check_method(Method),
    Req = cowboy_req:reply(Code, #{
            <<"content-type">> => <<"text/plain">>
    }, Message, Req0),
    {ok, Req, Opts}.

%% Write a function that takes one argument, a binary string, when the string matches <<"POST">> return a tuple {200, <<"some cool message">>}, otherwise return {400, <<"a clever bad request message">>}.
check_method(_Request) -> {200, rooms:show_rooms()}.
