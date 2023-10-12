local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("config.options")

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.extras.dap" },
    { import = "plugins.extras.test" },
    { import = "plugins.extras.format.prettier" },
    { import = "plugins.extras.linting.eslint" },
    { import = "plugins.extras.linting.stylelint" },
    { import = "plugins.extras.coding.copilot" },
    -- lang support
    { import = "plugins.extras.lang.typescript" },
    { import = "plugins.extras.lang.rust" },
    { import = "plugins.extras.lang.svelte" },
    { import = "plugins.extras.lang.json" },
    { import = "plugins.extras.lang.vue" },
    { import = "plugins.extras.lang.ocaml" },
    { import = "plugins.extras.lang.bash" },
    { import = "plugins.extras.lang.elixir" },
  },
  change_detection = { notify = false },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("config.autocmds")
require("config.keymaps")
