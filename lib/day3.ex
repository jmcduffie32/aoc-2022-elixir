defmodule Day3 do
  import Enum, only: [map: 2, filter: 2, sum: 1, at: 2]
  import String, only: [split: 1, split_at: 2]
  import MapSet, only: [intersection: 2]

  defp char_to_priority(ch) do
    if ch >= ?a do
      ch - 96
    else
      ch - 38
    end
  end

  defp sum_chars(ch_list) do
    ch_list
    |> map(&(char_to_priority(at(&1, 0))))
    |> sum()
  end

  defp read_data do
    "priv/day3.txt"
    |> File.read!()
    |> split()
  end

  def part1 do
    read_data()
    |> map(&split_at(&1, div(String.length(&1), 2)))
    |> map(fn {pack1, pack2} ->
      filter(to_charlist(pack1), &(&1 in to_charlist(pack2)))
    end)
    |> sum_chars()
  end

  defp find_badge([pack1, pack2, pack3]) do
    set1 = MapSet.new(to_charlist(pack1))
    set2 = MapSet.new(to_charlist(pack2))
    set3 = MapSet.new(to_charlist(pack3))

    intersection(
      intersection(set1, set2),
      intersection(set1, set3)
    )
  end

  def part2 do
    read_data()
    |> Enum.chunk_every(3)
    |> Enum.map(&find_badge/1)
    |> sum_chars()
  end
end
