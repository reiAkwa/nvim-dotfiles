" Alice Nightly - Alice series for Vim / Neovim
" Truecolor (termguicolors) with automatic 256-color fallback.
" Includes highlight groups for common Neovim plugins.

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "alice-nightly"
set background=dark

if has("termguicolors") && !&termguicolors
  set termguicolors
endif

function! s:H(n, fg, bg, at, cf, cb) abort
  let l:c = "hi " .. a:n
  if a:fg !=# ""
    let l:c ..= " guifg=" .. a:fg .. " ctermfg=" .. a:cf
  endif
  if a:bg !=# ""
    let l:c ..= " guibg=" .. a:bg .. " ctermbg=" .. a:cb
  endif
  if a:at !=# ""
    if a:at =~# "undercurl"
      let l:c ..= " gui=undercurl cterm=underline"
    elseif a:at =~# "strikethrough"
      let l:c ..= " gui=strikethrough"
    else
      let l:c ..= " gui=" .. a:at .. " cterm=" .. a:at
    endif
  endif
  execute l:c
endfunction

" --- editor UI ---
call s:H('Normal', '#E0E5EA', '#090E12', '', 254, 233)
call s:H('Cursor', '#F6F9FB', '#56A0D1', '', 231, 74)
call s:H('CursorLine', '', '#161B20', '', "NONE", 234)
call s:H('CursorColumn', '', '#161B20', '', "NONE", 234)
call s:H('Visual', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('VisualNOS', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('MatchParen', '#F6F9FB', '#3F7C67', 'bold', 231, 65)
call s:H('Search', '#0D1419', '#735613', '', 233, 58)
call s:H('IncSearch', '#F6F9FB', '#D7A03D', '', 231, 179)
call s:H('Substitute', '#F6F9FB', '#D7A03D', '', 231, 179)
call s:H('LineNr', '#8F9396', '', '', 246, "NONE")
call s:H('CursorLineNr', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('SignColumn', '', '#090E12', '', "NONE", 233)
call s:H('ColorColumn', '', '#161B20', '', "NONE", 234)
call s:H('VertSplit', '#8F9396', '', '', 246, "NONE")
call s:H('WinSeparator', '#8F9396', '', '', 246, "NONE")
call s:H('StatusLine', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('StatusLineNC', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('WildMenu', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('Pmenu', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('PmenuSel', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('PmenuSbar', '', '#161B20', '', "NONE", 234)
call s:H('PmenuThumb', '', '#232D35', '', "NONE", 236)
call s:H('NormalFloat', '', '#161B20', '', "NONE", 234)
call s:H('FloatBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('FloatTitle', '#F6F9FB', '#5B7F92', 'bold', 231, 66)
call s:H('TabLine', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('TabLineFill', '', '#161B20', '', "NONE", 234)
call s:H('TabLineSel', '#F6F9FB', '#56A0D1', '', 231, 74)
call s:H('Folded', '#8F9396', '#161B20', '', 246, 234)
call s:H('FoldColumn', '#8F9396', '#090E12', '', 246, 233)
call s:H('QuickFixLine', '', '#161B20', '', "NONE", 234)
call s:H('DiffAdd', '', '#055843', '', "NONE", 23)
call s:H('DiffChange', '', '#203642', '', "NONE", 236)
call s:H('DiffDelete', '#CF84A5', '#5F3246', '', 175, 238)
call s:H('DiffText', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('ErrorMsg', '#CF84A5', '', '', 175, "NONE")
call s:H('WarningMsg', '#D7A03D', '', '', 179, "NONE")
call s:H('ModeMsg', '#56A0D1', '', '', 74, "NONE")
call s:H('MoreMsg', '#50BF9B', '', '', 72, "NONE")
call s:H('Question', '#50BF9B', '', '', 72, "NONE")
call s:H('Title', '#E0E5EA', '', 'bold', 254, "NONE")
call s:H('Directory', '#56A0D1', '', '', 74, "NONE")
call s:H('EndOfBuffer', '#232D35', '', '', 236, "NONE")
call s:H('NonText', '#232D35', '', '', 236, "NONE")
call s:H('SpecialKey', '#232D35', '', '', 236, "NONE")
call s:H('Whitespace', '#232D35', '', '', 236, "NONE")
call s:H('Conceal', '#8F9396', '', '', 246, "NONE")
call s:H('SpellBad', '#CF84A5', '', 'undercurl', 175, "NONE")
call s:H('SpellCap', '#D7A03D', '', 'undercurl', 179, "NONE")
call s:H('SpellRare', '#D7A03D', '', 'undercurl', 179, "NONE")
call s:H('SpellLocal', '#D7A03D', '', 'undercurl', 179, "NONE")
call s:H('Underlined', '#56A0D1', '', 'underline', 74, "NONE")
call s:H('Ignore', '#232D35', '', '', 236, "NONE")
call s:H('Error', '#CF84A5', '', 'bold', 175, "NONE")
call s:H('Todo', '#F6F9FB', '#D7A03D', 'bold', 231, 179)

" --- syntax ---
call s:H('Comment', '#8F9396', "", 'italic', 246, "NONE")
call s:H('Constant', '#A280CB', "", '', 140, "NONE")
call s:H('String', '#50BF9B', "", '', 72, "NONE")
call s:H('Character', '#50BF9B', "", '', 72, "NONE")
call s:H('Number', '#D2A652', "", '', 179, "NONE")
call s:H('Boolean', '#A280CB', "", '', 140, "NONE")
call s:H('Float', '#D2A652', "", '', 179, "NONE")
call s:H('Identifier', '#5B7F92', "", '', 66, "NONE")
call s:H('Function', '#5B7F92', "", '', 66, "NONE")
call s:H('Statement', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Conditional', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Repeat', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Label', '#A280CB', "", '', 140, "NONE")
call s:H('Operator', '#8F9396', "", '', 246, "NONE")
call s:H('Keyword', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Exception', '#A280CB', "", '', 140, "NONE")
call s:H('PreProc', '#D7A03D', "", '', 179, "NONE")
call s:H('Include', '#D7A03D', "", '', 179, "NONE")
call s:H('Macro', '#D7A03D', "", '', 179, "NONE")
call s:H('Define', '#D7A03D', "", '', 179, "NONE")
call s:H('Type', '#56A0D1', "", '', 74, "NONE")
call s:H('StorageClass', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Structure', '#56A0D1', "", '', 74, "NONE")
call s:H('Typedef', '#56A0D1', "", '', 74, "NONE")
call s:H('Special', '#D2A652', "", '', 179, "NONE")
call s:H('SpecialChar', '#D2A652', "", '', 179, "NONE")
call s:H('Tag', '#A280CB', "", '', 140, "NONE")
call s:H('Delimiter', '#8F9396', "", '', 246, "NONE")
call s:H('SpecialComment', '#8F9396', "", 'italic', 246, "NONE")
call s:H('Debug', '#CF84A5', "", '', 175, "NONE")

" --- treesitter (Neovim) links ---
" Applied via embedded Lua + ColorScheme autocommand + defer_fn(0), so the
" granular @capture groups survive nvim's post-:colorscheme reset.
if has("nvim")
lua << EOF
local links = {
  { '@comment', 'Comment' },
  { '@comment.documentation', 'Comment' },
  { '@comment.error', 'Error' },
  { '@string', 'String' },
  { '@string.documentation', 'Comment' },
  { '@string.regexp', 'String' },
  { '@string.escape', 'SpecialChar' },
  { '@string.special', 'Special' },
  { '@character', 'Character' },
  { '@character.special', 'SpecialChar' },
  { '@boolean', 'Boolean' },
  { '@number', 'Number' },
  { '@number.float', 'Float' },
  { '@float', 'Float' },
  { '@constant', 'Constant' },
  { '@constant.builtin', 'Constant' },
  { '@constant.macro', 'Define' },
  { '@variable', 'Identifier' },
  { '@variable.builtin', 'Identifier' },
  { '@variable.member', 'Identifier' },
  { '@property', 'Identifier' },
  { '@property.definition', 'Identifier' },
  { '@field', 'Identifier' },
  { '@parameter', 'Identifier' },
  { '@parameter.reference', 'Identifier' },
  { '@symbol', 'Identifier' },
  { '@self', 'Identifier' },
  { '@label', 'Label' },
  { '@function', 'Function' },
  { '@function.builtin', 'Function' },
  { '@function.call', 'Function' },
  { '@function.macro', 'Function' },
  { '@method', 'Function' },
  { '@method.call', 'Function' },
  { '@constructor', 'Type' },
  { '@macro', 'Define' },
  { '@type', 'Type' },
  { '@type.builtin', 'Type' },
  { '@type.definition', 'Type' },
  { '@type.qualifier', 'Type' },
  { '@namespace', 'Type' },
  { '@namespace.builtin', 'Type' },
  { '@module', 'Type' },
  { '@module.builtin', 'Type' },
  { '@attribute', 'Type' },
  { '@annotation', 'PreProc' },
  { '@decorator', 'PreProc' },
  { '@enum', 'Type' },
  { '@enumMember', 'Constant' },
  { '@keyword', 'Statement' },
  { '@keyword.conditional', 'Conditional' },
  { '@keyword.repeat', 'Repeat' },
  { '@keyword.import', 'Include' },
  { '@keyword.return', 'Statement' },
  { '@keyword.exception', 'Exception' },
  { '@keyword.function', 'Keyword' },
  { '@keyword.operator', 'Operator' },
  { '@keyword.storage', 'StorageClass' },
  { '@conditional', 'Conditional' },
  { '@repeat', 'Repeat' },
  { '@include', 'Include' },
  { '@operator', 'Operator' },
  { '@exception', 'Exception' },
  { '@storageclass', 'StorageClass' },
  { '@punctuation', 'Delimiter' },
  { '@punctuation.delimiter', 'Delimiter' },
  { '@punctuation.bracket', 'Delimiter' },
  { '@punctuation.special', 'Special' },
  { '@tag', 'Tag' },
  { '@tag.attribute', 'Type' },
  { '@tag.delimiter', 'Delimiter' },
  { '@title', 'Title' },
  { '@text.title', 'Title' },
  { '@text.uri', 'Underlined' },
  { '@text.reference', 'Underlined' },
  { '@text.strong', 'Title' },
  { '@text.emphasis', 'Title' },
  { '@text.underline', 'Underlined' },
  { '@text.math', 'Special' },
  { '@uri', 'Underlined' },
  { '@url', 'Underlined' },
  { '@markup.heading', 'Title' },
  { '@markup.strong', 'Title' },
  { '@markup.italic', 'Title' },
  { '@markup.underline', 'Underlined' },
  { '@markup.link', 'Underlined' },
  { '@markup.raw', 'String' },
  { '@markup.quote', 'Comment' },
  { '@markup.list', 'Special' },
  { '@markup.list.unchecked', 'Todo' },
  { '@markup.list.checked', 'String' },
  { '@markup.strikethrough', 'Comment' },
  { '@special', 'Special' },
  { '@specialComment', 'SpecialComment' },
  { '@error', 'Error' },
  { '@diff.plus', 'DiffAdd' },
  { '@diff.minus', 'DiffDelete' },
  { '@diff.delta', 'DiffChange' },
  { '@text.diff.add', 'DiffAdd' },
  { '@text.diff.delete', 'DiffDelete' },
}

local slug = 'alice-nightly'
local function apply()
  for _, l in ipairs(links) do
    vim.api.nvim_set_hl(0, l[1], { link = l[2] })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup('alice_' .. slug .. '_ts', { clear = true }),
  pattern = slug,
  callback = apply,
})
vim.defer_fn(apply, 0)  -- first load: runs after nvim resets the @ groups
EOF
endif


" --- rainbow delimiters ---
call s:H("@rainbow.level1", '#56A0D1', "", "", 74, "NONE")
call s:H("@rainbow.level2", '#A280CB', "", "", 140, "NONE")
call s:H("@rainbow.level3", '#50BF9B', "", "", 72, "NONE")
call s:H("@rainbow.level4", '#D2A652', "", "", 179, "NONE")
call s:H("@rainbow.level5", '#CF84A5', "", "", 175, "NONE")
call s:H("@rainbow.level6", '#8F9396', "", "", 246, "NONE")

" --- diagnostics (Neovim) ---
call s:H('DiagnosticError', '#CF84A5', "", '', 175, "NONE")
call s:H('DiagnosticWarn', '#D7A03D', "", '', 179, "NONE")
call s:H('DiagnosticInfo', '#50BF9B', "", '', 72, "NONE")
call s:H('DiagnosticHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticVirtualTextError', '#CF84A5', "", '', 175, "NONE")
call s:H('DiagnosticVirtualTextWarn', '#D7A03D', "", '', 179, "NONE")
call s:H('DiagnosticVirtualTextInfo', '#50BF9B', "", '', 72, "NONE")
call s:H('DiagnosticVirtualTextHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticFloatingError', '#CF84A5', "", '', 175, "NONE")
call s:H('DiagnosticFloatingWarn', '#D7A03D', "", '', 179, "NONE")
call s:H('DiagnosticFloatingInfo', '#50BF9B', "", '', 72, "NONE")
call s:H('DiagnosticFloatingHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticUnderlineError', '#CF84A5', "", 'undercurl', 175, "NONE")
call s:H('DiagnosticUnderlineWarn', '#D7A03D', "", 'undercurl', 179, "NONE")
call s:H('DiagnosticUnderlineInfo', '#50BF9B', "", 'undercurl', 72, "NONE")
call s:H('DiagnosticUnderlineHint', '#5B7F92', "", 'undercurl', 66, "NONE")
call s:H("LspInlayHint", '#8F9396', '#161B20', "italic", 246, 234)

" --- plugin: common ---
call s:H('TelescopeNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('TelescopePromptNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('TelescopeResultsNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('TelescopePreviewNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('TelescopeBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('TelescopePromptBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('TelescopeResultsBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('TelescopePreviewBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('TelescopeSelection', '#F6F9FB', '#5B7F92', 'bold', 231, 66)
call s:H('TelescopeSelectionCaret', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('TelescopeMatching', '#D2A652', '', '', 179, "NONE")
call s:H('TelescopePromptPrefix', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('TelescopeTitle', '#F6F9FB', '#5B7F92', 'bold', 231, 66)
call s:H('TelescopePromptTitle', '#F6F9FB', '#5B7F92', 'bold', 231, 66)
call s:H('TelescopeResultsTitle', '#F6F9FB', '#5B7F92', 'bold', 231, 66)
call s:H('TelescopePreviewTitle', '#F6F9FB', '#5B7F92', 'bold', 231, 66)
call s:H('TelescopePromptCounter', '#8F9396', '#161B20', '', 246, 234)
call s:H('TelescopeResultsComment', '#8F9396', '#161B20', '', 246, 234)
call s:H('NvimTreeNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NvimTreeEndOfBuffer', '#161B20', '#161B20', '', 234, 234)
call s:H('NvimTreeRootFolder', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('NvimTreeFolderName', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NvimTreeOpenedFolderName', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('NvimTreeEmptyFolderName', '#8F9396', '#161B20', '', 246, 234)
call s:H('NvimTreeFolderIcon', '#5B7F92', '#161B20', '', 66, 234)
call s:H('NvimTreeIndentMarker', '#232D35', '#161B20', '', 236, 234)
call s:H('NvimTreeSymlink', '#69B6CC', '#161B20', 'italic', 74, 234)
call s:H('NvimTreeExecFile', '#50BF9B', '#161B20', '', 72, 234)
call s:H('NvimTreeImageFile', '#B591D4', '#161B20', '', 140, 234)
call s:H('NvimTreeSpecialFile', '#D2A652', '#161B20', 'underline', 179, 234)
call s:H('NvimTreeWinSeparator', '#8F9396', '#161B20', '', 246, 234)
call s:H('NvimTreeCursorLine', '', '#090E12', '', "NONE", 233)
call s:H('NvimTreeGitDirty', '#D7A03D', '#161B20', '', 179, 234)
call s:H('NvimTreeGitStaged', '#50BF9B', '#161B20', '', 72, 234)
call s:H('NvimTreeGitNew', '#56A0D1', '#161B20', '', 74, 234)
call s:H('NvimTreeGitDeleted', '#CF84A5', '#161B20', '', 175, 234)
call s:H('NvimTreeGitIgnored', '#8F9396', '#161B20', '', 246, 234)
call s:H('NvimTreeGitMerge', '#A280CB', '#161B20', '', 140, 234)
call s:H('NvimTreeGitRenamed', '#5B7F92', '#161B20', '', 66, 234)
call s:H('NeoTreeNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NeoTreeEndOfBuffer', '#161B20', '#161B20', '', 234, 234)
call s:H('NeoTreeRootName', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('NeoTreeDirectoryName', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NeoTreeDirectoryIcon', '#5B7F92', '#161B20', '', 66, 234)
call s:H('NeoTreeFileName', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NeoTreeIndentMarker', '#232D35', '#161B20', '', 236, 234)
call s:H('NeoTreeSymbolicLinkTarget', '#69B6CC', '#161B20', 'italic', 74, 234)
call s:H('NeoTreeWinSeparator', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeCursorLine', '', '#090E12', '', "NONE", 233)
call s:H('NeoTreeGitModified', '#D7A03D', '#161B20', '', 179, 234)
call s:H('NeoTreeGitAdded', '#50BF9B', '#161B20', '', 72, 234)
call s:H('NeoTreeGitDeleted', '#CF84A5', '#161B20', '', 175, 234)
call s:H('NeoTreeGitUntracked', '#56A0D1', '#161B20', '', 74, 234)
call s:H('NeoTreeGitIgnored', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeGitConflict', '#CF84A5', '#161B20', 'bold', 175, 234)
call s:H('NeoTreeGitRenamed', '#5B7F92', '#161B20', '', 66, 234)
call s:H('NeoTreeGitUnstaged', '#D7A03D', '#161B20', '', 179, 234)
call s:H('NeoTreeGitStaged', '#50BF9B', '#161B20', '', 72, 234)
call s:H('NeoTreeNormalNC', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NeoTreeFloatNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NeoTreeFloatBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeFloatTitle', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('NeoTreeTitleBar', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('NeoTreeExpander', '#232D35', '#161B20', '', 236, 234)
call s:H('NeoTreeFileIcon', '#5B7F92', '#161B20', '', 66, 234)
call s:H('NeoTreeFileNameOpened', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('NeoTreeDimText', '#232D35', '#161B20', '', 236, 234)
call s:H('NeoTreeFadeText1', '#232D35', '#161B20', '', 236, 234)
call s:H('NeoTreeFadeText2', '#232D35', '#161B20', '', 236, 234)
call s:H('NeoTreeDotfile', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeHiddenByName', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeIgnored', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeFilterTerm', '#D2A652', '#161B20', 'bold', 179, 234)
call s:H('NeoTreeMessage', '#56A0D1', '#161B20', '', 74, 234)
call s:H('NeoTreeModified', '#D7A03D', '#161B20', '', 179, 234)
call s:H('NeoTreeSelected', '', '#090E12', '', "NONE", 233)
call s:H('NeoTreeSignColumn', '', '#161B20', '', "NONE", 234)
call s:H('NeoTreeStatusLine', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NeoTreeStatusLineNC', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeVertSplit', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeBufferNumber', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeFileStats', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeFileStatsHeader', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('NeoTreePreview', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NeoTreeWindowsHidden', '#232D35', '#161B20', '', 236, 234)
call s:H('NeoTreeTabActive', '#56A0D1', '#161B20', 'bold', 74, 234)
call s:H('NeoTreeTabInactive', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeTabSeparatorActive', '#8F9396', '#161B20', '', 246, 234)
call s:H('NeoTreeTabSeparatorInactive', '#8F9396', '#161B20', '', 246, 234)
call s:H('WhichKey', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('WhichKeyGroup', '#A280CB', '', '', 140, "NONE")
call s:H('WhichKeyDesc', '#E0E5EA', '', '', 254, "NONE")
call s:H('WhichKeySeparator', '#8F9396', '', '', 246, "NONE")
call s:H('WhichKeyValue', '#8F9396', '', '', 246, "NONE")
call s:H('GitSignsAdd', '#50BF9B', '', '', 72, "NONE")
call s:H('GitSignsChange', '#56A0D1', '', '', 74, "NONE")
call s:H('GitSignsDelete', '#CF84A5', '', '', 175, "NONE")
call s:H('GitSignsAddLn', '#50BF9B', '#055843', '', 72, 23)
call s:H('GitSignsChangeLn', '#56A0D1', '#203642', '', 74, 236)
call s:H('GitSignsDeleteLn', '#CF84A5', '#5F3246', '', 175, 238)
call s:H('GitSignsCurrentLineBlame', '#8F9396', '', 'italic', 246, "NONE")
call s:H('IblIndent', '#232D35', '', '', 236, "NONE")
call s:H('IblScope', '#5B7F92', '', '', 66, "NONE")
call s:H('IndentBlanklineChar', '#232D35', '', '', 236, "NONE")
call s:H('IndentBlanklineSpaceChar', '#232D35', '', '', 236, "NONE")
call s:H('IndentBlanklineContextChar', '#5B7F92', '', '', 66, "NONE")
call s:H('LazyNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('LazyH1', '#F6F9FB', '#56A0D1', 'bold', 231, 74)
call s:H('LazyH2', '#E0E5EA', '#161B20', 'bold', 254, 234)
call s:H('LazyButton', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('LazyButtonActive', '#F6F9FB', '#56A0D1', 'bold', 231, 74)
call s:H('LazyProgressTodo', '#8F9396', '', '', 246, "NONE")
call s:H('LazyProgressDone', '#50BF9B', '', '', 72, "NONE")
call s:H('LazyCommit', '#A280CB', '', '', 140, "NONE")
call s:H('LazyCommitIssue', '#D7A03D', '', '', 179, "NONE")
call s:H('LazyReasonPlugin', '#8F9396', '', 'italic', 246, "NONE")
call s:H('LazySpecial', '#56A0D1', '', '', 74, "NONE")
call s:H('MasonNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('MasonHeader', '#F6F9FB', '#56A0D1', 'bold', 231, 74)
call s:H('MasonHighlight', '#56A0D1', '', '', 74, "NONE")
call s:H('MasonHighlightBlock', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('MasonHighlightBlockBold', '#F6F9FB', '#5B7F92', 'bold', 231, 66)
call s:H('MasonMuted', '#8F9396', '', '', 246, "NONE")
call s:H('MasonMutedBlock', '#F6F9FB', '#232D35', '', 231, 236)
call s:H('MasonError', '#CF84A5', '', '', 175, "NONE")
call s:H('MasonHeading', '#E0E5EA', '', 'bold', 254, "NONE")
call s:H('NotifyERRORTitle', '#CF84A5', '#161B20', 'bold', 175, 234)
call s:H('NotifyERRORBorder', '#CF84A5', '#161B20', '', 175, 234)
call s:H('NotifyERRORIcon', '#CF84A5', '#161B20', '', 175, 234)
call s:H('NotifyWARNTitle', '#D7A03D', '#161B20', 'bold', 179, 234)
call s:H('NotifyWARNBorder', '#D7A03D', '#161B20', '', 179, 234)
call s:H('NotifyWARNIcon', '#D7A03D', '#161B20', '', 179, 234)
call s:H('NotifyINFOTitle', '#50BF9B', '#161B20', 'bold', 72, 234)
call s:H('NotifyINFOBorder', '#50BF9B', '#161B20', '', 72, 234)
call s:H('NotifyINFOIcon', '#50BF9B', '#161B20', '', 72, 234)
call s:H('NotifyDEBUGTitle', '#69B6CC', '#161B20', 'bold', 74, 234)
call s:H('NotifyDEBUGBorder', '#69B6CC', '#161B20', '', 74, 234)
call s:H('NotifyDEBUGIcon', '#69B6CC', '#161B20', '', 74, 234)
call s:H('NotifyTRACETitle', '#232D35', '#161B20', 'bold', 236, 234)
call s:H('NotifyTRACEBorder', '#232D35', '#161B20', '', 236, 234)
call s:H('NotifyTRACEIcon', '#232D35', '#161B20', '', 236, 234)
call s:H('NotifyINFOBody', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NotifyWARNBody', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NotifyERRORBody', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NotifyDEBUGBody', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('NotifyTRACEBody', '#8F9396', '#161B20', '', 246, 234)
call s:H('TroubleNormal', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('TroubleText', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('TroubleCount', '#F6F9FB', '#5B7F92', 'bold', 231, 66)
call s:H('TroubleSource', '#8F9396', '#161B20', '', 246, 234)
call s:H('TroubleCode', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('TroubleSignError', '#CF84A5', '#161B20', '', 175, 234)
call s:H('TroubleSignWarning', '#D7A03D', '#161B20', '', 179, 234)
call s:H('TroubleSignInformation', '#50BF9B', '#161B20', '', 72, 234)
call s:H('TroubleSignHint', '#5B7F92', '#161B20', '', 66, 234)
call s:H('DashboardHeader', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('DashboardCenter', '#E0E5EA', '', '', 254, "NONE")
call s:H('DashboardFooter', '#8F9396', '', 'italic', 246, "NONE")
call s:H('DashboardShortCut', '#5B7F92', '', '', 66, "NONE")
call s:H('DashboardKey', '#D2A652', '', '', 179, "NONE")
call s:H('DashboardIcon', '#5B7F92', '', '', 66, "NONE")
call s:H('DashboardDesc', '#E0E5EA', '', '', 254, "NONE")
call s:H('AlphaHeader', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('AlphaButtons', '#5B7F92', '', '', 66, "NONE")
call s:H('AlphaShortcut', '#D2A652', '', '', 179, "NONE")
call s:H('AlphaFooter', '#8F9396', '', 'italic', 246, "NONE")
call s:H('BufferLineFill', '', '#161B20', '', "NONE", 234)
call s:H('BufferLineBackground', '#8F9396', '#161B20', '', 246, 234)
call s:H('BufferLineBufferVisible', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('BufferLineBufferSelected', '#E0E5EA', '#090E12', 'bold', 254, 233)
call s:H('BufferLineIndicatorSelected', '#56A0D1', '#161B20', '', 74, 234)
call s:H('BufferLineIndicatorVisible', '#8F9396', '#161B20', '', 246, 234)
call s:H('BufferLineSeparator', '#8F9396', '#161B20', '', 246, 234)
call s:H('BufferLineSeparatorVisible', '#8F9396', '#161B20', '', 246, 234)
call s:H('BufferLineSeparatorSelected', '#56A0D1', '#161B20', '', 74, 234)
call s:H('BufferLineModified', '#D7A03D', '#161B20', '', 179, 234)
call s:H('BufferLineModifiedSelected', '#D7A03D', '#161B20', '', 179, 234)
call s:H('BufferLineModifiedVisible', '#D7A03D', '#161B20', '', 179, 234)
call s:H('BufferLineError', '#CF84A5', '#161B20', '', 175, 234)
call s:H('BufferLineErrorSelected', '#CF84A5', '#161B20', '', 175, 234)
call s:H('BufferLineTabSelected', '#F6F9FB', '#56A0D1', 'bold', 231, 74)
call s:H('BufferLineTab', '#8F9396', '#161B20', '', 246, 234)
call s:H('BufferLineCloseButton', '#8F9396', '#161B20', '', 246, 234)
call s:H('CmpItemAbbr', '#E0E5EA', '', '', 254, "NONE")
call s:H('CmpItemAbbrDeprecated', '#8F9396', '', 'strikethrough', 246, "NONE")
call s:H('CmpItemAbbrMatch', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('CmpItemAbbrMatchFuzzy', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemMenu', '#8F9396', '', '', 246, "NONE")
call s:H('CmpItemKindDefault', '#A280CB', '', '', 140, "NONE")
call s:H('CmpItemKindKeyword', '#A280CB', '', '', 140, "NONE")
call s:H('CmpItemKindVariable', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindConstant', '#A280CB', '', '', 140, "NONE")
call s:H('CmpItemKindFunction', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindMethod', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindStruct', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindClass', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindInterface', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindEnum', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindModule', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindProperty', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindField', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindUnit', '#D2A652', '', '', 179, "NONE")
call s:H('CmpItemKindValue', '#D2A652', '', '', 179, "NONE")
call s:H('CmpItemKindSnippet', '#D7A03D', '', '', 179, "NONE")
call s:H('CmpItemKindColor', '#50BF9B', '', '', 72, "NONE")
call s:H('CmpItemKindFile', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindReference', '#8F9396', '', '', 246, "NONE")
call s:H('CmpItemKindFolder', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindEvent', '#D7A03D', '', '', 179, "NONE")
call s:H('CmpItemKindOperator', '#8F9396', '', '', 246, "NONE")
call s:H('CmpItemKindTypeParameter', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindText', '#E0E5EA', '', '', 254, "NONE")
" --- plugin: blink.cmp ---
call s:H('BlinkCmpMenu', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('BlinkCmpMenuBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('BlinkCmpMenuSelection', '#F6F9FB', '#5B7F92', '', 231, 66)
call s:H('BlinkCmpLabel', '#E0E5EA', '', '', 254, "NONE")
call s:H('BlinkCmpLabelMatch', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('BlinkCmpLabelDeprecated', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpLabelDetail', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpLabelDescription', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpSource', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpScrollBarThumb', '', '#232D35', '', "NONE", 236)
call s:H('BlinkCmpScrollBarGutter', '', '#161B20', '', "NONE", 234)
call s:H('BlinkCmpGhostText', '#232D35', '', '', 236, "NONE")
call s:H('BlinkCmpDoc', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('BlinkCmpDocBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('BlinkCmpDocSeparator', '#8F9396', '#161B20', '', 246, 234)
call s:H('BlinkCmpDocCursorLine', '', '#161B20', '', "NONE", 234)
call s:H('BlinkCmpSignatureHelp', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('BlinkCmpSignatureHelpBorder', '#8F9396', '#161B20', '', 246, 234)
call s:H('BlinkCmpSignatureHelpActiveParameter', '#56A0D1', '', 'underline', 74, "NONE")
call s:H('BlinkCmpKind', '#A280CB', '', '', 140, "NONE")
call s:H('BlinkCmpKindText', '#E0E5EA', '', '', 254, "NONE")
call s:H('BlinkCmpKindMethod', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindFunction', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindConstructor', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindField', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindVariable', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindClass', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindInterface', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindModule', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindProperty', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindUnit', '#D2A652', '', '', 179, "NONE")
call s:H('BlinkCmpKindValue', '#D2A652', '', '', 179, "NONE")
call s:H('BlinkCmpKindEnum', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindKeyword', '#A280CB', '', '', 140, "NONE")
call s:H('BlinkCmpKindSnippet', '#D7A03D', '', '', 179, "NONE")
call s:H('BlinkCmpKindColor', '#50BF9B', '', '', 72, "NONE")
call s:H('BlinkCmpKindFile', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindReference', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpKindFolder', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindEnumMember', '#A280CB', '', '', 140, "NONE")
call s:H('BlinkCmpKindConstant', '#A280CB', '', '', 140, "NONE")
call s:H('BlinkCmpKindStruct', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindEvent', '#D7A03D', '', '', 179, "NONE")
call s:H('BlinkCmpKindOperator', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpKindTypeParameter', '#56A0D1', '', '', 74, "NONE")

" --- plugin: dropbar.nvim ---
hi link DropBarCurrentContext Visual
hi link DropBarCurrentContextIcon DropBarCurrentContext
hi link DropBarCurrentContextName DropBarCurrentContext
hi link DropBarHover Visual
hi link DropBarPreview Visual
hi link DropBarMenuNormalFloat NormalFloat
hi link DropBarMenuFloatBorder FloatBorder
hi link DropBarMenuSbar PmenuSbar
hi link DropBarMenuThumb PmenuThumb
hi link DropBarMenuCurrentContext PmenuSel
hi link DropBarIconKindDefault Identifier
hi link DropBarFzfMatch Special
hi link DropBarIconUIIndicator SpecialChar
call s:H('DropBarMenuHoverEntry', '#F6F9FB', '#D7A03D', '', 231, 179)
call s:H('DropBarMenuHoverIcon', '', '', 'reverse', "NONE", "NONE")
call s:H('DropBarMenuHoverSymbol', '', '', 'bold', "NONE", "NONE")
call s:H('DropBarIconUISeparator', '#8F9396', '', '', 246, "NONE")
" --- plugin: winbar ---
call s:H('WinBar', '#E0E5EA', '', 'bold', 254, "NONE")
call s:H('WinBarNC', '#8F9396', '', '', 246, "NONE")
call s:H('FlashBackdrop', '#8F9396', '', '', 246, "NONE")
call s:H('FlashMatch', '#E0E5EA', '#735613', '', 254, 58)
call s:H('FlashCurrent', '#F6F9FB', '#56A0D1', 'bold', 231, 74)
call s:H('FlashLabel', '#F6F9FB', '#D7A03D', 'bold', 231, 179)
call s:H('HopNextKey', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('HopNextKey1', '#A280CB', '', 'bold', 140, "NONE")
call s:H('HopNextKey2', '#D2A652', '', '', 179, "NONE")
call s:H('HopUnmatched', '#8F9396', '', '', 246, "NONE")
call s:H('HopCursor', '#56A0D1', '', '', 74, "NONE")
call s:H('LeapMatch', '#F6F9FB', '#D7A03D', 'bold', 231, 179)
call s:H('LeapLabelPrimary', '#F6F9FB', '#56A0D1', 'bold', 231, 74)
call s:H('LeapLabelSecondary', '#F6F9FB', '#A280CB', 'bold', 231, 140)
call s:H('LeapLabelSelected', '#F6F9FB', '#D7A03D', 'bold', 231, 179)
call s:H('LeapBackdrop', '#8F9396', '', '', 246, "NONE")
call s:H('MiniIndentscopeSymbol', '#5B7F92', '', '', 66, "NONE")
call s:H('MiniStatuslineModeNormal', '#F6F9FB', '#56A0D1', 'bold', 231, 74)
call s:H('MiniStatuslineModeInsert', '#F6F9FB', '#D99FB5', 'bold', 231, 181)
call s:H('MiniStatuslineModeVisual', '#F6F9FB', '#A280CB', 'bold', 231, 140)
call s:H('MiniStatuslineModeReplace', '#F6F9FB', '#D9AE55', 'bold', 231, 179)
call s:H('MiniStatuslineModeCommand', '#F6F9FB', '#69B6CC', 'bold', 231, 74)
call s:H('MiniStatuslineInactive', '#E0E5EA', '#161B20', '', 254, 234)
call s:H('MiniJump', '#F6F9FB', '#D7A03D', 'bold', 231, 179)
call s:H('MiniCompletionActiveParameter', '', '', 'underline', "NONE", "NONE")
call s:H('NavicText', '#E0E5EA', '', '', 254, "NONE")
call s:H('NavicSeparator', '#8F9396', '', '', 246, "NONE")
call s:H('NavicIconsKeyword', '#A280CB', '', '', 140, "NONE")
call s:H('NavicIconsVariable', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsConstant', '#A280CB', '', '', 140, "NONE")
call s:H('NavicIconsFunction', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsMethod', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsStruct', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsClass', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsInterface', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsEnum', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsModule', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsProperty', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsField', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsUnit', '#D2A652', '', '', 179, "NONE")
call s:H('NavicIconsValue', '#D2A652', '', '', 179, "NONE")
call s:H('NavicIconsSnippet', '#D7A03D', '', '', 179, "NONE")
call s:H('NavicIconsColor', '#50BF9B', '', '', 72, "NONE")
call s:H('ScrollbarHandle', '', '#161B20', '', "NONE", 234)
call s:H('ScrollbarSearch', '#D9AE55', '', '', 179, "NONE")
call s:H('ScrollbarError', '#CF84A5', '', '', 175, "NONE")
call s:H('ScrollbarWarn', '#D7A03D', '', '', 179, "NONE")
call s:H('ScrollbarInfo', '#50BF9B', '', '', 72, "NONE")
call s:H('ScrollbarHint', '#5B7F92', '', '', 66, "NONE")
call s:H('ScrollbarMisc', '#A280CB', '', '', 140, "NONE")

" --- terminal colors ---
let g:terminal_color_0 = "#0D1419"
let g:terminal_color_1 = "#D99FB5"
let g:terminal_color_2 = "#5FC7A5"
let g:terminal_color_3 = "#D9AE55"
let g:terminal_color_4 = "#56A0D1"
let g:terminal_color_5 = "#B591D4"
let g:terminal_color_6 = "#69B6CC"
let g:terminal_color_7 = "#232D35"
let g:terminal_color_8 = "#202A33"
let g:terminal_color_9 = "#E9B6C9"
let g:terminal_color_10 = "#7FD6B7"
let g:terminal_color_11 = "#ECC16F"
let g:terminal_color_12 = "#7EB9E0"
let g:terminal_color_13 = "#CFA9E8"
let g:terminal_color_14 = "#92CFDF"
let g:terminal_color_15 = "#F0F5F8"
