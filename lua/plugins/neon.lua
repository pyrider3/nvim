return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = { sidebars = "transparent", floats = "dark", comments = { italic = true } },
      on_colors = function(c)
        c.fg = "#f0f4ff"
        c.blue = "#59d8ff"
        c.cyan = "#00f5d4"
        c.purple = "#bd93ff"
        c.magenta = "#ff79c6"
        c.green = "#a8ff60"
        c.green1 = "#55efc4"
        c.yellow = "#ffe66d"
        c.orange = "#ffad55"
        c.red = "#ff5c7c"
        c.comment = "#8b96b3"
      end,
      on_highlights = function(hl, c)
        hl.NormalFloat = { fg = c.fg, bg = "#111720" }
        hl.FloatBorder = { fg = c.blue, bg = "#111720" }
        hl.WinSeparator = { fg = "#303644", bg = "NONE" }
        hl.CursorLine = { bg = "#171c24" }
        hl.CursorLineNr = { fg = c.blue, bold = true }
        hl.NeonNormalCursor = { fg = "#10141c", bg = c.blue }
        hl.NeonInsertCursor = { fg = "#10141c", bg = c.green }
        hl.NeonReplaceCursor = { fg = "#10141c", bg = c.red }
        hl.NeonVisualCursor = { fg = "#10141c", bg = c.magenta }
        hl.NeonYank = { fg = "#10141c", bg = c.cyan }
        hl.NeonLanding = { bg = "#263849" }
        hl.Search = { fg = "#10141c", bg = c.yellow }
        hl.IncSearch = { fg = "#10141c", bg = c.orange }
        hl.CurSearch = { fg = "#10141c", bg = c.orange, bold = true }
        hl.MatchParen = { fg = c.cyan, bg = "#253746", bold = true }
        hl.SnacksIndent = { fg = "#303644" }
        hl.SnacksIndentScope = { fg = c.cyan }
        hl.TreesitterContext = { bg = "#171c24" }
        hl.TreesitterContextLineNumber = { fg = c.purple, bg = "#171c24" }
        hl.BlinkCmpMenu = { fg = c.fg, bg = "#111720" }
        hl.BlinkCmpMenuSelection = { bg = "#293749", bold = true }
        hl.BlinkCmpDoc = { fg = c.fg, bg = "#111720" }
        hl.BlinkCmpDocBorder = { fg = c.blue, bg = "#111720" }
        hl["@markup.raw.markdown_inline"] = { fg = c.blue, bg = "NONE" }
        hl.RenderMarkdownCodeInline = { fg = c.blue, bg = "NONE" }
        hl.RenderMarkdownCode = { bg = "NONE" }
        for level = 1, 6 do
          hl["RenderMarkdownH" .. level .. "Bg"] = { bg = "NONE" }
        end
        -- Distinct, vivid colors for syntax and Treesitter captures.
        local syntax = {
          Keyword = c.magenta, Conditional = c.magenta, Repeat = c.magenta,
          Statement = c.magenta, Include = c.purple, PreProc = c.purple,
          Function = c.blue, String = c.green, Character = c.green,
          Number = c.orange, Float = c.orange, Boolean = c.orange,
          Type = c.yellow, Constant = c.orange, Operator = c.cyan,
          Special = c.purple, Identifier = c.fg,
          ["@keyword"] = c.magenta, ["@keyword.function"] = c.magenta,
          ["@keyword.return"] = c.magenta, ["@keyword.import"] = c.purple,
          ["@function"] = c.blue, ["@function.builtin"] = c.cyan,
          ["@function.method"] = c.blue, ["@constructor"] = c.yellow,
          ["@string"] = c.green, ["@string.escape"] = c.magenta,
          ["@number"] = c.orange, ["@boolean"] = c.orange,
          ["@type"] = c.yellow, ["@type.builtin"] = c.yellow,
          ["@operator"] = c.cyan, ["@variable.member"] = c.cyan,
          ["@variable.parameter"] = c.purple, ["@variable.builtin"] = c.red,
          ["@constant"] = c.orange, ["@tag"] = c.magenta,
          ["@tag.attribute"] = c.yellow, ["@tag.delimiter"] = c.cyan,
          SnacksDashboardHeader = c.magenta, SnacksDashboardIcon = c.cyan,
          SnacksDashboardKey = c.yellow, SnacksDashboardDesc = c.blue,
          SnacksDashboardFooter = c.purple,
        }
        for group, color in pairs(syntax) do
          hl[group] = { fg = color }
        end
      end,
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "tokyonight-night" } },
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = true },
      indent = { enabled = true },
      explorer = { enabled = true },
      picker = { win = { input = { border = "rounded" }, preview = { border = "rounded" } } },
      dashboard = {
        preset = {
          header = [[
    ███╗   ██╗███████╗ ██████╗ ███╗   ██╗
    ████╗  ██║██╔════╝██╔═══██╗████╗  ██║
    ██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║
    ██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║
    ██║ ╚████║███████╗╚██████╔╝██║ ╚████║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
          N E O V I M  /  L A Z Y V I M
]],
        },
      },
    },
  },
  { "folke/which-key.nvim", opts = { win = { border = "rounded" } } },
}
