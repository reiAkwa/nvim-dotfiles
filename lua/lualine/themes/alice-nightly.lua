-- lualine.nvim theme: Alice Nightly (Alice series)
-- usage: require('lualine').setup({ options = { theme = 'alice-nightly' } })
local c = {
  bg1  = '#090e12', bg2  = '#161b20',
  fg1  = '#e0e5ea', ink  = '#f6f9fb',
  acc1 = '#56a0d1', acc2 = '#5b7f92', acc3 = '#a280cb',
  red  = '#d99fb5', green = '#5fc7a5', gold = '#d2a652', cyan = '#69b6cc',
}

local function sect(mode_bg)
  return {
    a = { fg = c.ink, bg = mode_bg, gui = 'bold' },
    b = { fg = c.ink, bg = c.acc2 },
    c = { fg = c.fg1, bg = c.bg2 },
    x = { fg = c.fg1, bg = c.bg2 },
    y = { fg = c.ink, bg = c.acc2 },
    z = { fg = c.ink, bg = mode_bg },
  }
end

local T = {
  normal   = sect(c.acc1),
  insert   = sect(c.red),
  visual   = sect(c.acc3),
  replace  = sect(c.gold),
  command  = sect(c.cyan),
  terminal = sect(c.green),
}
T.inactive = {
  a = { fg = c.fg1, bg = c.bg2 }, b = { fg = c.fg1, bg = c.bg2 },
  c = { fg = c.fg1, bg = c.bg2 }, x = { fg = c.fg1, bg = c.bg2 },
  y = { fg = c.fg1, bg = c.bg2 }, z = { fg = c.fg1, bg = c.bg2 },
}
return T
