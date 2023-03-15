defmodule Dictionary do
  alias Dictionary.Runtime.Server

  @spec random_word() :: String.t()
  defdelegate random_word(), to: Server

  @spec random_word(integer()) :: String.t()
  defdelegate random_word(word_length), to: Server
end
