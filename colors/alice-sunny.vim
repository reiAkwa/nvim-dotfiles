" Alice Sunny - Alice series for Vim / Neovim
" Truecolor (termguicolors) with automatic 256-color fallback.
" Includes highlight groups for common Neovim plugins.

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "alice-sunny"
set background=light

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
call s:H('Normal', '#3B3B3B', '#F0F8FF', '', 237, 231)
call s:H('Cursor', '#1F2F3A', '#56A0D1', '', 236, 74)
call s:H('CursorLine', '', '#DAE2E9', '', "NONE", 254)
call s:H('CursorColumn', '', '#DAE2E9', '', "NONE", 254)
call s:H('Visual', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('VisualNOS', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('MatchParen', '#1F2F3A', '#BEDCD0', 'bold', 236, 152)
call s:H('Search', '#1F2F3A', '#DDCCA7', '', 236, 187)
call s:H('IncSearch', '#1F2F3A', '#B58532', '', 236, 137)
call s:H('Substitute', '#1F2F3A', '#B58532', '', 236, 137)
call s:H('LineNr', '#787878', '', '', 243, "NONE")
call s:H('CursorLineNr', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('SignColumn', '', '#F0F8FF', '', "NONE", 231)
call s:H('ColorColumn', '', '#DAE2E9', '', "NONE", 254)
call s:H('VertSplit', '#787878', '', '', 243, "NONE")
call s:H('WinSeparator', '#787878', '', '', 243, "NONE")
call s:H('StatusLine', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('StatusLineNC', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('WildMenu', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('Pmenu', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('PmenuSel', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('PmenuSbar', '', '#DAE2E9', '', "NONE", 254)
call s:H('PmenuThumb', '', '#A8B4C0', '', "NONE", 249)
call s:H('NormalFloat', '', '#DAE2E9', '', "NONE", 254)
call s:H('FloatBorder', '#787878', '#DAE2E9', '', 243, 254)
call s:H('FloatTitle', '#1F2F3A', '#5B7F92', 'bold', 236, 66)
call s:H('TabLine', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('TabLineFill', '', '#DAE2E9', '', "NONE", 254)
call s:H('TabLineSel', '#1F2F3A', '#56A0D1', '', 236, 74)
call s:H('Folded', '#787878', '#DAE2E9', '', 243, 254)
call s:H('FoldColumn', '#787878', '#F0F8FF', '', 243, 231)
call s:H('QuickFixLine', '', '#DAE2E9', '', "NONE", 254)
call s:H('DiffAdd', '', '#A2B8AF', '', "NONE", 145)
call s:H('DiffChange', '', '#A0B2BC', '', "NONE", 145)
call s:H('DiffDelete', '#A56A83', '#D9B8C5', '', 132, 182)
call s:H('DiffText', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('ErrorMsg', '#A56A83', '', '', 132, "NONE")
call s:H('WarningMsg', '#B58532', '', '', 137, "NONE")
call s:H('ModeMsg', '#56A0D1', '', '', 74, "NONE")
call s:H('MoreMsg', '#4F7A6A', '', '', 65, "NONE")
call s:H('Question', '#4F7A6A', '', '', 65, "NONE")
call s:H('Title', '#3B3B3B', '', 'bold', 237, "NONE")
call s:H('Directory', '#56A0D1', '', '', 74, "NONE")
call s:H('EndOfBuffer', '#A8B4C0', '', '', 249, "NONE")
call s:H('NonText', '#A8B4C0', '', '', 249, "NONE")
call s:H('SpecialKey', '#A8B4C0', '', '', 249, "NONE")
call s:H('Whitespace', '#A8B4C0', '', '', 249, "NONE")
call s:H('Conceal', '#787878', '', '', 243, "NONE")
call s:H('SpellBad', '#A56A83', '', 'undercurl', 132, "NONE")
call s:H('SpellCap', '#B58532', '', 'undercurl', 137, "NONE")
call s:H('SpellRare', '#B58532', '', 'undercurl', 137, "NONE")
call s:H('SpellLocal', '#B58532', '', 'undercurl', 137, "NONE")
call s:H('Underlined', '#56A0D1', '', 'underline', 74, "NONE")
call s:H('Ignore', '#A8B4C0', '', '', 249, "NONE")
call s:H('Error', '#A56A83', '', 'bold', 132, "NONE")
call s:H('Todo', '#1F2F3A', '#B58532', 'bold', 236, 137)

" --- syntax ---
call s:H('Comment', '#787878', "", 'italic', 243, "NONE")
call s:H('Constant', '#8868AE', "", '', 97, "NONE")
call s:H('String', '#4F7A6A', "", '', 65, "NONE")
call s:H('Character', '#4F7A6A', "", '', 65, "NONE")
call s:H('Number', '#A57A2E', "", '', 136, "NONE")
call s:H('Boolean', '#8868AE', "", '', 97, "NONE")
call s:H('Float', '#A57A2E', "", '', 136, "NONE")
call s:H('Identifier', '#5B7F92', "", '', 66, "NONE")
call s:H('Function', '#5B7F92', "", '', 66, "NONE")
call s:H('Statement', '#8868AE', "", 'italic', 97, "NONE")
call s:H('Conditional', '#8868AE', "", 'italic', 97, "NONE")
call s:H('Repeat', '#8868AE', "", 'italic', 97, "NONE")
call s:H('Label', '#8868AE', "", '', 97, "NONE")
call s:H('Operator', '#787878', "", '', 243, "NONE")
call s:H('Keyword', '#8868AE', "", 'italic', 97, "NONE")
call s:H('Exception', '#8868AE', "", '', 97, "NONE")
call s:H('PreProc', '#B58532', "", '', 137, "NONE")
call s:H('Include', '#B58532', "", '', 137, "NONE")
call s:H('Macro', '#B58532', "", '', 137, "NONE")
call s:H('Define', '#B58532', "", '', 137, "NONE")
call s:H('Type', '#56A0D1', "", '', 74, "NONE")
call s:H('StorageClass', '#8868AE', "", 'italic', 97, "NONE")
call s:H('Structure', '#56A0D1', "", '', 74, "NONE")
call s:H('Typedef', '#56A0D1', "", '', 74, "NONE")
call s:H('Special', '#A57A2E', "", '', 136, "NONE")
call s:H('SpecialChar', '#A57A2E', "", '', 136, "NONE")
call s:H('Tag', '#8868AE', "", '', 97, "NONE")
call s:H('Delimiter', '#787878', "", '', 243, "NONE")
call s:H('SpecialComment', '#787878', "", 'italic', 243, "NONE")
call s:H('Debug', '#A56A83', "", '', 132, "NONE")

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

local slug = 'alice-sunny'
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
call s:H("@rainbow.level2", '#8868AE', "", "", 97, "NONE")
call s:H("@rainbow.level3", '#4F7A6A', "", "", 65, "NONE")
call s:H("@rainbow.level4", '#A57A2E', "", "", 136, "NONE")
call s:H("@rainbow.level5", '#A56A83', "", "", 132, "NONE")
call s:H("@rainbow.level6", '#787878', "", "", 243, "NONE")

" --- diagnostics (Neovim) ---
call s:H('DiagnosticError', '#A56A83', "", '', 132, "NONE")
call s:H('DiagnosticWarn', '#B58532', "", '', 137, "NONE")
call s:H('DiagnosticInfo', '#4F7A6A', "", '', 65, "NONE")
call s:H('DiagnosticHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticVirtualTextError', '#A56A83', "", '', 132, "NONE")
call s:H('DiagnosticVirtualTextWarn', '#B58532', "", '', 137, "NONE")
call s:H('DiagnosticVirtualTextInfo', '#4F7A6A', "", '', 65, "NONE")
call s:H('DiagnosticVirtualTextHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticFloatingError', '#A56A83', "", '', 132, "NONE")
call s:H('DiagnosticFloatingWarn', '#B58532', "", '', 137, "NONE")
call s:H('DiagnosticFloatingInfo', '#4F7A6A', "", '', 65, "NONE")
call s:H('DiagnosticFloatingHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticUnderlineError', '#A56A83', "", 'undercurl', 132, "NONE")
call s:H('DiagnosticUnderlineWarn', '#B58532', "", 'undercurl', 137, "NONE")
call s:H('DiagnosticUnderlineInfo', '#4F7A6A', "", 'undercurl', 65, "NONE")
call s:H('DiagnosticUnderlineHint', '#5B7F92', "", 'undercurl', 66, "NONE")
call s:H("LspInlayHint", '#787878', '#DAE2E9', "italic", 243, 254)

" --- plugin: common ---
call s:H('TelescopeNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('TelescopePromptNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('TelescopeResultsNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('TelescopePreviewNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('TelescopeBorder', '#787878', '#DAE2E9', '', 243, 254)
call s:H('TelescopePromptBorder', '#787878', '#DAE2E9', '', 243, 254)
call s:H('TelescopeResultsBorder', '#787878', '#DAE2E9', '', 243, 254)
call s:H('TelescopePreviewBorder', '#787878', '#DAE2E9', '', 243, 254)
call s:H('TelescopeSelection', '#1F2F3A', '#5B7F92', 'bold', 236, 66)
call s:H('TelescopeSelectionCaret', '#56A0D1', '#DAE2E9', 'bold', 74, 254)
call s:H('TelescopeMatching', '#A57A2E', '', '', 136, "NONE")
call s:H('TelescopePromptPrefix', '#56A0D1', '#DAE2E9', 'bold', 74, 254)
call s:H('TelescopeTitle', '#1F2F3A', '#5B7F92', 'bold', 236, 66)
call s:H('TelescopePromptTitle', '#1F2F3A', '#5B7F92', 'bold', 236, 66)
call s:H('TelescopeResultsTitle', '#1F2F3A', '#5B7F92', 'bold', 236, 66)
call s:H('TelescopePreviewTitle', '#1F2F3A', '#5B7F92', 'bold', 236, 66)
call s:H('TelescopePromptCounter', '#787878', '#DAE2E9', '', 243, 254)
call s:H('TelescopeResultsComment', '#787878', '#DAE2E9', '', 243, 254)
call s:H('NvimTreeNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NvimTreeEndOfBuffer', '#DAE2E9', '#DAE2E9', '', 254, 254)
call s:H('NvimTreeRootFolder', '#56A0D1', '#DAE2E9', 'bold', 74, 254)
call s:H('NvimTreeFolderName', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NvimTreeOpenedFolderName', '#56A0D1', '#DAE2E9', 'bold', 74, 254)
call s:H('NvimTreeEmptyFolderName', '#787878', '#DAE2E9', '', 243, 254)
call s:H('NvimTreeFolderIcon', '#5B7F92', '#DAE2E9', '', 66, 254)
call s:H('NvimTreeIndentMarker', '#A8B4C0', '#DAE2E9', '', 249, 254)
call s:H('NvimTreeSymlink', '#789EB1', '#DAE2E9', 'italic', 109, 254)
call s:H('NvimTreeExecFile', '#4F7A6A', '#DAE2E9', '', 65, 254)
call s:H('NvimTreeImageFile', '#CBA0E3', '#DAE2E9', '', 182, 254)
call s:H('NvimTreeSpecialFile', '#A57A2E', '#DAE2E9', 'underline', 136, 254)
call s:H('NvimTreeWinSeparator', '#787878', '#DAE2E9', '', 243, 254)
call s:H('NvimTreeCursorLine', '', '#F0F8FF', '', "NONE", 231)
call s:H('NvimTreeGitDirty', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('NvimTreeGitStaged', '#4F7A6A', '#DAE2E9', '', 65, 254)
call s:H('NvimTreeGitNew', '#56A0D1', '#DAE2E9', '', 74, 254)
call s:H('NvimTreeGitDeleted', '#A56A83', '#DAE2E9', '', 132, 254)
call s:H('NvimTreeGitIgnored', '#787878', '#DAE2E9', '', 243, 254)
call s:H('NvimTreeGitMerge', '#8868AE', '#DAE2E9', '', 97, 254)
call s:H('NvimTreeGitRenamed', '#5B7F92', '#DAE2E9', '', 66, 254)
call s:H('NeoTreeNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NeoTreeEndOfBuffer', '#DAE2E9', '#DAE2E9', '', 254, 254)
call s:H('NeoTreeRootName', '#56A0D1', '#DAE2E9', 'bold', 74, 254)
call s:H('NeoTreeDirectoryName', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NeoTreeDirectoryIcon', '#5B7F92', '#DAE2E9', '', 66, 254)
call s:H('NeoTreeFileName', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NeoTreeIndentMarker', '#A8B4C0', '#DAE2E9', '', 249, 254)
call s:H('NeoTreeSymbolicLinkTarget', '#789EB1', '#DAE2E9', 'italic', 109, 254)
call s:H('NeoTreeWinSeparator', '#787878', '#DAE2E9', '', 243, 254)
call s:H('NeoTreeCursorLine', '', '#F0F8FF', '', "NONE", 231)
call s:H('NeoTreeGitModified', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('NeoTreeGitAdded', '#4F7A6A', '#DAE2E9', '', 65, 254)
call s:H('NeoTreeGitDeleted', '#A56A83', '#DAE2E9', '', 132, 254)
call s:H('NeoTreeGitUntracked', '#56A0D1', '#DAE2E9', '', 74, 254)
call s:H('NeoTreeGitIgnored', '#787878', '#DAE2E9', '', 243, 254)
call s:H('NeoTreeGitConflict', '#A56A83', '#DAE2E9', 'bold', 132, 254)
call s:H('NeoTreeGitRenamed', '#5B7F92', '#DAE2E9', '', 66, 254)
call s:H('NeoTreeGitUnstaged', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('NeoTreeGitStaged', '#4F7A6A', '#DAE2E9', '', 65, 254)
call s:H('WhichKey', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('WhichKeyGroup', '#8868AE', '', '', 97, "NONE")
call s:H('WhichKeyDesc', '#3B3B3B', '', '', 237, "NONE")
call s:H('WhichKeySeparator', '#787878', '', '', 243, "NONE")
call s:H('WhichKeyValue', '#787878', '', '', 243, "NONE")
call s:H('GitSignsAdd', '#4F7A6A', '', '', 65, "NONE")
call s:H('GitSignsChange', '#56A0D1', '', '', 74, "NONE")
call s:H('GitSignsDelete', '#A56A83', '', '', 132, "NONE")
call s:H('GitSignsAddLn', '#4F7A6A', '#A2B8AF', '', 65, 145)
call s:H('GitSignsChangeLn', '#56A0D1', '#A0B2BC', '', 74, 145)
call s:H('GitSignsDeleteLn', '#A56A83', '#D9B8C5', '', 132, 182)
call s:H('GitSignsCurrentLineBlame', '#787878', '', 'italic', 243, "NONE")
call s:H('IblIndent', '#A8B4C0', '', '', 249, "NONE")
call s:H('IblScope', '#5B7F92', '', '', 66, "NONE")
call s:H('IndentBlanklineChar', '#A8B4C0', '', '', 249, "NONE")
call s:H('IndentBlanklineSpaceChar', '#A8B4C0', '', '', 249, "NONE")
call s:H('IndentBlanklineContextChar', '#5B7F92', '', '', 66, "NONE")
call s:H('LazyNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('LazyH1', '#1F2F3A', '#56A0D1', 'bold', 236, 74)
call s:H('LazyH2', '#3B3B3B', '#DAE2E9', 'bold', 237, 254)
call s:H('LazyButton', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('LazyButtonActive', '#1F2F3A', '#56A0D1', 'bold', 236, 74)
call s:H('LazyProgressTodo', '#787878', '', '', 243, "NONE")
call s:H('LazyProgressDone', '#4F7A6A', '', '', 65, "NONE")
call s:H('LazyCommit', '#8868AE', '', '', 97, "NONE")
call s:H('LazyCommitIssue', '#B58532', '', '', 137, "NONE")
call s:H('LazyReasonPlugin', '#787878', '', 'italic', 243, "NONE")
call s:H('LazySpecial', '#56A0D1', '', '', 74, "NONE")
call s:H('MasonNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('MasonHeader', '#1F2F3A', '#56A0D1', 'bold', 236, 74)
call s:H('MasonHighlight', '#56A0D1', '', '', 74, "NONE")
call s:H('MasonHighlightBlock', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('MasonHighlightBlockBold', '#1F2F3A', '#5B7F92', 'bold', 236, 66)
call s:H('MasonMuted', '#787878', '', '', 243, "NONE")
call s:H('MasonMutedBlock', '#1F2F3A', '#A8B4C0', '', 236, 249)
call s:H('MasonError', '#A56A83', '', '', 132, "NONE")
call s:H('MasonHeading', '#3B3B3B', '', 'bold', 237, "NONE")
call s:H('NotifyERRORTitle', '#A56A83', '#DAE2E9', 'bold', 132, 254)
call s:H('NotifyERRORBorder', '#A56A83', '#DAE2E9', '', 132, 254)
call s:H('NotifyERRORIcon', '#A56A83', '#DAE2E9', '', 132, 254)
call s:H('NotifyWARNTitle', '#B58532', '#DAE2E9', 'bold', 137, 254)
call s:H('NotifyWARNBorder', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('NotifyWARNIcon', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('NotifyINFOTitle', '#4F7A6A', '#DAE2E9', 'bold', 65, 254)
call s:H('NotifyINFOBorder', '#4F7A6A', '#DAE2E9', '', 65, 254)
call s:H('NotifyINFOIcon', '#4F7A6A', '#DAE2E9', '', 65, 254)
call s:H('NotifyDEBUGTitle', '#789EB1', '#DAE2E9', 'bold', 109, 254)
call s:H('NotifyDEBUGBorder', '#789EB1', '#DAE2E9', '', 109, 254)
call s:H('NotifyDEBUGIcon', '#789EB1', '#DAE2E9', '', 109, 254)
call s:H('NotifyTRACETitle', '#A8B4C0', '#DAE2E9', 'bold', 249, 254)
call s:H('NotifyTRACEBorder', '#A8B4C0', '#DAE2E9', '', 249, 254)
call s:H('NotifyTRACEIcon', '#A8B4C0', '#DAE2E9', '', 249, 254)
call s:H('NotifyINFOBody', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NotifyWARNBody', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NotifyERRORBody', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NotifyDEBUGBody', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('NotifyTRACEBody', '#787878', '#DAE2E9', '', 243, 254)
call s:H('TroubleNormal', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('TroubleText', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('TroubleCount', '#1F2F3A', '#5B7F92', 'bold', 236, 66)
call s:H('TroubleSource', '#787878', '#DAE2E9', '', 243, 254)
call s:H('TroubleCode', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('TroubleSignError', '#A56A83', '#DAE2E9', '', 132, 254)
call s:H('TroubleSignWarning', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('TroubleSignInformation', '#4F7A6A', '#DAE2E9', '', 65, 254)
call s:H('TroubleSignHint', '#5B7F92', '#DAE2E9', '', 66, 254)
call s:H('DashboardHeader', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('DashboardCenter', '#3B3B3B', '', '', 237, "NONE")
call s:H('DashboardFooter', '#787878', '', 'italic', 243, "NONE")
call s:H('DashboardShortCut', '#5B7F92', '', '', 66, "NONE")
call s:H('DashboardKey', '#A57A2E', '', '', 136, "NONE")
call s:H('DashboardIcon', '#5B7F92', '', '', 66, "NONE")
call s:H('DashboardDesc', '#3B3B3B', '', '', 237, "NONE")
call s:H('AlphaHeader', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('AlphaButtons', '#5B7F92', '', '', 66, "NONE")
call s:H('AlphaShortcut', '#A57A2E', '', '', 136, "NONE")
call s:H('AlphaFooter', '#787878', '', 'italic', 243, "NONE")
call s:H('BufferLineFill', '', '#DAE2E9', '', "NONE", 254)
call s:H('BufferLineBackground', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BufferLineBufferVisible', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('BufferLineBufferSelected', '#3B3B3B', '#F0F8FF', 'bold', 237, 231)
call s:H('BufferLineIndicatorSelected', '#56A0D1', '#DAE2E9', '', 74, 254)
call s:H('BufferLineIndicatorVisible', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BufferLineSeparator', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BufferLineSeparatorVisible', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BufferLineSeparatorSelected', '#56A0D1', '#DAE2E9', '', 74, 254)
call s:H('BufferLineModified', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('BufferLineModifiedSelected', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('BufferLineModifiedVisible', '#B58532', '#DAE2E9', '', 137, 254)
call s:H('BufferLineError', '#A56A83', '#DAE2E9', '', 132, 254)
call s:H('BufferLineErrorSelected', '#A56A83', '#DAE2E9', '', 132, 254)
call s:H('BufferLineTabSelected', '#1F2F3A', '#56A0D1', 'bold', 236, 74)
call s:H('BufferLineTab', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BufferLineCloseButton', '#787878', '#DAE2E9', '', 243, 254)
call s:H('CmpItemAbbr', '#3B3B3B', '', '', 237, "NONE")
call s:H('CmpItemAbbrDeprecated', '#787878', '', 'strikethrough', 243, "NONE")
call s:H('CmpItemAbbrMatch', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('CmpItemAbbrMatchFuzzy', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemMenu', '#787878', '', '', 243, "NONE")
call s:H('CmpItemKindDefault', '#8868AE', '', '', 97, "NONE")
call s:H('CmpItemKindKeyword', '#8868AE', '', '', 97, "NONE")
call s:H('CmpItemKindVariable', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindConstant', '#8868AE', '', '', 97, "NONE")
call s:H('CmpItemKindFunction', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindMethod', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindStruct', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindClass', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindInterface', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindEnum', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindModule', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindProperty', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindField', '#5B7F92', '', '', 66, "NONE")
call s:H('CmpItemKindUnit', '#A57A2E', '', '', 136, "NONE")
call s:H('CmpItemKindValue', '#A57A2E', '', '', 136, "NONE")
call s:H('CmpItemKindSnippet', '#B58532', '', '', 137, "NONE")
call s:H('CmpItemKindColor', '#4F7A6A', '', '', 65, "NONE")
call s:H('CmpItemKindFile', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindReference', '#787878', '', '', 243, "NONE")
call s:H('CmpItemKindFolder', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindEvent', '#B58532', '', '', 137, "NONE")
call s:H('CmpItemKindOperator', '#787878', '', '', 243, "NONE")
call s:H('CmpItemKindTypeParameter', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindText', '#3B3B3B', '', '', 237, "NONE")
" --- plugin: blink.cmp ---
call s:H('BlinkCmpMenu', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('BlinkCmpMenuBorder', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BlinkCmpMenuSelection', '#1F2F3A', '#5B7F92', '', 236, 66)
call s:H('BlinkCmpLabel', '#3B3B3B', '', '', 237, "NONE")
call s:H('BlinkCmpLabelMatch', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('BlinkCmpLabelDeprecated', '#787878', '', '', 243, "NONE")
call s:H('BlinkCmpLabelDetail', '#787878', '', '', 243, "NONE")
call s:H('BlinkCmpLabelDescription', '#787878', '', '', 243, "NONE")
call s:H('BlinkCmpSource', '#787878', '', '', 243, "NONE")
call s:H('BlinkCmpScrollBarThumb', '', '#A8B4C0', '', "NONE", 249)
call s:H('BlinkCmpScrollBarGutter', '', '#DAE2E9', '', "NONE", 254)
call s:H('BlinkCmpGhostText', '#A8B4C0', '', '', 249, "NONE")
call s:H('BlinkCmpDoc', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('BlinkCmpDocBorder', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BlinkCmpDocSeparator', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BlinkCmpDocCursorLine', '', '#DAE2E9', '', "NONE", 254)
call s:H('BlinkCmpSignatureHelp', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('BlinkCmpSignatureHelpBorder', '#787878', '#DAE2E9', '', 243, 254)
call s:H('BlinkCmpSignatureHelpActiveParameter', '#56A0D1', '', 'underline', 74, "NONE")
call s:H('BlinkCmpKind', '#8868AE', '', '', 97, "NONE")
call s:H('BlinkCmpKindText', '#3B3B3B', '', '', 237, "NONE")
call s:H('BlinkCmpKindMethod', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindFunction', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindConstructor', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindField', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindVariable', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindClass', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindInterface', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindModule', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindProperty', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindUnit', '#A57A2E', '', '', 136, "NONE")
call s:H('BlinkCmpKindValue', '#A57A2E', '', '', 136, "NONE")
call s:H('BlinkCmpKindEnum', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindKeyword', '#8868AE', '', '', 97, "NONE")
call s:H('BlinkCmpKindSnippet', '#B58532', '', '', 137, "NONE")
call s:H('BlinkCmpKindColor', '#4F7A6A', '', '', 65, "NONE")
call s:H('BlinkCmpKindFile', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindReference', '#787878', '', '', 243, "NONE")
call s:H('BlinkCmpKindFolder', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindEnumMember', '#8868AE', '', '', 97, "NONE")
call s:H('BlinkCmpKindConstant', '#8868AE', '', '', 97, "NONE")
call s:H('BlinkCmpKindStruct', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindEvent', '#B58532', '', '', 137, "NONE")
call s:H('BlinkCmpKindOperator', '#787878', '', '', 243, "NONE")
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
call s:H('DropBarMenuHoverEntry', '#1F2F3A', '#B58532', '', 236, 137)
call s:H('DropBarMenuHoverIcon', '', '', 'reverse', "NONE", "NONE")
call s:H('DropBarMenuHoverSymbol', '', '', 'bold', "NONE", "NONE")
call s:H('DropBarIconUISeparator', '#787878', '', '', 243, "NONE")
" --- plugin: winbar ---
call s:H('WinBar', '#3B3B3B', '', 'bold', 237, "NONE")
call s:H('WinBarNC', '#787878', '', '', 243, "NONE")
call s:H('FlashBackdrop', '#787878', '', '', 243, "NONE")
call s:H('FlashMatch', '#3B3B3B', '#DDCCA7', '', 237, 187)
call s:H('FlashCurrent', '#1F2F3A', '#56A0D1', 'bold', 236, 74)
call s:H('FlashLabel', '#1F2F3A', '#B58532', 'bold', 236, 137)
call s:H('HopNextKey', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('HopNextKey1', '#8868AE', '', 'bold', 97, "NONE")
call s:H('HopNextKey2', '#A57A2E', '', '', 136, "NONE")
call s:H('HopUnmatched', '#787878', '', '', 243, "NONE")
call s:H('HopCursor', '#56A0D1', '', '', 74, "NONE")
call s:H('LeapMatch', '#1F2F3A', '#B58532', 'bold', 236, 137)
call s:H('LeapLabelPrimary', '#1F2F3A', '#56A0D1', 'bold', 236, 74)
call s:H('LeapLabelSecondary', '#1F2F3A', '#8868AE', 'bold', 236, 97)
call s:H('LeapLabelSelected', '#1F2F3A', '#B58532', 'bold', 236, 137)
call s:H('LeapBackdrop', '#787878', '', '', 243, "NONE")
call s:H('MiniIndentscopeSymbol', '#5B7F92', '', '', 66, "NONE")
call s:H('MiniStatuslineModeNormal', '#1F2F3A', '#56A0D1', 'bold', 236, 74)
call s:H('MiniStatuslineModeInsert', '#1F2F3A', '#C998AE', 'bold', 236, 175)
call s:H('MiniStatuslineModeVisual', '#1F2F3A', '#8868AE', 'bold', 236, 97)
call s:H('MiniStatuslineModeReplace', '#1F2F3A', '#CFB886', 'bold', 236, 180)
call s:H('MiniStatuslineModeCommand', '#1F2F3A', '#789EB1', 'bold', 236, 109)
call s:H('MiniStatuslineInactive', '#3B3B3B', '#DAE2E9', '', 237, 254)
call s:H('MiniJump', '#1F2F3A', '#B58532', 'bold', 236, 137)
call s:H('MiniCompletionActiveParameter', '', '', 'underline', "NONE", "NONE")
call s:H('NavicText', '#3B3B3B', '', '', 237, "NONE")
call s:H('NavicSeparator', '#787878', '', '', 243, "NONE")
call s:H('NavicIconsKeyword', '#8868AE', '', '', 97, "NONE")
call s:H('NavicIconsVariable', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsConstant', '#8868AE', '', '', 97, "NONE")
call s:H('NavicIconsFunction', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsMethod', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsStruct', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsClass', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsInterface', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsEnum', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsModule', '#56A0D1', '', '', 74, "NONE")
call s:H('NavicIconsProperty', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsField', '#5B7F92', '', '', 66, "NONE")
call s:H('NavicIconsUnit', '#A57A2E', '', '', 136, "NONE")
call s:H('NavicIconsValue', '#A57A2E', '', '', 136, "NONE")
call s:H('NavicIconsSnippet', '#B58532', '', '', 137, "NONE")
call s:H('NavicIconsColor', '#4F7A6A', '', '', 65, "NONE")
call s:H('ScrollbarHandle', '', '#DAE2E9', '', "NONE", 254)
call s:H('ScrollbarSearch', '#CFB886', '', '', 180, "NONE")
call s:H('ScrollbarError', '#A56A83', '', '', 132, "NONE")
call s:H('ScrollbarWarn', '#B58532', '', '', 137, "NONE")
call s:H('ScrollbarInfo', '#4F7A6A', '', '', 65, "NONE")
call s:H('ScrollbarHint', '#5B7F92', '', '', 66, "NONE")
call s:H('ScrollbarMisc', '#8868AE', '', '', 97, "NONE")

" --- terminal colors ---
let g:terminal_color_0 = "#1F2F3A"
let g:terminal_color_1 = "#C998AE"
let g:terminal_color_2 = "#7FAD9C"
let g:terminal_color_3 = "#CFB886"
let g:terminal_color_4 = "#56A0D1"
let g:terminal_color_5 = "#CBA0E3"
let g:terminal_color_6 = "#789EB1"
let g:terminal_color_7 = "#A8B4C0"
let g:terminal_color_8 = "#2E4250"
let g:terminal_color_9 = "#DC8AB1"
let g:terminal_color_10 = "#59B698"
let g:terminal_color_11 = "#D8B260"
let g:terminal_color_12 = "#2EA2E5"
let g:terminal_color_13 = "#CC97F3"
let g:terminal_color_14 = "#56A3C4"
let g:terminal_color_15 = "#BAC6D1"
