query = "select * from Erlang"

Benchee.run(
  %{
    "nif response" => fn -> Elixir.EpgQuery.Port.parse(query) end,
    "nif response + json decode" => fn -> EpgQuery.parse(query) end
  }
)
