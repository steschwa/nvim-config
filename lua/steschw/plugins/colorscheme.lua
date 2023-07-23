return {
    {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        borders = true,
        --diff = { mode = "bg" },
        --errors = { mode = "bg" },
    },
    config = function()
      vim.cmd("colorscheme nord")
    end,
  }
}
