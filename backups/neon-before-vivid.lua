return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
      styles = { sidebars = "transparent", floats = "transparent", comments = { italic = true } },
      on_colors = function(c)
        c.blue = "#59d8ff"
        c.cyan = "#67e8f9"
        c.purple = "#c084fc"
        c.comment = "#858b98"
      end,
      on_highlights = function(hl, c)
        hl.FloatBorder = { fg = c.blue, bg = "NONE" }
        hl.WinSeparator = { fg = "#303644", bg = "NONE" }
        hl.CursorLine = { bg = "#171c24" }
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
