defmodule Parser do
  @operator_precedence %{"+" => 1, "-" => 1, "*" => 2, "/" => 3}

  @spec parse(list) :: list

  def parse([token | rest]) do
    parse([token | rest], [], [])
  end

  def parse([], [], output_queue) do
    output_queue
    |> Enum.reverse()
  end

  def parse([], [top_op | operator_stack], output_queue) do
    parse([], operator_stack, [top_op | output_queue])
  end

  def parse([token | rest], operator_stack, output_queue) do
    case token do
      tok when tok in ["+", "-", "*", "/"] ->
        case operator_stack do
          [] ->
            parse(rest, [tok | operator_stack], output_queue)

          [top_op | operator_stack] ->
            cond do
              @operator_precedence[tok] <= @operator_precedence[top_op] ->
                parse([tok | rest], operator_stack, [top_op | output_queue])

              true ->
                parse(rest, [tok, top_op | operator_stack], output_queue)
            end
        end

      tok ->
        parse(rest, operator_stack, [tok | output_queue])
    end
  end
end
