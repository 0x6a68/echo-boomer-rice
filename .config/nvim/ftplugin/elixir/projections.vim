let g:projectionist_heuristics["*.ex|*.exs"] = {
\     "apps/*/mix.exs": { "type": "app" },
\     "lib/*.ex": {
\       "type": "lib",
\       "alternate": "test/{}_test.exs",
\       "template": ["defmodule {camelcase|capitalize|dot} do", "end"],
\     },
\     "test/*_test.exs": {
\       "type": "test",
\       "alternate": "lib/{}.ex",
\       "template": ["defmodule {camelcase|capitalize|dot}Test do", "  use ExUnit.Case, async: true", "", "  alias {camelcase|capitalize|dot}, as: Subject", "", "  doctest Subject", "end"],
\     },
\     "mix.exs": { "type": "mix" },
\     "config/*.exs": { "type": "config" },
\     "*": {
\       "make": "mix compile",
\       "start": "iex --sname phx -S mix phx.server",
\       "console": "iex --sname relp",
\     }
\ }
