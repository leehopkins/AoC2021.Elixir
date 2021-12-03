partOneResult = File.stream!("/mnt/c/Users/lee-h/source/repos/AoC2021.iex/DayTwoInput.txt")
|> Stream.map(fn(line) ->
    # I tried a couple different iterations of splitting and parsing, this has produced the most consistent results
    splits = String.split(String.trim(line));
    # originally I was not trimming, parsing, and transposing to a tuple and instead just using the
    # list returned by String.split, but that was causing some access issues in the reduce below
    {Enum.at(splits, 0), Integer.parse(Enum.at(splits, 1))}
end)
|> Enum.to_list()
|> Enum.reduce({0, 0}, fn(cmd, {depth, horizontal}) ->
    case cmd do
        # x here is acting like a tuple and returning {2, ""} and I can't figure out why
        # If I call is_tuple(x) it returns false
        # if I try elem(x, 0) it says its not a tuple and throws an exception
        {"forward", x} -> {depth, horizontal + x}
        {"down", x} -> {depth + x, horizontal}
        {"up", x} -> {depth - x, horizontal}
        _ -> {depth, horizontal}
    end
end)

IO.puts(elem(partOneResult, 0) * elem(partOneResult, 1))
