# I solved this with the sample inputs inline so I could start to understand elixir syntax
sample = [199,200,208,210,200,207,240,269,260,263]

partOneSampleResult = Enum.reduce(sample, {-1, 0}, fn(measurement, {previousMeasurement, count}) ->
    if previousMeasurement > 0 && measurement > previousMeasurement do
        {measurement, count + 1}
    else
        {measurement, count}
    end
end)
IO.puts(elem(partOneSampleResult, 1))

partTwoSampleResult = Enum.chunk_every(sample, 3, 1)
|> Enum.map(fn(window) -> Enum.sum(window) end)
|> Enum.reduce({-1, 0}, fn(measurement, {previousMeasurement, count}) ->
    if previousMeasurement > 0 && measurement > previousMeasurement do
        {measurement, count + 1}
    else
        {measurement, count}
    end
end)
IO.puts(elem(partTwoSampleResult, 1))

# I don't want to deal with user input or relative paths right now, so magic strings are acceptable
partOneResult = File.stream!("/mnt/c/Users/lee-h/source/repos/AoC2021.iex/DayOneInput.txt")
|> Stream.map(fn (line) ->
    # I didn't find anything like int.TryParse (C#) and this works, I'm sure this is a better way to do it tho
    case Integer.parse(String.trim(line)) do
    {n, ""} -> n
    _ -> nil
    end
end)
|> Enum.to_list()
|> Enum.reduce({-1, 0}, fn(measurement, {previousMeasurement, count}) ->
    # I felt like some sort of pattern matching could have been used to simplify this, but I couldn't figure it out so instead we have flow control
    if previousMeasurement > 0 && measurement > previousMeasurement do
        {measurement, count + 1}
    else
        {measurement, count}
    end
end)
IO.puts(elem(partOneResult, 1))

partTwoResult = File.stream!("/mnt/c/Users/lee-h/source/repos/AoC2021.iex/DayOneInput.txt")
|> Stream.map(fn (line) ->
    # probably could have made this a named function or something, but meh.
    case Integer.parse(String.trim(line)) do
    {n, ""} -> n
    _ -> nil
    end
end)
|> Enum.to_list()
|> Enum.chunk_every(3, 1)
|> Enum.map(fn(window) -> Enum.sum(window) end)
|> Enum.reduce({-1, 0}, fn(measurement, {previousMeasurement, count}) ->
    # probably could have made this a named function or something, but meh.
    if previousMeasurement > 0 && measurement > previousMeasurement do
        {measurement, count + 1}
    else
        {measurement, count}
    end
end)
IO.puts(elem(partTwoResult, 1))
