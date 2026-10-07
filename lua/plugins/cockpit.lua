local palette = {
  bg = "#111720", fg = "#f0f4ff", muted = "#8b96b3",
  blue = "#59d8ff", green = "#a8ff60", pink = "#ff79c6",
  orange = "#ffad55", purple = "#bd93ff",
}

return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = { scope = { enabled = true }, animate = { enabled = true } },
      zen = { win = { width = 110 }, show = { statusline = true } },
      dashboard = {
        sections = {
          { section = "header" },
          {
            section = "terminal", cmd = "lavat -c cyan -k magenta -R 1 -b 5 -s 2",
            height = 7, padding = 1, ttl = 0,
            enabled = function() return vim.fn.executable("lavat") == 1 end,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, title = "Recent Files", section = "recent_files", limit = 6, padding = 1 },
          { pane = 2, title = "Projects", section = "projects", limit = 4, padding = 1 },
          { section = "startup" },
        },
      },
    },
    keys = {
      {
        "<leader>uz",
        function()
          if package.loaded["mini.map"] then require("mini.map").close() end
          Snacks.zen()
        end,
        desc = "Toggle Focus Cockpit",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local function mode(color)
        return { a = { fg = palette.bg, bg = color, gui = "bold" },
          b = { fg = palette.fg, bg = "#202936" }, c = { fg = palette.muted, bg = palette.bg } }
      end
      opts.options.theme = {
        normal = mode(palette.blue), insert = mode(palette.green),
        visual = mode(palette.pink), replace = mode(palette.orange),
        command = mode(palette.purple), inactive = mode(palette.muted),
      }
      opts.options.component_separators = "│"
      opts.options.section_separators = { left = "", right = "" }
      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 }, "diagnostics" },
        lualine_x = { "diff", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      }
      opts.winbar = {
        lualine_c = {
          { "filename", path = 0, color = { fg = palette.blue } },
          { "navic", color_correction = "dynamic",
            cond = function() return require("nvim-navic").is_available() end },
        },
      }
      opts.inactive_winbar = { lualine_c = { { "filename", path = 0 } } }
      opts.options.disabled_filetypes.winbar = {
        "snacks_dashboard", "snacks_picker_list", "snacks_picker_input",
        "snacks_layout_box", "lazy", "mason", "help", "codewindow", "terminal",
      }
    end,
    dependencies = { "SmiteshP/nvim-navic" },
  },
  {
    "SmiteshP/nvim-navic",
    opts = { highlight = true, separator = " › ", depth_limit = 5, lazy_update_context = true },
    config = function(_, opts)
      local navic = require("nvim-navic")
      navic.setup(opts)
      local function attach(client, buf)
        if client and client:supports_method("textDocument/documentSymbol", buf)
          and not vim.b[buf].navic_client_id then
          navic.attach(client, buf)
        end
      end
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("NeonNavic", { clear = true }),
        callback = function(ev) attach(vim.lsp.get_client_by_id(ev.data.client_id), ev.buf) end,
      })
      for _, client in ipairs(vim.lsp.get_clients()) do
        for buf in pairs(client.attached_buffers) do attach(client, buf) end
      end
    end,
  },
  { "HiPhish/rainbow-delimiters.nvim", event = { "BufReadPost", "BufNewFile" } },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = { max_lines = 3, multiline_threshold = 1, trim_scope = "outer", mode = "cursor" },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    opts = { preset = "modern", transparent_bg = true,
      options = { show_source = { enabled = true }, multilines = { enabled = true } } },
  },
  { "neovim/nvim-lspconfig", opts = { diagnostics = { virtual_text = false } } },
  {
    "saghen/blink.cmp",
    opts = { completion = {
      menu = { border = "rounded" },
      documentation = { auto_show = true, auto_show_delay_ms = 200, window = { border = "rounded" } },
    }, signature = { enabled = true, window = { border = "rounded" } } },
  },
  {
    "nvim-mini/mini.map",
    keys = { { "<leader>um", function() require("mini.map").toggle() end, desc = "Toggle Code Minimap" } },
    config = function()
      local map = require("mini.map")
      map.setup({
        symbols = { encode = map.gen_encode_symbols.dot("4x2") },
        window = { width = 12, winblend = 15, focusable = false },
        integrations = { map.gen_integration.builtin_search(), map.gen_integration.diagnostic() },
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = { code = { border = "thin" }, heading = { sign = false } },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
  },
}
