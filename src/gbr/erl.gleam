////
//// Gleam erlang library by @gleam-br
////

import gbr/erl/zip

/// Zip type see zip module
///
pub const zip = zip.new

@external(erlang, "date_formatter", "formatted_date")
pub fn get_formatted_date() -> String