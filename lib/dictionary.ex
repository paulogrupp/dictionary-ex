defmodule Dictionary do
  alias Dictionary.Runtime.Server

  @spec random_word() :: String.t()
  defdelegate random_word(), to: Server

  @spec random_word(integer()) :: String.t()
  defdelegate random_word(word_length), to: Server

  @spec word_list(integer()) :: list
  defdelegate word_list(word_length), to: Server

  @spec word_list() :: list
  defdelegate word_list(), to: Server
end
