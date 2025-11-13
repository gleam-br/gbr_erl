////
//// Gleam erlang zip module:
////
//// ```gleam
////  import gbr/erl
////  import gbr/erl/zip
////
////  pub fn main() -> Nil {
////   let zip =
////     erl.zip("compact.zip", ["./src/erl/zip.gleam"])
////       |> zip.memory()
////       |> zip.comment("Comment zip file")
////       |> zip.cwd(".")
////       |> zip.zip()
////
////  case zip {
////     Ok(zip.File(name, binary)) -> {
////       todo
////     }
////     Error(_error) -> {
////       todo
////     }
////   }
////  }
//// ```
////

import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom.{type Atom}
import gleam/list

import gbr/erl/zip/option.{type What}

pub opaque type Zip {
  Zip(name: String, files: List(File), opts: List(option.Option))
}

pub type File {
  File(name: String, content: String)
}

pub fn new(file name: String, from files: List(File)) -> Zip {
  Zip(name:, files:, opts: [])
}

pub fn cooked(zip: Zip) -> Zip {
  let opts = option.cooked(zip.opts)
  Zip(..zip, opts:)
}

pub fn memory(zip: Zip) -> Zip {
  let opts = option.memory(zip.opts)
  Zip(..zip, opts:)
}

pub fn verbose(zip: Zip) -> Zip {
  let opts = option.verbose(zip.opts)
  Zip(..zip, opts:)
}

pub fn comment(zip: Zip, comment: String) -> Zip {
  let opts = option.comment(zip.opts, comment)
  Zip(..zip, opts:)
}

pub fn cwd(in zip: Zip, cwd dir: String) -> Zip {
  let opts = option.cwd(zip.opts, dir)
  Zip(..zip, opts:)
}

pub fn extras(zip: Zip, extras: List(Atom)) -> Zip {
  let opts = option.extras(zip.opts, extras)
  Zip(..zip, opts:)
}

pub fn compress(zip: Zip, what: What) -> Zip {
  let opts = option.compress(zip.opts, what)
  Zip(..zip, opts:)
}

pub fn uncompress(zip: Zip, what: What) -> Zip {
  let opts = option.uncompress(zip.opts, what)
  Zip(..zip, opts:)
}

pub fn zip(from zip: Zip) -> Result(File, Atom) {
  let #(name, files, opts) = zip_to_erl(zip)

  case zip_ffi(name, files, opts) {
    Ok(#(name, content)) -> Ok(File(name:, content:))
    Error(error) -> Error(error)
  }
}

fn zip_to_erl(zip) {
  let Zip(name, files, opts) = zip
  let files =
    files
    |> list.map(fn(f) { #(f.name, f.content) })
  let opts =
    opts
    |> list.map(option.option_to_erlang)

  #(name, files, opts)
}

@external(erlang, "fvi_zip_ffi", "zip")
@external(javascript, "./zip/zip_ffi.mjs", "zip")
fn zip_ffi(
  file _name: String,
  from _files: List(#(String, String)),
  with _opts: List(Dynamic),
) -> Result(#(String, String), Atom)
