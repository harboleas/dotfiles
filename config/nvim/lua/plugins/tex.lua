return {
  "lervag/vimtex",
  lazy = false, -- Recomendado por VimTeX para evitar fallos de detección

  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_automatic = 1
  end,

  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "tex", "bib" },
      callback = function()
        vim.keymap.set("n", "<leader>cc", "<cmd>VimtexCompile<CR>", {
          buffer = true,
          desc = "Compile LaTeX Document"
        })
      end,
    })
  end,
}

