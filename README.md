# 🍀 Gleam erlang library.

🚧 **Work in progress** not production ready.

Erlang library to gleam by @gleam-br.

[![Package Version](https://img.shields.io/hexpm/v/gbr_erl)](https://hex.pm/packages/gbr_erl)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gbr_erl/)

```sh
gleam add gbr_erl@1
```

```gleam
import gbr/erl

pub fn main() -> Nil {
  erl.try()
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
