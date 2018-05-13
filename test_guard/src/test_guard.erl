%%%-------------------------------------------------------------------
%%% @author Fisher
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 五月 2018 下午1:08
%%%-------------------------------------------------------------------
-module(test_guard).
-author("Fisher").

%% API
-export([test_guard_zero/1]).
-export([test_guard_andalso/1, test_guard_orelse/1]).
-export([test_guard_and/1, test_guard_or/1]).
-export([test_guard_comma/1, test_guard_semicolon/1]).

test_guard_zero(X) when not ((X rem 0) =:= 0) ->
    io:format("0 can't pass~n");
test_guard_zero(_X) ->
    io:format("zero~n").

test_guard_andalso(X) when not(X =/= 0 andalso ((X / 0) =:= 0)) ->
    io:format("andalso 0 can pass~n").
test_guard_orelse(X) when X =:= 0 orelse ((10 rem X) =:= 0) ->
    io:format("orelse 0 can pass~n").

test_guard_and(X) when not(X =/= 0 and ((X / 0) =:= 0)) ->
    io:format("and when X = 0 will exception error~n").
test_guard_or(X) when X =:= 0 or ((10 rem X) =:= 0) ->
    io:format("or when X = 0 will exception error.~n").

%%test_guard_comma(X) when not(X =/= 0, (10 rem X =:= 0)) ->
test_guard_comma(X) when X =/= 0, (10 rem X =:= 0) ->
    io:format("comma useless ~n");
test_guard_comma(_X) ->
    io:format("can't judge").
test_guard_semicolon(X) when X =:= 0; X rem 0 =:= 0 ->
    io:format("semicolon 0 can pass~n").