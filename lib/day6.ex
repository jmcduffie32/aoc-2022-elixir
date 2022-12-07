defmodule Day6 do
  def find_marker([head | tail], index, len) do
    if Enum.count(MapSet.new(head)) === len do
      index + len
    else
      find_marker(tail, index + 1, len)
    end
  end

  def solve(len) do
    "priv/day6.txt"
    |> File.read!()
    |> String.graphemes()
    |> Enum.chunk_every(len, 1)
    |> find_marker(0, len)
  end
end
