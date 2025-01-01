local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  -- s('pr', fmt('print({})', { i(1, 'value') })),
  s('soa', fmt('SinOsc.ar({})', { i(1, '440') })),
}
