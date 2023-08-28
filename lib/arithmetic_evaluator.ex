defmodule ArithmeticEvaluator do
  @moduledoc """
  A simple shunting yard evaluator in Elixir
  """

  @doc """
  """
  @spec run(str :: String.t()) :: [String.t()]
  def run(str) do
    Tokenizer.tokenize(str)
    |> Parser.parse()
  end
end
