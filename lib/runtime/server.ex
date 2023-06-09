defmodule Dictionary.Runtime.Server do
  @type t :: pid()
  @me __MODULE__

  use Agent

  alias Dictionary.Impl.WordList

  def start_link(_) do
    Agent.start_link(&WordList.word_list/0, name: @me)
  end

  def random_word do
    Agent.get(@me, &WordList.random_word/1)
  end

  def random_word(word_length) do
    Agent.get(@me, fn word_list -> WordList.random_word(word_list, word_length) end)
  end

  def word_list(word_length) do
    Agent.get(@me, & &1)
    |> WordList.filter_by_length(word_length)
  end

  def word_list() do
    Agent.get(@me, & &1)
  end
end
