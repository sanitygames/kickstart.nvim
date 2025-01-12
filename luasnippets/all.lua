local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

return {
  s('hello', {
    t 'println("Hello World!")',
  }),

  s('tdp', {
    t "- [ ] "
  }),

  s('tda', {
    t "- [x] "
  }),

  s('kmp', {
    t "<", i(1), t ">"
  }),

}
