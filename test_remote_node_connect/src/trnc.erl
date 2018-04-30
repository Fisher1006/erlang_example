-module(trnc).

-behaviour(gen_server).

-export([test/1]).

-export([start_link/0]).

-export([
    init/1,
    terminate/2,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    code_change/3
]).

test(Req) ->
    io:format("~s exec function test~n", [?MODULE]),
    % erlang:send(self(), Args),
    Reply = gen_server:call(?MODULE, Req),
    io:format("Reply:~s~n", [Reply]),
  ok.

start_link() ->
    io:format("~s start server~n", [?MODULE]),
    {ok, Pid} = gen_server:start_link({local, ?MODULE}, ?MODULE, [], []),
    {ok, Pid}.

init(_Args) ->
    io:format("~s init...", [?MODULE]),
    erlang:process_flag(trap_exit, true),
    {ok, {}}.

terminate(Reason, _State) ->
    io:format("~s terminate Reason:~p!~n", [?MODULE, Reason]),
    ok.

handle_call(Request, From, State) ->
    io:format("~s receive call req:~p, from:~p~n", [?MODULE, Request, From]),
    Replay = io_lib:format("received you call request:~p~n", [Request]),
    {reply, Replay, State}.

handle_cast(Request, State) ->
    io:format("~s receive cast req:~p~n", [?MODULE, Request]),
    {noreply, State}.

handle_info(Info, State) ->
    io:format("~s receive info:~p~n", [?MODULE, Info]),
    {noreply, State}.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
