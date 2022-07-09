defmodule EpgQuery.Port do
  use Rustler, otp_app: :epg_query, crate: "epgquery_port"

  # When your NIF is loaded, it will override this function.
  def parse(_query), do: :erlang.nif_error(:nif_not_loaded)
end
