defmodule Day2 do
  defp read_file do
    "priv/day2.txt"
    |> File.read!()
    |> String.trim_trailing()
    |> String.split("\n")
  end

  defp parse_shape("A"), do: 1
  defp parse_shape("B"), do: 2
  defp parse_shape("C"), do: 3
  defp parse_shape("X"), do: 1
  defp parse_shape("Y"), do: 2
  defp parse_shape("Z"), do: 3

  def score_round([op, you]) do
    Stream.cycle([6, 0, 3])
    |> Stream.drop(you - op + 2)
    |> Enum.at(0)
    |> Kernel.+(you)
  end

  defp parse_round(str_line) do
    str_line
    |> String.split(" ")
    |> Enum.map(&parse_shape/1)
  end

  def part1 do
    read_file()
    |> Enum.map(&parse_round/1)
    |> Enum.map(&score_round/1)
    |> Enum.sum()
  end

  # magic offset is annoying, but I don't feel
  # like messing with it anymore
  defp get_offset(1), do: 1
  defp get_offset(2), do: -1
  defp get_offset(3), do: 0

  defp choose_shape([op, outcome]) do
    [op, rem(op + get_offset(outcome), 3) + 1]
  end

  def part2 do
    read_file()
    |> Enum.map(&parse_round/1)
    |> Enum.map(&choose_shape/1)
    |> Enum.map(&score_round/1)
    |> Enum.sum()
  end
end
