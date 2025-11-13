-module(fvi_zip_ffi).
-export([zip/3]).

zip(ZipName, Files, Opts) ->
  ZipName2 = bin_to_list(ZipName),
  Files2 = lists:map(fun file_to_list/1, Files),
  Opts2 = lists:map(fun opt_to_list/1, Opts),
  case zip:zip(ZipName2, Files2, Opts2) of
    {ok, {Name, Bin}} -> {ok, {erlang:list_to_binary(Name), Bin}};
    error -> error
  end.

opt_to_list(Opt) ->
  case Opt of
    {comment,Comment} -> {comment, erlang:binary_to_list(Comment)};
    {cwd, Cwd} -> {cwd, erlang:binary_to_list(Cwd)};
    {compress, all} -> {commpress, all};
    {compress, What} -> {commpress, lists:map(fun erlang:binary_to_list/1, What)};
    {uncompress, What} -> {uncommpress, lists:map(fun erlang:binary_to_list/1, What)};
    Other -> Other
  end.

file_to_list({Value, Rest}) -> 
  {bin_to_list(Value), Rest}.

bin_to_list(Value) -> 
  erlang:binary_to_list(Value).
