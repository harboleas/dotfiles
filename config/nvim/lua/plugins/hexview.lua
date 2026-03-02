return {
    "DamianVCechov/hexview.nvim",
    config = function()
        require("hexview").setup()

        -- Se ejecuta cada vez que entras en un buffer de hexview
        vim.api.nvim_create_autocmd("FileType", {
             pattern = "hexview",
             callback = function()
                 -- Pequeño delay para asegurar que el buffer esté listo
                 vim.defer_fn(function()
                    vim.cmd("HexSet 16")
             end, 100)
         end,
        })
    end
}

