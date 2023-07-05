return {
  -- Telescope - Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  init = function()
    require("telescope").load_extension("projects")
  end,

  opts = {
    defaults = {
      hidden = true,
      layout_strategy = "flex",
      -- color_devicons = false,
      layout_config = {
        height = 0.80,
        width = 0.80
      },
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
		"ahmedkhalf/project.nvim",
			config = function ()
				require("project_nvim").setup()
			end,
		},
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = vim.fn.executable "make" == 1,
      config = function()
        pcall(require("telescope").load_extension("fzf"))
      end,
    },
  },
}
