%% The app files where we start the app and initalize the router

%% @private
-module(erlquest_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
    dets:open_file(rooms, [{file, "rooms.dets"}, {type,set}, {auto_save, 1000}]),
    Dispatch = cowboy_router:compile([
            {'_', [
                    {"/", toppage_h, []},
                    {"/rooms", task1, []},
                    {"/messages/:room", task2, []}
            ]}
    ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
            env => #{dispatch => Dispatch}
    }),
    erlquest_sup:start_link().

stop(_State) ->
    ok = cowboy:stop_listener(http).
