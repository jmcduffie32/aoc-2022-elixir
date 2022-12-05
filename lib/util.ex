defmodule Util do
  def read_lines(filename) do
    File.read!(filename)
    |> String.trim_trailing()
    |> String.split("\n")
  end
end
