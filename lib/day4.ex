defmodule Day4 do
  def parse_pairs(pair_str) do
    pair_str
    |> String.split(",")
    |> Enum.flat_map(&String.split(&1, "-"))
    |> Enum.map(&String.to_integer(&1, 10))
  end

  defp overlaps_fully?([start1, end1, start2, end2]) do
    (start1 <= start2 and end2 <= end1) or
      (start2 <= start1 and end1 <= end2)
  end

  defp overlaps?([start1, end1, start2, end2]) do
    !(end1 < start2 or end2 < start1)
  end

  def part1() do
    Util.read_lines("priv/day4.txt")
    |> Enum.map(&parse_pairs/1)
    |> Enum.filter(&overlaps_fully?/1)
    |> Enum.count()
  end

  def part2() do
    Util.read_lines("priv/day4.txt")
    |> Enum.map(&parse_pairs/1)
    |> Enum.filter(&overlaps?/1)
    |> Enum.count()
  end
end
