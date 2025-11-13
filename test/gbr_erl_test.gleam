import gleeunit

pub fn main() -> Nil {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn gbr_erl_todo_test() {
  let name = "Gleam BR erlang"
  let greeting = "Hello, " <> name <> "!"

  assert greeting == "Hello, Gleam BR erlang!"
}
