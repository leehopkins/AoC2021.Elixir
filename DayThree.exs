# I needed a lot of help with this one
# credit to https://github.com/hvenables/advent_of_code_2021/blob/master/day_3/day_3.exs

lines = File.stream!("/mnt/c/Users/lee-h/source/repos/AoC2021.iex/DayThreeInput.txt")
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn(line) -> Enum.at(String.split(line, "\n"), 0) end)
    |> Stream.map(fn(line) ->
        String.split(line, "", trim: true)
        |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.to_list()

line_length = length(hd(lines))
middle = length(lines) / 2

one_counts = lines
    |> Enum.reduce(List.duplicate(0, line_length), fn(line, onesAtPosition) ->
        for x <- 0..line_length - 1 do
            Enum.at(line, x) + Enum.at(onesAtPosition, x)
        end
    end)

gamma_rate =
    for x <- 0..line_length - 1 do
        if Enum.at(one_counts, x) < middle, do: 0, else: 1
    end
    |> Enum.join()
    |> String.to_integer(2)

epsilon_rate =
    for x <- 0..line_length - 1 do
        if Enum.at(one_counts, x) > middle, do: 0, else: 1
    end
    |> Enum.join()
    |> String.to_integer(2)

IO.puts("Part 1: #{gamma_rate * epsilon_rate}")


oxygen_generator_rating = Stream.unfold({lines, 0}, fn
        {[], _position} ->
            nil
        {remaining_lines, position} ->
            if position == line_length do
                {{remaining_lines, position}, {[], position + 1}}
            else
                remaining_line_count = length(remaining_lines)
                total_ones_at_position = Enum.reduce(remaining_lines, 0, fn(line, count) -> Enum.at(line, position) + count end)

                most_common_bit = if total_ones_at_position >= (remaining_line_count/2), do: 1, else: 0
                new_list = Enum.filter(remaining_lines, fn(line) -> Enum.at(line, position) == most_common_bit end)

            {{remaining_lines, position}, {new_list, position + 1}}
        end
    end)
    |> Enum.to_list()
    |> List.last()
    |> elem(0)
    |> Enum.at(0)
    |> Enum.join()
    |> String.to_integer(2)

c02_scrubber_rating = Stream.unfold({lines, 0}, fn
        {[], _position} ->
            nil
        {remaining_lines, position} ->
            if position == line_length do
                {{remaining_lines, position}, {[], position + 1}}
            else
                remaining_line_count = length(remaining_lines)
                total_ones_at_position = Enum.reduce(remaining_lines, 0, fn(line, count) -> Enum.at(line, position) + count end)

                most_common_bit = if total_ones_at_position < (remaining_line_count/2), do: 1, else: 0
                new_list = Enum.filter(remaining_lines, fn(line) -> Enum.at(line, position) == most_common_bit end)
            {{remaining_lines, position}, {new_list, position + 1}}
        end
    end)
    |> Enum.to_list()
    |> List.last()
    |> elem(0)
    |> Enum.at(0)
    |> Enum.join()
    |> String.to_integer(2)

IO.puts("Part 2: #{oxygen_generator_rating * c02_scrubber_rating}")
