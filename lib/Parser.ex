defmodule Parser do
  @spec parse(list) :: list
  def parse([]) do
    []
  end

  def parse([token | rest]) do
    case token do
      tok when tok in ["+", "-", "*", "/"] -> [tok | parse(rest)]
      _ -> parse(rest)
    end
  end
end
