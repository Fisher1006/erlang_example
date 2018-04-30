-module(trnc_app).

-behavior(application).

-include("trnc.hrl").

-export([start/0, stop/0]).

-export([start/2, stop/1]).

start() ->
    io:format("~s start Apps:~p~n", [?MODULE, ?APPS]),
    [ok = application:start(App) || App <- ?APPS],
    ok.

stop() ->
    io:format("~s stop the Application~n", [?MODULE]),
    [ok = application:stop(App) || App <- ?APPS],
    ok.

start(_StartType, _StartArgs) ->
    io:format("~s start supervisor~n", [?MODULE]),
    {ok, Sup} = trnc_sup:start_link(),
    {ok, Sup}.

stop(_State) ->
    io:format("~s stop application~n", [?MODULE]),
    ok.