local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

local function append_tables(t1, t2)
  local result = {}
  for _, v in ipairs(t1) do
    table.insert(result, v)
  end
  for _, v in ipairs(t2) do
    table.insert(result, v)
  end
  return result
end

local snips = {
  s('soa', fmt('SinOsc.ar({})', { i(1, '440') })),
  s('pbd', fmt('Pbind({})', { i(1, '') })),
  s('psq', fmt('Pseq({})', { i(1, '') })),
  s('da2', t 'doneAction:2'),
  s('oar', fmt('Out.ar({}, {})', { i(1, 'out'), i(2, 'sig') })),
  s('egpc', fmt('EnvGen.kr(Env.perc{})', { i(1) })),
  s(
    'def',
    fmt(
      [[
        (
        SynthDef.new(\<>, {
            <>
        }).add;
        )
      ]],
      { i(1, 'name'), i(0) },
      { delimiters = '<>' }
    )
  ),
}

local methods = {
  'ar',
  'kr',
  'ir',
  'exprange',
  'boot',
  'free',
  'meter',
  'plotTree',
  'dur',
  'stretch',
  'legato',
  'sustain',
  'SinOsc',
  'LFNoise0',
  'Dust',
  'EnvGen',
  'Env',
  'FreeVerb',
  'WhiteNoise',
  'Pan2',
  'Pulse',
  'Saw',
  'Pbind',
  'Pseq',
  '\\instrument',
  '\\dur',
  '\\amp',
}

local function table2snippets(t1)
  local result = {}
  for _, v in ipairs(t1) do
    table.insert(result, s(v, t(v)))
  end
  return result
end

return append_tables(snips, table2snippets(methods))
