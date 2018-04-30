-module(trnc_sup).

-behaviour(supervisor).

-export([start_link/0, start_link/1]).

-export([init/1]).

start_link() ->
  start_link([]).

start_link(_Args) ->
    io:format("~s start_link~n", [?MODULE]),
    {ok, Sup} = supervisor:start_link({local, ?MODULE}, ?MODULE, []),
    {ok, Sup}.

init(_Args) ->
    ChildSpec = {temporary, {trnc, start_link, []}, temporary, 1000, worker, [trnc]},
    {ok, {{one_for_one, 3, 10}, [ChildSpec]}}.
