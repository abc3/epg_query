query = "select * from Erlang"

Benchee.run(
  %{
    "EpgQuery.Port.parse/1" => fn -> Elixir.EpgQuery.Port.parse(query) end,
    "EpgQuery.parse/1" => fn -> EpgQuery.parse(query) end
  }
)
