-- lualine.nvim theme: Alice Rainy (Alice series)
-- usage: require('lualine').setup({ options = { theme = 'alice-rainy' } })
local c = {
  bg1  = '#1f252a', bg2  = '#30363c',
  fg1  = '#ccd2d7', ink  = '#eef2f6',
  acc1 = '#56a0d1', acc2 = '#5b7f92', acc3 = '#a280cb',
  red  = '#d19ab0', green = '#71c0a2', gold = '#bfa065', cyan = '#71b6c9',
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
