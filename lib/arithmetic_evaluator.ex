defmodule ArithmeticEvaluator do
  @moduledoc """
  A simple shunting yard evaluator in Elixir
  """

  @doc """
  """
  @spec run() :: :ok
  def run() do
    str = IO.gets("Enter the expression: ")

    rpn =
      str
      |> Tokenizer.tokenize()
      |> Parser.parse()

    IO.puts("Generated RPN: ")
    IO.inspect(rpn)

    IO.puts("Result: #{Compute.compute(rpn)}")
  end
end
