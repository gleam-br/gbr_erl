# 🍀 Gleam erlang library.

Erlang library to gleam by @gleam-br.

[![Package Version](https://img.shields.io/hexpm/v/gbr_erl)](https://hex.pm/packages/gbr_erl)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gbr_erl/)

```sh
gleam add gbr_erl@1
```

Example: Zip files only in memory:

```gleam
import gbr/erl
import gbr/erl/zip

pub fn main() -> Nil {
  let zip =
    erl.zip("compact.zip", ["./src/erl/zip.gleam"])
      |> zip.memory()
      |> zip.comment("Comment zip file")
      |> zip.cwd(".")
      |> zip.zip()

  case zip {
    Ok(zip.File(name, binary)) -> {
      todo
      //let converted = bytes_tree.from_string(binary)
      //wisp.response(200)
      //|> wisp.file_download_from_memory(name, converted)
    }
    Error(_error) -> {
      todo
      //wisp.internal_server_error()
    }
  }
}
```

Further documentation can be found at <https://hexdocs.pm/gbr_erl>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

## 🌄 Roadmap

- [ ] First functions
- [ ] Unit tests
- [ ] More docs
- [ ] GH workflow
  - [ ] test & build
  - [ ] changelog & publish
