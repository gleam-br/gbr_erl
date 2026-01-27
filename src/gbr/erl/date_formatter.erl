-module(date_formatter).
-export([formatted_date/0]).

formatted_date() ->
    {{Y,M,D}, _} = calendar:local_time(),
    lists:flatten(io_lib:format("~B-~2..0B-~2..0B", [Y,M,D])).
