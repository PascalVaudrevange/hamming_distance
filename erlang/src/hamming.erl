-module(hamming).
-export([hamming_distance/2]).
-include_lib("eunit/include/eunit.hrl").

popcount(N) -> 
    popcount(N, 0).

popcount(0, Acc) ->
    Acc;
popcount(N, Acc) ->
    popcount(N div 2, Acc + N rem 2).

hamming_distance(X, Y) -> 
    Xb = binary:bin_to_list(unicode:characters_to_binary(X)),
    Yb = binary:bin_to_list(unicode:characters_to_binary(Y)),
    popcount(Xb bxor Yb).

hamming_distance_0_test() -> 0 = hamming:hamming_distance("123", "123").
hamming_distance_1_test() -> 1 = hamming:hamming_distance("023", "123").
hamming_distance_2_test() -> 2 = hamming:hamming_distance("102", "132").