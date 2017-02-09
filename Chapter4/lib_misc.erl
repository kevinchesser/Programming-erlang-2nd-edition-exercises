-module(lib_misc).
-export([for/3,pythag/1,odds_and_evens2/1, quicksort/1]).

for(Max, Max, F) ->
    [F(Max)];
for(I, Max, F) ->
    [F(I)|for(I+1, Max, F)].

quicksort([]) ->
    [];
quicksort([Pivot|T]) ->
    quicksort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    quicksort([X || X <- T, X >= Pivot]).

pythag(N) ->
    [ {A,B,C} || A <- lists:seq(1,N),
                 B <- lists:seq(1,N),
                 C <- lists:seq(1,N),
                 A+B+C =< N,
                 A*A+B*B =:= C*C
    ].

perms([]) ->
    [[]];
perms(L) ->
    [[H|T] || H <- L, T <- perms(L--[H])].

odds_and_evens1(L) ->
    %Inefficent solution since the list must be travered twice
    Odds = [X || X <- L, (X rem 2) =:= 1],
    Evens = [Y || Y <- L, (Y rem 2) =:= 0],
    {Odds, Evens}.

odds_and_evens2(L) -> %More efficient since it only traverses the list once
    odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
    case (H rem 2) of
        1 -> odds_and_evens_acc(T, [H|Odds], Evens);
        0 -> odds_and_evens_acc(T, Odds, [H|Evens])
    end;
odds_and_evens_acc([], Odds, Evens) ->
    {lists:reverse(Odds), lists:reverse(Evens)}.
    %Only need to reverse if you care about the lists being in the right order
