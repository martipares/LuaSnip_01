-- Include this `in_mathzone` function at the start of a snippets file...
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local out_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 0
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts.

return {
-- Another take on the fraction snippet without using a regex trigger
require("luasnip").snippet({trig = "ff",snippetType = "autosnippet"},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table
),
require("luasnip").snippet({trig = "\\()",snippetType = "autosnippet"},
  fmta(
    "\\right(<>\\left)",
    {
      i(1),
    }
  ),
  {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table
),
s({trig = '([^%a])ee', regTrig = true, wordTrig = false, priority = 2000, snippetType = "autosnippet"},
  fmta(
    "e^{<>}",
    {
      i(1),
    }
  ),
    {condition = in_mathzone}
),

}
