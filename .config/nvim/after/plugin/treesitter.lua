local ok, configs = pcall(require, 'nvim-treesitter.configs')
if ok then
  configs.setup {
    ensure_installed = {"javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }
else
  -- nvim-treesitter >= 1.0 API
  require('nvim-treesitter').setup {
    ensure_installed = {"javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    auto_install = true,
  }
  pcall(vim.treesitter.start)
end
