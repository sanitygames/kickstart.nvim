local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s('soa', fmt('SinOsc.ar({})', { i(1, '440') })),
  s('pbd', fmt('Pbind({})', { i(1, '') })),
  s('psq', fmt('Pseq({})', { i(1, '') })),
}
