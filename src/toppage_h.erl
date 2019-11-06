%% The handler that exposes the API

%% @doc Hello world handler.
-module(toppage_h).

-export([init/2]).

init(Req0, Opts) ->
	Req = cowboy_req:reply(200, #{
		<<"content-type">> => <<"text/plain">>
	}, <<"Welcome to Erlquest!">>, Req0),
	{ok, Req, Opts}.
