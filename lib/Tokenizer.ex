defmodule Tokenizer do
  @spec tokenize(input :: String.t()) :: [String.t()]
  def tokenize(<<>>) do
    []
  end

  def tokenize(<<ch::utf8, rest::bitstring>>) when ch in ~c[ \n\t] do
    tokenize(rest)
  end

  def tokenize(<<ch::utf8, rest::bitstring>>) when ch in ?0..?9 do
    {digits, rest_after_digits} = read_digits(<<ch::utf8, rest::bitstring>>)
    [digits | tokenize(rest_after_digits)]
  end

  def tokenize(<<ch::utf8, rest::bitstring>>) do
    [<<ch>> | tokenize(rest)]
  end

  defp read_digits(<<ch::utf8, rest::bitstring>>) do
    read_digits(<<>>, <<ch::utf8, rest::bitstring>>)
  end

  defp read_digits(digits, <<ch::utf8, rest::bitstring>>) when ch in ?0..?9 do
    read_digits(<<digits::bitstring, ch::utf8>>, rest)
  end

  defp read_digits(digits, rest) do
    {digits, rest}
  end
end
