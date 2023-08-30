defmodule Compute do
  @spec compute(list) :: number()
  def compute(queue) do
    compute(queue, [])
  end

  defp compute([], [number | _number_stack]) do
    String.to_float(number)
  end

  defp compute([token | rest], number_stack) do
    case token do
      tok when tok in ["+", "-", "*", "/"] ->
        with [operand1, operand2 | number_stack] <- number_stack do
          {operand1, operand2} = {String.to_float(operand1), String.to_float(operand2)}

          case tok do
            "+" ->
              result = Float.to_string(operand1 + operand2)
              compute(rest, [result | number_stack])

            "-" ->
              result = Float.to_string(operand2 - operand1)
              compute(rest, [result | number_stack])

            "*" ->
              result = Float.to_string(operand1 * operand2)
              compute(rest, [result | number_stack])

            "/" ->
              result = Float.to_string(operand2 / operand1)
              compute(rest, [result | number_stack])
          end
        end

      tok ->
        case String.contains?(tok, ".") do
          true -> compute(rest, [tok | number_stack])
          false -> compute(rest, [<<tok::binary, ".0">> | number_stack])
        end
    end
  end
end
