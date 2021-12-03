partOneResult = File.stream!("/mnt/c/Users/lee-h/source/repos/AoC2021.iex/DayTwoInput.txt")
|> Stream.map(fn(line) ->
    splits = String.split(String.trim(line))
    {Enum.at(splits, 0), Integer.parse(Enum.at(splits, 1))}
end)
|> Enum.to_list()
|> Enum.reduce({0, 0}, fn(cmd, {depth, horizontal}) ->
    case cmd do
        # so treating x as tuple does work, I'm not sure why it wasn't before (probably user error)
        # but really I have no idea why x is tuple here...
        {"forward", x} -> {depth, horizontal + elem(x, 0)}
        {"down", x} -> {depth + elem(x, 0), horizontal}
        {"up", x} -> {depth - elem(x, 0), horizontal}
        _ -> {depth, horizontal}
    end
end)

IO.puts(elem(partOneResult, 0) * elem(partOneResult, 1))

partTwoResult = File.stream!("/mnt/c/Users/lee-h/source/repos/AoC2021.iex/DayTwoInput.txt")
|> Stream.map(fn(line) ->
    splits = String.split(String.trim(line))
    {Enum.at(splits, 0), Integer.parse(Enum.at(splits, 1))}
end)
|> Enum.to_list()
|> Enum.reduce({0, 0, 0}, fn(cmd, {depth, horizontal, aim}) ->
    case cmd do
        {"forward", x} -> {depth + aim * elem(x, 0), horizontal + elem(x, 0), aim}
        {"down", x} -> {depth, horizontal, aim + elem(x, 0)}
        {"up", x} -> {depth, horizontal, aim -  elem(x, 0)}
        _ -> {depth, horizontal, aim}
    end
end)

IO.puts(elem(partTwoResult, 0) * elem(partTwoResult, 1))
