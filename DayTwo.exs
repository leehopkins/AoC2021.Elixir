partOneResult = File.stream!("/mnt/c/Users/lee-h/source/repos/AoC2021.iex/DayTwoInput.txt")
|> Stream.map(fn(line) ->
    splits = String.split(String.trim(line))
    {Enum.at(splits, 0), elem(Integer.parse(Enum.at(splits, 1)), 0)}
end)
|> Enum.to_list()
|> Enum.reduce({0, 0}, fn(cmd, {depth, horizontal}) ->
    case cmd do
        {"forward", x} -> {depth, horizontal + x}
        {"down", x} -> {depth + x, horizontal}
        {"up", x} -> {depth - x, horizontal}
        _ -> {depth, horizontal}
    end
end)

IO.puts(elem(partOneResult, 0) * elem(partOneResult, 1))

partTwoResult = File.stream!("/mnt/c/Users/lee-h/source/repos/AoC2021.iex/DayTwoInput.txt")
|> Stream.map(fn(line) ->
    splits = String.split(String.trim(line))
    {Enum.at(splits, 0), elem(Integer.parse(Enum.at(splits, 1)), 0)}
end)
|> Enum.to_list()
|> Enum.reduce({0, 0, 0}, fn(cmd, {depth, horizontal, aim}) ->
    case cmd do
        {"forward", x} -> {depth + aim * x, horizontal + x, aim}
        {"down", x} -> {depth, horizontal, aim + x}
        {"up", x} -> {depth, horizontal, aim - x}
        _ -> {depth, horizontal, aim}
    end
end)

IO.puts(elem(partTwoResult, 0) * elem(partTwoResult, 1))
