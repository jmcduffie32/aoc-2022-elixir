defmodule Day1 do
  defp elf_calories do
    "priv/day1.txt"
    |> File.read!()
    |> String.trim_trailing()
    |> String.split("\n\n")
    |> Enum.map(&String.split(&1, "\n"))
    |> Enum.map(fn v -> Enum.sum(Enum.map(v, &String.to_integer/1)) end)
  end

  def part1 do
    Enum.max(elf_calories())
  end

  def part2 do
    Enum.sort(elf_calories(), :desc)
    |> Enum.take(3)
    |> Enum.sum()
  end
end
