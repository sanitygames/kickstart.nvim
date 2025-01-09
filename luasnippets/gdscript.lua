local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s('pr', fmt('print({})', { i(1, 'value') })),
  s('fre', t { 'func _ready() -> void:\n' }),
  s('fpr', fmt('func _process({}: float) -> void:', { i(1, '_delta') })),
  s('fph', fmt('func _physics_process({}: float) -> void:', { i(1, '_delta') })),
  s('vvec2', fmt('var {}: Vector2 = {}', { i(1, 'value'), i(2, 'Vector2.ZERO') })),

}
