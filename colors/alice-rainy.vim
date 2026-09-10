" Alice Rainy - Alice series for Vim / Neovim
" Truecolor (termguicolors) with automatic 256-color fallback.
" Includes highlight groups for common Neovim plugins.

hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "alice-rainy"
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
call s:H('Normal', '#CCD2D7', '#1F252A', '', 252, 235)
call s:H('Cursor', '#EEF2F6', '#56A0D1', '', 255, 74)
call s:H('CursorLine', '', '#30363C', '', "NONE", 237)
call s:H('CursorColumn', '', '#30363C', '', "NONE", 237)
call s:H('Visual', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('VisualNOS', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('MatchParen', '#EEF2F6', '#487664', 'bold', 255, 65)
call s:H('Search', '#1A2026', '#6D5625', '', 234, 58)
call s:H('IncSearch', '#EEF2F6', '#C49A55', '', 255, 173)
call s:H('Substitute', '#EEF2F6', '#C49A55', '', 255, 173)
call s:H('LineNr', '#8F9396', '', '', 246, "NONE")
call s:H('CursorLineNr', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('SignColumn', '', '#1F252A', '', "NONE", 235)
call s:H('ColorColumn', '', '#30363C', '', "NONE", 237)
call s:H('VertSplit', '#8F9396', '', '', 246, "NONE")
call s:H('WinSeparator', '#8F9396', '', '', 246, "NONE")
call s:H('StatusLine', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('StatusLineNC', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('WildMenu', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('Pmenu', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('PmenuSel', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('PmenuSbar', '', '#30363C', '', "NONE", 237)
call s:H('PmenuThumb', '', '#3D454D', '', "NONE", 238)
call s:H('NormalFloat', '', '#30363C', '', "NONE", 237)
call s:H('FloatBorder', '#8F9396', '#30363C', '', 246, 237)
call s:H('FloatTitle', '#EEF2F6', '#5B7F92', 'bold', 255, 66)
call s:H('TabLine', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('TabLineFill', '', '#30363C', '', "NONE", 237)
call s:H('TabLineSel', '#EEF2F6', '#56A0D1', '', 255, 74)
call s:H('Folded', '#8F9396', '#30363C', '', 246, 237)
call s:H('FoldColumn', '#8F9396', '#1F252A', '', 246, 235)
call s:H('QuickFixLine', '', '#30363C', '', "NONE", 237)
call s:H('DiffAdd', '', '#225242', '', "NONE", 237)
call s:H('DiffChange', '', '#243A46', '', "NONE", 237)
call s:H('DiffDelete', '#BA829A', '#553443', '', 138, 238)
call s:H('DiffText', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('ErrorMsg', '#BA829A', '', '', 138, "NONE")
call s:H('WarningMsg', '#C49A55', '', '', 173, "NONE")
call s:H('ModeMsg', '#56A0D1', '', '', 74, "NONE")
call s:H('MoreMsg', '#65B095', '', '', 72, "NONE")
call s:H('Question', '#65B095', '', '', 72, "NONE")
call s:H('Title', '#CCD2D7', '', 'bold', 252, "NONE")
call s:H('Directory', '#56A0D1', '', '', 74, "NONE")
call s:H('EndOfBuffer', '#3D454D', '', '', 238, "NONE")
call s:H('NonText', '#3D454D', '', '', 238, "NONE")
call s:H('SpecialKey', '#3D454D', '', '', 238, "NONE")
call s:H('Whitespace', '#3D454D', '', '', 238, "NONE")
call s:H('Conceal', '#8F9396', '', '', 246, "NONE")
call s:H('SpellBad', '#BA829A', '', 'undercurl', 138, "NONE")
call s:H('SpellCap', '#C49A55', '', 'undercurl', 173, "NONE")
call s:H('SpellRare', '#C49A55', '', 'undercurl', 173, "NONE")
call s:H('SpellLocal', '#C49A55', '', 'undercurl', 173, "NONE")
call s:H('Underlined', '#56A0D1', '', 'underline', 74, "NONE")
call s:H('Ignore', '#3D454D', '', '', 238, "NONE")
call s:H('Error', '#BA829A', '', 'bold', 138, "NONE")
call s:H('Todo', '#EEF2F6', '#C49A55', 'bold', 255, 173)

" --- syntax ---
call s:H('Comment', '#8F9396', "", 'italic', 246, "NONE")
call s:H('Constant', '#A280CB', "", '', 140, "NONE")
call s:H('String', '#65B095', "", '', 72, "NONE")
call s:H('Character', '#65B095', "", '', 72, "NONE")
call s:H('Number', '#BFA065', "", '', 143, "NONE")
call s:H('Boolean', '#A280CB', "", '', 140, "NONE")
call s:H('Float', '#BFA065', "", '', 143, "NONE")
call s:H('Identifier', '#5B7F92', "", '', 66, "NONE")
call s:H('Function', '#5B7F92', "", '', 66, "NONE")
call s:H('Statement', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Conditional', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Repeat', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Label', '#A280CB', "", '', 140, "NONE")
call s:H('Operator', '#8F9396', "", '', 246, "NONE")
call s:H('Keyword', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Exception', '#A280CB', "", '', 140, "NONE")
call s:H('PreProc', '#C49A55', "", '', 173, "NONE")
call s:H('Include', '#C49A55', "", '', 173, "NONE")
call s:H('Macro', '#C49A55', "", '', 173, "NONE")
call s:H('Define', '#C49A55', "", '', 173, "NONE")
call s:H('Type', '#56A0D1', "", '', 74, "NONE")
call s:H('StorageClass', '#A280CB', "", 'italic', 140, "NONE")
call s:H('Structure', '#56A0D1', "", '', 74, "NONE")
call s:H('Typedef', '#56A0D1', "", '', 74, "NONE")
call s:H('Special', '#BFA065', "", '', 143, "NONE")
call s:H('SpecialChar', '#BFA065', "", '', 143, "NONE")
call s:H('Tag', '#A280CB', "", '', 140, "NONE")
call s:H('Delimiter', '#8F9396', "", '', 246, "NONE")
call s:H('SpecialComment', '#8F9396', "", 'italic', 246, "NONE")
call s:H('Debug', '#BA829A', "", '', 138, "NONE")

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

local slug = 'alice-rainy'
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
call s:H("@rainbow.level3", '#65B095', "", "", 72, "NONE")
call s:H("@rainbow.level4", '#BFA065', "", "", 143, "NONE")
call s:H("@rainbow.level5", '#BA829A', "", "", 138, "NONE")
call s:H("@rainbow.level6", '#8F9396', "", "", 246, "NONE")

" --- diagnostics (Neovim) ---
call s:H('DiagnosticError', '#BA829A', "", '', 138, "NONE")
call s:H('DiagnosticWarn', '#C49A55', "", '', 173, "NONE")
call s:H('DiagnosticInfo', '#65B095', "", '', 72, "NONE")
call s:H('DiagnosticHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticVirtualTextError', '#BA829A', "", '', 138, "NONE")
call s:H('DiagnosticVirtualTextWarn', '#C49A55', "", '', 173, "NONE")
call s:H('DiagnosticVirtualTextInfo', '#65B095', "", '', 72, "NONE")
call s:H('DiagnosticVirtualTextHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticFloatingError', '#BA829A', "", '', 138, "NONE")
call s:H('DiagnosticFloatingWarn', '#C49A55', "", '', 173, "NONE")
call s:H('DiagnosticFloatingInfo', '#65B095', "", '', 72, "NONE")
call s:H('DiagnosticFloatingHint', '#5B7F92', "", '', 66, "NONE")
call s:H('DiagnosticUnderlineError', '#BA829A', "", 'undercurl', 138, "NONE")
call s:H('DiagnosticUnderlineWarn', '#C49A55', "", 'undercurl', 173, "NONE")
call s:H('DiagnosticUnderlineInfo', '#65B095', "", 'undercurl', 72, "NONE")
call s:H('DiagnosticUnderlineHint', '#5B7F92', "", 'undercurl', 66, "NONE")
call s:H("LspInlayHint", '#8F9396', '#30363C', "italic", 246, 237)

" --- plugin: common ---
call s:H('TelescopeNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('TelescopePromptNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('TelescopeResultsNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('TelescopePreviewNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('TelescopeBorder', '#8F9396', '#30363C', '', 246, 237)
call s:H('TelescopePromptBorder', '#8F9396', '#30363C', '', 246, 237)
call s:H('TelescopeResultsBorder', '#8F9396', '#30363C', '', 246, 237)
call s:H('TelescopePreviewBorder', '#8F9396', '#30363C', '', 246, 237)
call s:H('TelescopeSelection', '#EEF2F6', '#5B7F92', 'bold', 255, 66)
call s:H('TelescopeSelectionCaret', '#56A0D1', '#30363C', 'bold', 74, 237)
call s:H('TelescopeMatching', '#BFA065', '', '', 143, "NONE")
call s:H('TelescopePromptPrefix', '#56A0D1', '#30363C', 'bold', 74, 237)
call s:H('TelescopeTitle', '#EEF2F6', '#5B7F92', 'bold', 255, 66)
call s:H('TelescopePromptTitle', '#EEF2F6', '#5B7F92', 'bold', 255, 66)
call s:H('TelescopeResultsTitle', '#EEF2F6', '#5B7F92', 'bold', 255, 66)
call s:H('TelescopePreviewTitle', '#EEF2F6', '#5B7F92', 'bold', 255, 66)
call s:H('TelescopePromptCounter', '#8F9396', '#30363C', '', 246, 237)
call s:H('TelescopeResultsComment', '#8F9396', '#30363C', '', 246, 237)
call s:H('NvimTreeNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NvimTreeEndOfBuffer', '#30363C', '#30363C', '', 237, 237)
call s:H('NvimTreeRootFolder', '#56A0D1', '#30363C', 'bold', 74, 237)
call s:H('NvimTreeFolderName', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NvimTreeOpenedFolderName', '#56A0D1', '#30363C', 'bold', 74, 237)
call s:H('NvimTreeEmptyFolderName', '#8F9396', '#30363C', '', 246, 237)
call s:H('NvimTreeFolderIcon', '#5B7F92', '#30363C', '', 66, 237)
call s:H('NvimTreeIndentMarker', '#3D454D', '#30363C', '', 238, 237)
call s:H('NvimTreeSymlink', '#71B6C9', '#30363C', 'italic', 74, 237)
call s:H('NvimTreeExecFile', '#65B095', '#30363C', '', 72, 237)
call s:H('NvimTreeImageFile', '#B88FD5', '#30363C', '', 140, 237)
call s:H('NvimTreeSpecialFile', '#BFA065', '#30363C', 'underline', 143, 237)
call s:H('NvimTreeWinSeparator', '#8F9396', '#30363C', '', 246, 237)
call s:H('NvimTreeCursorLine', '', '#1F252A', '', "NONE", 235)
call s:H('NvimTreeGitDirty', '#C49A55', '#30363C', '', 173, 237)
call s:H('NvimTreeGitStaged', '#65B095', '#30363C', '', 72, 237)
call s:H('NvimTreeGitNew', '#56A0D1', '#30363C', '', 74, 237)
call s:H('NvimTreeGitDeleted', '#BA829A', '#30363C', '', 138, 237)
call s:H('NvimTreeGitIgnored', '#8F9396', '#30363C', '', 246, 237)
call s:H('NvimTreeGitMerge', '#A280CB', '#30363C', '', 140, 237)
call s:H('NvimTreeGitRenamed', '#5B7F92', '#30363C', '', 66, 237)
call s:H('NeoTreeNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NeoTreeEndOfBuffer', '#30363C', '#30363C', '', 237, 237)
call s:H('NeoTreeRootName', '#56A0D1', '#30363C', 'bold', 74, 237)
call s:H('NeoTreeDirectoryName', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NeoTreeDirectoryIcon', '#5B7F92', '#30363C', '', 66, 237)
call s:H('NeoTreeFileName', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NeoTreeIndentMarker', '#3D454D', '#30363C', '', 238, 237)
call s:H('NeoTreeSymbolicLinkTarget', '#71B6C9', '#30363C', 'italic', 74, 237)
call s:H('NeoTreeWinSeparator', '#8F9396', '#30363C', '', 246, 237)
call s:H('NeoTreeCursorLine', '', '#1F252A', '', "NONE", 235)
call s:H('NeoTreeGitModified', '#C49A55', '#30363C', '', 173, 237)
call s:H('NeoTreeGitAdded', '#65B095', '#30363C', '', 72, 237)
call s:H('NeoTreeGitDeleted', '#BA829A', '#30363C', '', 138, 237)
call s:H('NeoTreeGitUntracked', '#56A0D1', '#30363C', '', 74, 237)
call s:H('NeoTreeGitIgnored', '#8F9396', '#30363C', '', 246, 237)
call s:H('NeoTreeGitConflict', '#BA829A', '#30363C', 'bold', 138, 237)
call s:H('NeoTreeGitRenamed', '#5B7F92', '#30363C', '', 66, 237)
call s:H('NeoTreeGitUnstaged', '#C49A55', '#30363C', '', 173, 237)
call s:H('NeoTreeGitStaged', '#65B095', '#30363C', '', 72, 237)
call s:H('WhichKey', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('WhichKeyGroup', '#A280CB', '', '', 140, "NONE")
call s:H('WhichKeyDesc', '#CCD2D7', '', '', 252, "NONE")
call s:H('WhichKeySeparator', '#8F9396', '', '', 246, "NONE")
call s:H('WhichKeyValue', '#8F9396', '', '', 246, "NONE")
call s:H('GitSignsAdd', '#65B095', '', '', 72, "NONE")
call s:H('GitSignsChange', '#56A0D1', '', '', 74, "NONE")
call s:H('GitSignsDelete', '#BA829A', '', '', 138, "NONE")
call s:H('GitSignsAddLn', '#65B095', '#225242', '', 72, 237)
call s:H('GitSignsChangeLn', '#56A0D1', '#243A46', '', 74, 237)
call s:H('GitSignsDeleteLn', '#BA829A', '#553443', '', 138, 238)
call s:H('GitSignsCurrentLineBlame', '#8F9396', '', 'italic', 246, "NONE")
call s:H('IblIndent', '#3D454D', '', '', 238, "NONE")
call s:H('IblScope', '#5B7F92', '', '', 66, "NONE")
call s:H('IndentBlanklineChar', '#3D454D', '', '', 238, "NONE")
call s:H('IndentBlanklineSpaceChar', '#3D454D', '', '', 238, "NONE")
call s:H('IndentBlanklineContextChar', '#5B7F92', '', '', 66, "NONE")
call s:H('LazyNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('LazyH1', '#EEF2F6', '#56A0D1', 'bold', 255, 74)
call s:H('LazyH2', '#CCD2D7', '#30363C', 'bold', 252, 237)
call s:H('LazyButton', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('LazyButtonActive', '#EEF2F6', '#56A0D1', 'bold', 255, 74)
call s:H('LazyProgressTodo', '#8F9396', '', '', 246, "NONE")
call s:H('LazyProgressDone', '#65B095', '', '', 72, "NONE")
call s:H('LazyCommit', '#A280CB', '', '', 140, "NONE")
call s:H('LazyCommitIssue', '#C49A55', '', '', 173, "NONE")
call s:H('LazyReasonPlugin', '#8F9396', '', 'italic', 246, "NONE")
call s:H('LazySpecial', '#56A0D1', '', '', 74, "NONE")
call s:H('MasonNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('MasonHeader', '#EEF2F6', '#56A0D1', 'bold', 255, 74)
call s:H('MasonHighlight', '#56A0D1', '', '', 74, "NONE")
call s:H('MasonHighlightBlock', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('MasonHighlightBlockBold', '#EEF2F6', '#5B7F92', 'bold', 255, 66)
call s:H('MasonMuted', '#8F9396', '', '', 246, "NONE")
call s:H('MasonMutedBlock', '#EEF2F6', '#3D454D', '', 255, 238)
call s:H('MasonError', '#BA829A', '', '', 138, "NONE")
call s:H('MasonHeading', '#CCD2D7', '', 'bold', 252, "NONE")
call s:H('NotifyERRORTitle', '#BA829A', '#30363C', 'bold', 138, 237)
call s:H('NotifyERRORBorder', '#BA829A', '#30363C', '', 138, 237)
call s:H('NotifyERRORIcon', '#BA829A', '#30363C', '', 138, 237)
call s:H('NotifyWARNTitle', '#C49A55', '#30363C', 'bold', 173, 237)
call s:H('NotifyWARNBorder', '#C49A55', '#30363C', '', 173, 237)
call s:H('NotifyWARNIcon', '#C49A55', '#30363C', '', 173, 237)
call s:H('NotifyINFOTitle', '#65B095', '#30363C', 'bold', 72, 237)
call s:H('NotifyINFOBorder', '#65B095', '#30363C', '', 72, 237)
call s:H('NotifyINFOIcon', '#65B095', '#30363C', '', 72, 237)
call s:H('NotifyDEBUGTitle', '#71B6C9', '#30363C', 'bold', 74, 237)
call s:H('NotifyDEBUGBorder', '#71B6C9', '#30363C', '', 74, 237)
call s:H('NotifyDEBUGIcon', '#71B6C9', '#30363C', '', 74, 237)
call s:H('NotifyTRACETitle', '#3D454D', '#30363C', 'bold', 238, 237)
call s:H('NotifyTRACEBorder', '#3D454D', '#30363C', '', 238, 237)
call s:H('NotifyTRACEIcon', '#3D454D', '#30363C', '', 238, 237)
call s:H('NotifyINFOBody', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NotifyWARNBody', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NotifyERRORBody', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NotifyDEBUGBody', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('NotifyTRACEBody', '#8F9396', '#30363C', '', 246, 237)
call s:H('TroubleNormal', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('TroubleText', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('TroubleCount', '#EEF2F6', '#5B7F92', 'bold', 255, 66)
call s:H('TroubleSource', '#8F9396', '#30363C', '', 246, 237)
call s:H('TroubleCode', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('TroubleSignError', '#BA829A', '#30363C', '', 138, 237)
call s:H('TroubleSignWarning', '#C49A55', '#30363C', '', 173, 237)
call s:H('TroubleSignInformation', '#65B095', '#30363C', '', 72, 237)
call s:H('TroubleSignHint', '#5B7F92', '#30363C', '', 66, 237)
call s:H('DashboardHeader', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('DashboardCenter', '#CCD2D7', '', '', 252, "NONE")
call s:H('DashboardFooter', '#8F9396', '', 'italic', 246, "NONE")
call s:H('DashboardShortCut', '#5B7F92', '', '', 66, "NONE")
call s:H('DashboardKey', '#BFA065', '', '', 143, "NONE")
call s:H('DashboardIcon', '#5B7F92', '', '', 66, "NONE")
call s:H('DashboardDesc', '#CCD2D7', '', '', 252, "NONE")
call s:H('AlphaHeader', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('AlphaButtons', '#5B7F92', '', '', 66, "NONE")
call s:H('AlphaShortcut', '#BFA065', '', '', 143, "NONE")
call s:H('AlphaFooter', '#8F9396', '', 'italic', 246, "NONE")
call s:H('BufferLineFill', '', '#30363C', '', "NONE", 237)
call s:H('BufferLineBackground', '#8F9396', '#30363C', '', 246, 237)
call s:H('BufferLineBufferVisible', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('BufferLineBufferSelected', '#CCD2D7', '#1F252A', 'bold', 252, 235)
call s:H('BufferLineIndicatorSelected', '#56A0D1', '#30363C', '', 74, 237)
call s:H('BufferLineIndicatorVisible', '#8F9396', '#30363C', '', 246, 237)
call s:H('BufferLineSeparator', '#8F9396', '#30363C', '', 246, 237)
call s:H('BufferLineSeparatorVisible', '#8F9396', '#30363C', '', 246, 237)
call s:H('BufferLineSeparatorSelected', '#56A0D1', '#30363C', '', 74, 237)
call s:H('BufferLineModified', '#C49A55', '#30363C', '', 173, 237)
call s:H('BufferLineModifiedSelected', '#C49A55', '#30363C', '', 173, 237)
call s:H('BufferLineModifiedVisible', '#C49A55', '#30363C', '', 173, 237)
call s:H('BufferLineError', '#BA829A', '#30363C', '', 138, 237)
call s:H('BufferLineErrorSelected', '#BA829A', '#30363C', '', 138, 237)
call s:H('BufferLineTabSelected', '#EEF2F6', '#56A0D1', 'bold', 255, 74)
call s:H('BufferLineTab', '#8F9396', '#30363C', '', 246, 237)
call s:H('BufferLineCloseButton', '#8F9396', '#30363C', '', 246, 237)
call s:H('CmpItemAbbr', '#CCD2D7', '', '', 252, "NONE")
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
call s:H('CmpItemKindUnit', '#BFA065', '', '', 143, "NONE")
call s:H('CmpItemKindValue', '#BFA065', '', '', 143, "NONE")
call s:H('CmpItemKindSnippet', '#C49A55', '', '', 173, "NONE")
call s:H('CmpItemKindColor', '#65B095', '', '', 72, "NONE")
call s:H('CmpItemKindFile', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindReference', '#8F9396', '', '', 246, "NONE")
call s:H('CmpItemKindFolder', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindEvent', '#C49A55', '', '', 173, "NONE")
call s:H('CmpItemKindOperator', '#8F9396', '', '', 246, "NONE")
call s:H('CmpItemKindTypeParameter', '#56A0D1', '', '', 74, "NONE")
call s:H('CmpItemKindText', '#CCD2D7', '', '', 252, "NONE")
" --- plugin: blink.cmp ---
call s:H('BlinkCmpMenu', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('BlinkCmpMenuBorder', '#8F9396', '#30363C', '', 246, 237)
call s:H('BlinkCmpMenuSelection', '#EEF2F6', '#5B7F92', '', 255, 66)
call s:H('BlinkCmpLabel', '#CCD2D7', '', '', 252, "NONE")
call s:H('BlinkCmpLabelMatch', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('BlinkCmpLabelDeprecated', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpLabelDetail', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpLabelDescription', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpSource', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpScrollBarThumb', '', '#3D454D', '', "NONE", 238)
call s:H('BlinkCmpScrollBarGutter', '', '#30363C', '', "NONE", 237)
call s:H('BlinkCmpGhostText', '#3D454D', '', '', 238, "NONE")
call s:H('BlinkCmpDoc', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('BlinkCmpDocBorder', '#8F9396', '#30363C', '', 246, 237)
call s:H('BlinkCmpDocSeparator', '#8F9396', '#30363C', '', 246, 237)
call s:H('BlinkCmpDocCursorLine', '', '#30363C', '', "NONE", 237)
call s:H('BlinkCmpSignatureHelp', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('BlinkCmpSignatureHelpBorder', '#8F9396', '#30363C', '', 246, 237)
call s:H('BlinkCmpSignatureHelpActiveParameter', '#56A0D1', '', 'underline', 74, "NONE")
call s:H('BlinkCmpKind', '#A280CB', '', '', 140, "NONE")
call s:H('BlinkCmpKindText', '#CCD2D7', '', '', 252, "NONE")
call s:H('BlinkCmpKindMethod', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindFunction', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindConstructor', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindField', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindVariable', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindClass', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindInterface', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindModule', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindProperty', '#5B7F92', '', '', 66, "NONE")
call s:H('BlinkCmpKindUnit', '#BFA065', '', '', 143, "NONE")
call s:H('BlinkCmpKindValue', '#BFA065', '', '', 143, "NONE")
call s:H('BlinkCmpKindEnum', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindKeyword', '#A280CB', '', '', 140, "NONE")
call s:H('BlinkCmpKindSnippet', '#C49A55', '', '', 173, "NONE")
call s:H('BlinkCmpKindColor', '#65B095', '', '', 72, "NONE")
call s:H('BlinkCmpKindFile', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindReference', '#8F9396', '', '', 246, "NONE")
call s:H('BlinkCmpKindFolder', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindEnumMember', '#A280CB', '', '', 140, "NONE")
call s:H('BlinkCmpKindConstant', '#A280CB', '', '', 140, "NONE")
call s:H('BlinkCmpKindStruct', '#56A0D1', '', '', 74, "NONE")
call s:H('BlinkCmpKindEvent', '#C49A55', '', '', 173, "NONE")
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
call s:H('DropBarMenuHoverEntry', '#EEF2F6', '#C49A55', '', 255, 173)
call s:H('DropBarMenuHoverIcon', '', '', 'reverse', "NONE", "NONE")
call s:H('DropBarMenuHoverSymbol', '', '', 'bold', "NONE", "NONE")
call s:H('DropBarIconUISeparator', '#8F9396', '', '', 246, "NONE")
" --- plugin: winbar ---
call s:H('WinBar', '#CCD2D7', '', 'bold', 252, "NONE")
call s:H('WinBarNC', '#8F9396', '', '', 246, "NONE")
call s:H('FlashBackdrop', '#8F9396', '', '', 246, "NONE")
call s:H('FlashMatch', '#CCD2D7', '#6D5625', '', 252, 58)
call s:H('FlashCurrent', '#EEF2F6', '#56A0D1', 'bold', 255, 74)
call s:H('FlashLabel', '#EEF2F6', '#C49A55', 'bold', 255, 173)
call s:H('HopNextKey', '#56A0D1', '', 'bold', 74, "NONE")
call s:H('HopNextKey1', '#A280CB', '', 'bold', 140, "NONE")
call s:H('HopNextKey2', '#BFA065', '', '', 143, "NONE")
call s:H('HopUnmatched', '#8F9396', '', '', 246, "NONE")
call s:H('HopCursor', '#56A0D1', '', '', 74, "NONE")
call s:H('LeapMatch', '#EEF2F6', '#C49A55', 'bold', 255, 173)
call s:H('LeapLabelPrimary', '#EEF2F6', '#56A0D1', 'bold', 255, 74)
call s:H('LeapLabelSecondary', '#EEF2F6', '#A280CB', 'bold', 255, 140)
call s:H('LeapLabelSelected', '#EEF2F6', '#C49A55', 'bold', 255, 173)
call s:H('LeapBackdrop', '#8F9396', '', '', 246, "NONE")
call s:H('MiniIndentscopeSymbol', '#5B7F92', '', '', 66, "NONE")
call s:H('MiniStatuslineModeNormal', '#EEF2F6', '#56A0D1', 'bold', 255, 74)
call s:H('MiniStatuslineModeInsert', '#EEF2F6', '#D19AB0', 'bold', 255, 175)
call s:H('MiniStatuslineModeVisual', '#EEF2F6', '#A280CB', 'bold', 255, 140)
call s:H('MiniStatuslineModeReplace', '#EEF2F6', '#D0AE68', 'bold', 255, 179)
call s:H('MiniStatuslineModeCommand', '#EEF2F6', '#71B6C9', 'bold', 255, 74)
call s:H('MiniStatuslineInactive', '#CCD2D7', '#30363C', '', 252, 237)
call s:H('MiniJump', '#EEF2F6', '#C49A55', 'bold', 255, 173)
call s:H('MiniCompletionActiveParameter', '', '', 'underline', "NONE", "NONE")
call s:H('NavicText', '#CCD2D7', '', '', 252, "NONE")
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
call s:H('NavicIconsUnit', '#BFA065', '', '', 143, "NONE")
call s:H('NavicIconsValue', '#BFA065', '', '', 143, "NONE")
call s:H('NavicIconsSnippet', '#C49A55', '', '', 173, "NONE")
call s:H('NavicIconsColor', '#65B095', '', '', 72, "NONE")
call s:H('ScrollbarHandle', '', '#30363C', '', "NONE", 237)
call s:H('ScrollbarSearch', '#D0AE68', '', '', 179, "NONE")
call s:H('ScrollbarError', '#BA829A', '', '', 138, "NONE")
call s:H('ScrollbarWarn', '#C49A55', '', '', 173, "NONE")
call s:H('ScrollbarInfo', '#65B095', '', '', 72, "NONE")
call s:H('ScrollbarHint', '#5B7F92', '', '', 66, "NONE")
call s:H('ScrollbarMisc', '#A280CB', '', '', 140, "NONE")

" --- terminal colors ---
let g:terminal_color_0 = "#1A2026"
let g:terminal_color_1 = "#D19AB0"
let g:terminal_color_2 = "#71C0A2"
let g:terminal_color_3 = "#D0AE68"
let g:terminal_color_4 = "#56A0D1"
let g:terminal_color_5 = "#B88FD5"
let g:terminal_color_6 = "#71B6C9"
let g:terminal_color_7 = "#3D454D"
let g:terminal_color_8 = "#39414A"
let g:terminal_color_9 = "#E0B3C4"
let g:terminal_color_10 = "#8ED4B8"
let g:terminal_color_11 = "#E2C284"
let g:terminal_color_12 = "#7DB8E0"
let g:terminal_color_13 = "#CBA7E4"
let g:terminal_color_14 = "#93CCDD"
let g:terminal_color_15 = "#E8EDF2"
