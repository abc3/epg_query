defmodule EpgQuery do
  alias Elixir.EpgQuery.Port

  @moduledoc """
  Documentation for `EpgQuery`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> EpgQuery.hello()
      :world

  """
  @spec parse(String.t()) :: {:ok, map()} | {:error, String.t()}
  def parse(query) do
    case Port.parse(query) do
      {:ok, json} -> Jason.decode(json)
      other -> other
    end
  end
end
