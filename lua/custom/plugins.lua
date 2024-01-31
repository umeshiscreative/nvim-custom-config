local plugins = {

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },
  --[[
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    ft = "go",
    opts = function()
       return require "custom.configs.null-ls"
    end,
  },
  
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },
  --]]
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
 --       "eslint_d",
        "js-debug-adapter",
        "prettier",
--        "prettierd",
        "typescript-language-server",
        "pyright",--For Python,
        "gopls", --For Golang
        "gofumpt",
        "golines",
        "goimports-reviser"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "akinsho/bufferline.nvim",
    --version = "*",
    version = "v4.4.1",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function ()
      require "custom.configs.bufferline"
    end
  },
  --[[
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      require "custom.configs.catppuccin"
    end
  },
  --]]
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "make",
        "python",
        "yaml",
        "dockerfile",
      }
      return opts
    end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    lazy = false,
    config = function()
      require("pretty-fold").setup()
    end
  },
  --[[
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end, { expr = true })

          -- Actions
          map("n", "<leader>gs", gs.stage_hunk, { desc = "GitSigns state hunk" })
          map("n", "<leader>gr", gs.reset_hunk, { desc = "GitSigns reset hunk" })
          map("v", "<leader>gs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "GitSigns stage_hunk" })
          map("v", "<leader>gr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "GitSigns reset_hunk" })
          map("n", "<leader>gS", gs.stage_buffer, { desc = "GitSigns stage_buffer" })
          map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "GitSigns undo_stage_hunk" })
          map("n", "<leader>gR", gs.reset_buffer, { desc = "GitSigns reset_buffer" })
          map("n", "<leader>gp", gs.preview_hunk, { desc = "GitSigns preview_hunk" })
          map("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end, { desc = "GitSigns blame line" })
          map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "GitSigns toggle blame" })
          map("n", "<leader>gd", gs.diffthis, { desc = "GitSigns diffthis" })
          map("n", "<leader>gD", function()
            gs.diffthis("~")
          end, { desc = "GitSigns diffthis" })
          map("n", "<leader>gtd", gs.toggle_deleted, { desc = "GitSigns toggle_deleted" })

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "GitSigns select hunk" })
        end,
      })
    end,
  },
  --]]
  {
   'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      require "custom.configs.aerial"
    end
  }
}
return plugins
