# EpgQuery



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `epg_query` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:epg_query, "~> 0.1.0", git: "https://github.com/abc3/epg_query"}
  ]
end
```



## Usage

```bash
mix deps.get
make dev
```

```elixir
iex(1)> EpgQuery.parse("select * from some_table")
{:ok,
 %{
   "stmts" => [
     %{
       "stmt" => %{
         "SelectStmt" => %{
           "fromClause" => [
             %{
               "RangeVar" => %{
                 "inh" => true,
                 "location" => 14,
                 "relname" => "some_table",
                 "relpersistence" => "p"
               }
             }
           ],
           "limitOption" => "LIMIT_OPTION_DEFAULT",
           "op" => "SETOP_NONE",
           "targetList" => [
             %{
               "ResTarget" => %{
                 "location" => 7,
                 "val" => %{
                   "ColumnRef" => %{
                     "fields" => [%{"A_Star" => %{}}],
                     "location" => 7
                   }
                 }
               }
             }
           ]
         }
       }
     }
   ],
   "version" => 130003
 }}

```

## Benchmarks

```
Operating System: macOS
CPU Information: Apple M1 Pro
Number of Available Cores: 10
Available memory: 16 GB
Elixir 1.13.4
Erlang 25.0

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
reduction time: 0 ns
parallel: 1
inputs: none specified
Estimated total run time: 14 s

Benchmarking EpgQuery.Port.parse/1 ...
Benchmarking EpgQuery.parse/1 ...

Name                            ips        average  deviation         median         99th %
EpgQuery.Port.parse/1      188.41 K        5.31 μs   ±177.95%        5.21 μs        5.63 μs
EpgQuery.parse/1           108.99 K        9.18 μs   ±151.19%        8.88 μs       13.79 μs

Comparison: 
EpgQuery.Port.parse/1      188.41 K
EpgQuery.parse/1           108.99 K - 1.73x slower +3.87 μs
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/epg_query>.

