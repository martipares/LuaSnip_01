return {
  "L3MON4D3/LuaSnip",
--   lazy = false,
  config = function()
    require("luasnip").config.setup { update_events = 'TextChanged,TextChangedI' }
    require("luasnip").config.setup { enable_autosnippets = true }
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
  end,
}
