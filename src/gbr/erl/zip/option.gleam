import gleam/dynamic
import gleam/list

import gleam/erlang/atom.{type Atom}

pub type What {
  All
  Extension(List(String))
}

pub opaque type Option {
  Cooked
  Verbose
  Memory
  Comment(String)
  Directory(String)
  Extras(List(Atom))
  Compress(What)
  Uncompress(What)
}

pub fn cooked(opts: List(Option)) {
  [Cooked, ..opts]
}

pub fn verbose(opts: List(Option)) {
  [Verbose, ..opts]
}

pub fn memory(opts: List(Option)) {
  [Memory, ..opts]
}

pub fn comment(opts: List(Option), comment: String) {
  [Comment(comment), ..opts]
}

pub fn cwd(opts: List(Option), cwd: String) {
  [Directory(cwd), ..opts]
}

pub fn extras(opts: List(Option), extras: List(Atom)) {
  [Extras(extras), ..opts]
}

pub fn compress(opts: List(Option), what: What) {
  [Compress(what), ..opts]
}

pub fn uncompress(opts: List(Option), what: What) {
  [Uncompress(what), ..opts]
}

pub fn option_to_erlang(o) {
  case o {
    Cooked -> "cooked" |> atom.create() |> atom.to_dynamic()
    Verbose -> "verbose" |> atom.create() |> atom.to_dynamic()
    Memory -> "memory" |> atom.create() |> atom.to_dynamic()
    Comment(comment) ->
      [
        "comment" |> atom.create() |> atom.to_dynamic(),
        dynamic.string(comment),
      ]
      |> dynamic.array()
    Directory(cwd) ->
      [
        "cwd" |> atom.create() |> atom.to_dynamic(),
        dynamic.string(cwd),
      ]
      |> dynamic.array()
    Extras(extras) ->
      [
        "cwd" |> atom.create() |> atom.to_dynamic(),
        extras |> list.map(atom.to_dynamic) |> dynamic.list(),
      ]
      |> dynamic.array()
    Compress(what) ->
      [
        "compress" |> atom.create() |> atom.to_dynamic(),
        case what {
          All -> "all" |> atom.create() |> atom.to_dynamic()
          Extension(exts) -> exts |> list.map(dynamic.string) |> dynamic.list()
        },
      ]
      |> dynamic.array()
    Uncompress(what) ->
      [
        "uncompress" |> atom.create() |> atom.to_dynamic(),
        case what {
          All -> "all" |> atom.create() |> atom.to_dynamic()
          Extension(exts) -> exts |> list.map(dynamic.string) |> dynamic.list()
        },
      ]
      |> dynamic.array()
  }
}
