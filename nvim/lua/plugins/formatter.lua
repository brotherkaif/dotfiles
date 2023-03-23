return {
  -- formatting helper
  'mhartington/formatter.nvim',
  opts = {
    filetype = {
      typescript = {
        function()
          return {
            exe = 'prettier',
            args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
            stdin = true
          }
        end
      },
      typescriptreact = {
        function()
          return {
            exe = 'prettier',
            args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
            stdin = true
          }
        end
      },
      javascript = {
        function()
          return {
            exe = 'prettier',
            args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
            stdin = true
          }
        end
      },
      javascriptreact = {
        function()
          return {
            exe = 'prettier',
            args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
            stdin = true
          }
        end
      },
      json = {
        function()
          return {
            exe = 'prettier',
            args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
            stdin = true
          }
        end
      },
      markdown = {
        function()
          return {
            exe = 'prettier',
            args = { '--stdin-filepath', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote' },
            stdin = true
          }
        end
      },
      lua = {
        function()
          return {
            exe = 'stylua',
            args = { '-' },
            stdin = true
          }
        end
      },
    }
  },
}
