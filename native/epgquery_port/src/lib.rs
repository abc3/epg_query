use rustler::NifTuple;
use rustler::NifResult;
use rustler::Atom;

mod atoms {
    rustler::atoms! {
      ok,
      error,
    }
}

#[derive(NifTuple)]
struct Response {
    status: Atom,
    message: String,
}

#[rustler::nif]
fn parse(query: &str) -> NifResult<Response> {
    let result = pg_parse::parse_to_json(&query);

    match result {
        Ok(v) => Ok(Response{status: atoms::ok(), message: v}),
        Err(v) => Ok(Response{status: atoms::error(), message: v.to_string()}),
    }
}

rustler::init!("Elixir.EpgQuery.Port", [parse]);
