-- lualine.nvim theme: Alice Sunny (Alice series)
-- usage: require('lualine').setup({ options = { theme = 'alice_sunny' } })
local c = {
  bg1  = '#f0f8ff', bg2  = '#dae2e9',
  fg1  = '#3b3b3b', ink  = '#1f2f3a',
  acc1 = '#56a0d1', acc2 = '#5b7f92', acc3 = '#8868ae',
  red  = '#C998AE', green = '#7FAD9C', gold = '#a57a2e', cyan = '#789eb1',
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
