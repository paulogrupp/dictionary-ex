defmodule Dictionary.Impl.WordList do
  @type t :: list(String.t())

  @spec word_list :: t
  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/, trim: true)
  end

  @spec random_word(t) :: String.t()
  def random_word(word_list) do
    word_list
    |> Enum.random()
  end

  def random_word(word_list, word_length) do
    word_list
    |> filter_by_length(word_length)
    |> Enum.random()
  end

  def filter_by_length(words, length) do
    Enum.filter(words, fn word -> String.length(word) == length end)
  end
end
