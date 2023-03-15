defmodule DictionaryTest do
  use ExUnit.Case
  doctest Dictionary

  test "returns a word with the specified length" do
    word_lengths = [5, 7, 10]

    Enum.each(word_lengths, fn word_length ->
      word = Dictionary.random_word(word_length)
      assert String.length(word) == word_length
    end)
  end
end
