-- Gruvbox Flutter Theme for Neovim.
-- Port of themes/gruvbox-flutter-theme.json (VS Code): same palette, and the
-- TextMate scopes / Dart LSP semantic tokens mapped to Treesitter and
-- @lsp.* highlight groups. Keep the palette in sync with the JSON theme.

local M = {}

M.palette = {
  -- background / ui (original gruvbox, as in the VS Code workbench)
  bg_dim = "#1d2021",
  bg0 = "#282828",
  bg1 = "#32302f",
  bg2 = "#383432",
  bg3 = "#3c3836",
  bg4 = "#45403d",
  bg5 = "#504945",
  bg6 = "#665c54",
  grey0 = "#7c6f64",
  grey1 = "#928374",
  fg = "#ebdbb2", -- editor.foreground
  fg_bright = "#f2e7ca", -- Dart identifiers / parameters
  fg_soft = "#d4be98", -- variables, properties, punctuation
  fg_white = "#ddc7a1",

  -- syntax (gruvbox material)
  red = "#ea6962",
  orange = "#e78a4e",
  yellow = "#d8a657",
  green = "#a9b665",
  aqua = "#89b482",
  blue = "#7daea3",
  purple = "#d3869b",

  -- accents (original gruvbox)
  bright_orange = "#fe8019",
  bright_yellow = "#fabd2f",
  bright_aqua = "#8ec07c",
  dark_orange = "#d65d0e",

  -- diagnostics / git (dimmed)
  diag_red = "#b85651",
  diag_yellow = "#c18f41",
  diag_blue = "#68948a",
  diag_purple = "#ab6c7d",
  git_green = "#8f9a52",
  diff_add = "#34381b",
  diff_change = "#0e363e",
  diff_delete = "#402120",
  diff_text = "#2a4a52",

  -- status bar
  status_bg = "#8FBCBB",
  status_fg = "#434C5E",

  none = "NONE",
}

local function groups(p)
  return {
    -- Editor UI -------------------------------------------------------------
    Normal = { fg = p.fg, bg = p.bg0 },
    NormalNC = { link = "Normal" },
    NormalFloat = { fg = p.fg, bg = p.bg3 },
    FloatBorder = { fg = p.bg5, bg = p.bg3 },
    FloatTitle = { fg = p.bright_orange, bg = p.bg3, bold = true },
    ColorColumn = { bg = p.bg1 },
    Conceal = { fg = p.grey0 },
    Cursor = { fg = p.bg0, bg = p.bright_orange },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    TermCursor = { link = "Cursor" },
    CursorLine = { bg = p.bg1 },
    CursorColumn = { bg = p.bg1 },
    CursorLineNr = { fg = p.bright_yellow },
    LineNr = { fg = p.grey0 },
    SignColumn = { fg = p.fg, bg = p.none },
    FoldColumn = { fg = p.grey0 },
    Folded = { fg = p.grey1, bg = p.bg1 },
    VertSplit = { fg = p.bg3 },
    WinSeparator = { fg = p.bg3 },
    EndOfBuffer = { fg = p.bg0 },
    NonText = { fg = p.bg4 },
    Whitespace = { fg = p.bg4 },
    SpecialKey = { fg = p.bg4 },
    MatchParen = { bg = p.bg6, bold = true },
    Visual = { bg = p.bg5 },
    VisualNOS = { link = "Visual" },
    Search = { bg = p.bg5, fg = p.bright_yellow },
    IncSearch = { fg = p.bg0, bg = p.bright_orange },
    CurSearch = { link = "IncSearch" },
    Substitute = { fg = p.bg0, bg = p.yellow },
    Pmenu = { fg = p.fg, bg = p.bg2 },
    PmenuSel = { bg = p.bg4, bold = true },
    PmenuSbar = { bg = p.bg2 },
    PmenuThumb = { bg = p.grey0 },
    PmenuKind = { fg = p.blue, bg = p.bg2 },
    PmenuExtra = { fg = p.grey1, bg = p.bg2 },
    PmenuMatch = { fg = p.bright_orange, bg = p.bg2, bold = true },
    PmenuMatchSel = { fg = p.bright_orange, bg = p.bg4, bold = true },
    WildMenu = { link = "PmenuSel" },
    StatusLine = { fg = p.status_fg, bg = p.status_bg },
    StatusLineNC = { fg = p.grey1, bg = p.bg1 },
    TabLine = { fg = p.grey1, bg = p.bg0 },
    TabLineFill = { bg = p.bg0 },
    TabLineSel = { fg = p.fg, bg = p.bg3, bold = true },
    WinBar = { fg = p.grey1 },
    WinBarNC = { fg = p.grey0 },
    Title = { fg = p.bright_orange, bold = true },
    Directory = { fg = p.blue },
    Question = { fg = p.yellow },
    MoreMsg = { fg = p.yellow, bold = true },
    ModeMsg = { fg = p.fg, bold = true },
    MsgArea = { fg = p.fg },
    ErrorMsg = { fg = p.red, bold = true },
    WarningMsg = { fg = p.yellow, bold = true },
    QuickFixLine = { fg = p.purple, bold = true },
    SpellBad = { sp = p.red, undercurl = true },
    SpellCap = { sp = p.blue, undercurl = true },
    SpellLocal = { sp = p.aqua, undercurl = true },
    SpellRare = { sp = p.purple, undercurl = true },

    -- Diff ------------------------------------------------------------------
    DiffAdd = { bg = p.diff_add },
    DiffChange = { bg = p.diff_change },
    DiffDelete = { bg = p.diff_delete },
    DiffText = { bg = p.diff_text },
    Added = { fg = p.green },
    Changed = { fg = p.blue },
    Removed = { fg = p.red },
    diffAdded = { link = "Added" },
    diffChanged = { link = "Changed" },
    diffRemoved = { link = "Removed" },

    -- Legacy syntax groups (base for Treesitter links) ----------------------
    Comment = { fg = p.grey1, italic = true },
    Constant = { fg = p.purple },
    String = { fg = p.yellow },
    Character = { fg = p.yellow },
    Number = { fg = p.purple },
    Boolean = { fg = p.purple },
    Float = { fg = p.purple },
    Identifier = { fg = p.fg_soft },
    Function = { fg = p.green },
    Statement = { fg = p.red },
    Conditional = { fg = p.red },
    Repeat = { fg = p.red },
    Label = { fg = p.aqua },
    Operator = { fg = p.orange },
    Keyword = { fg = p.red },
    Exception = { fg = p.red },
    PreProc = { fg = p.aqua },
    Include = { fg = p.purple },
    Define = { fg = p.aqua },
    Macro = { fg = p.purple },
    PreCondit = { fg = p.aqua },
    Type = { fg = p.blue },
    StorageClass = { fg = p.orange },
    Structure = { fg = p.blue },
    Typedef = { fg = p.red },
    Special = { fg = p.green },
    SpecialChar = { fg = p.green },
    Tag = { fg = p.orange },
    Delimiter = { fg = p.fg_soft },
    SpecialComment = { fg = p.grey1, italic = true },
    Debug = { fg = p.red },
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = p.grey0 },
    Error = { fg = p.red },
    Todo = { fg = p.bg0, bg = p.yellow, bold = true },

    -- Treesitter ------------------------------------------------------------
    ["@variable"] = { fg = p.fg_soft },
    ["@variable.builtin"] = { fg = p.purple },
    ["@variable.parameter"] = { fg = p.fg_bright },
    ["@variable.member"] = { fg = p.fg_soft },
    ["@property"] = { fg = p.fg_soft },
    ["@constant"] = { fg = p.purple },
    ["@constant.builtin"] = { fg = p.purple },
    ["@constant.macro"] = { fg = p.purple },
    ["@module"] = { fg = p.aqua },
    ["@module.builtin"] = { fg = p.aqua },
    ["@label"] = { fg = p.aqua },

    ["@string"] = { link = "String" },
    ["@string.documentation"] = { link = "Comment" },
    ["@string.regexp"] = { fg = p.yellow },
    ["@string.escape"] = { fg = p.green },
    ["@string.special"] = { fg = p.green },
    ["@string.special.url"] = { fg = p.green, underline = true },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { fg = p.green },
    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Number" },

    ["@type"] = { fg = p.blue },
    ["@type.builtin"] = { fg = p.blue },
    ["@type.definition"] = { fg = p.blue },
    ["@attribute"] = { fg = p.aqua },
    ["@attribute.builtin"] = { fg = p.aqua },

    ["@function"] = { fg = p.green },
    ["@function.builtin"] = { fg = p.green },
    ["@function.call"] = { fg = p.green },
    ["@function.macro"] = { fg = p.purple },
    ["@function.method"] = { fg = p.green },
    ["@function.method.call"] = { fg = p.green },
    ["@constructor"] = { fg = p.blue },
    ["@operator"] = { link = "Operator" },

    ["@keyword"] = { fg = p.red },
    ["@keyword.coroutine"] = { fg = p.red },
    ["@keyword.function"] = { fg = p.red },
    ["@keyword.operator"] = { fg = p.orange },
    ["@keyword.import"] = { fg = p.purple },
    ["@keyword.type"] = { fg = p.red },
    ["@keyword.modifier"] = { fg = p.orange },
    ["@keyword.repeat"] = { fg = p.red },
    ["@keyword.return"] = { fg = p.red },
    ["@keyword.debug"] = { fg = p.red },
    ["@keyword.exception"] = { fg = p.red },
    ["@keyword.conditional"] = { fg = p.red },
    ["@keyword.conditional.ternary"] = { fg = p.orange },
    ["@keyword.directive"] = { fg = p.aqua },
    ["@keyword.directive.define"] = { fg = p.aqua },

    ["@punctuation.delimiter"] = { fg = p.fg_soft },
    ["@punctuation.bracket"] = { fg = p.fg_soft },
    ["@punctuation.special"] = { fg = p.green },

    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@comment.error"] = { fg = p.bg0, bg = p.red, bold = true },
    ["@comment.warning"] = { fg = p.bg0, bg = p.yellow, bold = true },
    ["@comment.todo"] = { fg = p.bg0, bg = p.blue, bold = true },
    ["@comment.note"] = { fg = p.bg0, bg = p.aqua, bold = true },

    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = p.orange, bold = true },
    ["@markup.heading.1"] = { fg = p.red, bold = true },
    ["@markup.heading.2"] = { fg = p.orange, bold = true },
    ["@markup.heading.3"] = { fg = p.yellow, bold = true },
    ["@markup.heading.4"] = { fg = p.green, bold = true },
    ["@markup.heading.5"] = { fg = p.blue, bold = true },
    ["@markup.heading.6"] = { fg = p.purple, bold = true },
    ["@markup.quote"] = { fg = p.grey1, italic = true },
    ["@markup.math"] = { fg = p.blue },
    ["@markup.link"] = { fg = p.purple },
    ["@markup.link.label"] = { fg = p.purple },
    ["@markup.link.url"] = { fg = p.green, underline = true },
    ["@markup.raw"] = { fg = p.green },
    ["@markup.raw.block"] = { fg = p.green },
    ["@markup.list"] = { fg = p.red },
    ["@markup.list.checked"] = { fg = p.green },
    ["@markup.list.unchecked"] = { fg = p.grey1 },
    ["@diff.plus"] = { link = "Added" },
    ["@diff.minus"] = { link = "Removed" },
    ["@diff.delta"] = { link = "Changed" },
    ["@tag"] = { fg = p.orange },
    ["@tag.attribute"] = { fg = p.yellow },
    ["@tag.delimiter"] = { fg = p.fg_soft },

    -- Dart (mirrors the Dart overrides in themes/overrides.json) -------------
    ["@variable.dart"] = { fg = p.fg_bright }, -- source.dart
    ["@variable.builtin.dart"] = { fg = p.red }, -- this / super
    ["@keyword.modifier.dart"] = { fg = p.red }, -- final, const, static, late...
    ["@type.builtin.dart"] = { fg = p.red }, -- void, dynamic, var
    ["@attribute.dart"] = { fg = p.fg_soft }, -- @override
    ["@punctuation.delimiter.dot.dart"] = { fg = p.grey1 }, -- punctuation.dot.dart
    ["@string.special.url.dart"] = { fg = p.green }, -- import URIs, no underline

    -- LSP semantic tokens (VS Code's semantic -> TextMate fallback) ---------
    ["@lsp.type.class"] = { fg = p.blue },
    ["@lsp.type.enum"] = { fg = p.blue },
    ["@lsp.type.interface"] = { fg = p.blue },
    ["@lsp.type.struct"] = { fg = p.blue },
    ["@lsp.type.type"] = { fg = p.blue },
    ["@lsp.type.typeParameter"] = { fg = p.blue },
    ["@lsp.type.function"] = { fg = p.green },
    ["@lsp.type.method"] = { fg = p.green },
    ["@lsp.type.macro"] = { fg = p.purple },
    ["@lsp.type.decorator"] = { fg = p.aqua },
    ["@lsp.type.property"] = { fg = p.fg_soft },
    ["@lsp.type.variable"] = { fg = p.fg_soft },
    ["@lsp.type.parameter"] = { fg = p.fg_bright },
    ["@lsp.type.enumMember"] = { fg = p.fg_soft },
    ["@lsp.type.namespace"] = { fg = p.fg },
    ["@lsp.type.number"] = { fg = p.purple },
    ["@lsp.type.boolean"] = { fg = p.purple },
    -- The VS Code theme lets the grammar win for these, so leave Treesitter.
    ["@lsp.type.keyword"] = {},
    ["@lsp.type.string"] = {},
    ["@lsp.type.comment"] = {},
    ["@lsp.type.annotation.dart"] = { fg = p.fg_soft },
    ["@lsp.type.source.dart"] = { fg = p.green }, -- [references] in doc comments
    ["@lsp.mod.defaultLibrary"] = {},
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = p.purple },

    -- Diagnostics -------------------------------------------------------------
    DiagnosticError = { fg = p.red },
    DiagnosticWarn = { fg = p.yellow },
    DiagnosticInfo = { fg = p.blue },
    DiagnosticHint = { fg = p.purple },
    DiagnosticOk = { fg = p.green },
    DiagnosticVirtualTextError = { fg = p.diag_red },
    DiagnosticVirtualTextWarn = { fg = p.diag_yellow },
    DiagnosticVirtualTextInfo = { fg = p.diag_blue },
    DiagnosticVirtualTextHint = { fg = p.diag_purple },
    DiagnosticUnderlineError = { sp = p.red, undercurl = true },
    DiagnosticUnderlineWarn = { sp = p.yellow, undercurl = true },
    DiagnosticUnderlineInfo = { sp = p.blue, undercurl = true },
    DiagnosticUnderlineHint = { sp = p.purple, undercurl = true },
    DiagnosticUnnecessary = { fg = p.grey0 },
    DiagnosticDeprecated = { strikethrough = true },
    LspReferenceText = { bg = p.bg4 },
    LspReferenceRead = { bg = p.bg4 },
    LspReferenceWrite = { bg = p.bg4, underline = true, sp = p.bright_yellow },
    LspInlayHint = { fg = p.grey0, italic = true },
    LspSignatureActiveParameter = { fg = p.bright_orange, bold = true },
    LspCodeLens = { fg = p.grey0 },

    -- Plugins -----------------------------------------------------------------
    GitSignsAdd = { fg = p.git_green },
    GitSignsChange = { fg = p.diag_blue },
    GitSignsDelete = { fg = p.diag_red },

    TelescopeNormal = { link = "NormalFloat" },
    TelescopeBorder = { link = "FloatBorder" },
    TelescopeTitle = { link = "FloatTitle" },
    TelescopeSelection = { bg = p.bg5 },
    TelescopeMatching = { fg = p.bright_orange, bold = true },
    TelescopePromptPrefix = { fg = p.bright_orange },

    NvimTreeNormal = { fg = p.fg, bg = p.bg0 },
    NvimTreeFolderIcon = { fg = p.blue },
    NvimTreeFolderName = { fg = p.fg },
    NvimTreeOpenedFolderName = { fg = p.fg, bold = true },
    NvimTreeRootFolder = { fg = p.bright_orange, bold = true },
    NvimTreeGitDirty = { fg = p.yellow },
    NvimTreeGitNew = { fg = p.green },
    NvimTreeGitDeleted = { fg = p.red },
    NeoTreeNormal = { fg = p.fg, bg = p.bg0 },
    NeoTreeNormalNC = { link = "NeoTreeNormal" },
    NeoTreeRootName = { fg = p.bright_orange, bold = true },
    NeoTreeDirectoryIcon = { fg = p.blue },

    BlinkCmpMenu = { link = "Pmenu" },
    BlinkCmpMenuSelection = { link = "PmenuSel" },
    BlinkCmpLabelMatch = { link = "PmenuMatch" },
    CmpItemAbbrMatch = { fg = p.bright_orange, bold = true },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
    CmpItemKind = { fg = p.blue },
    CmpItemMenu = { fg = p.grey1 },

    IblIndent = { fg = p.bg3 },
    IblScope = { fg = p.bg6 },
    WhichKey = { fg = p.bright_orange },
    WhichKeyGroup = { fg = p.blue },
    WhichKeyDesc = { fg = p.fg },
  }
end

local function terminal(p)
  local colors = {
    "#32302f", p.red, p.green, p.yellow, p.blue, p.purple, p.aqua, p.fg_soft,
    p.grey1, p.red, p.green, p.yellow, p.blue, p.purple, p.aqua, p.fg_white,
  }
  for i, c in ipairs(colors) do
    vim.g["terminal_color_" .. (i - 1)] = c
  end
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "gruvbox-flutter"

  local p = M.palette
  for name, spec in pairs(groups(p)) do
    vim.api.nvim_set_hl(0, name, spec)
  end
  terminal(p)
end

return M
