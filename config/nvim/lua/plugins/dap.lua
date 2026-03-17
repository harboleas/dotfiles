return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")

    -- 1. Configurar el adaptador para usar el modo DAP nativo de GDB (GDB 14.1+)
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--quiet", "--interpreter=dap" }, -- El flag crucial para DAP
    }

    -- 2. Configurar la sesión específica para archivos .asm
    dap.configurations.asm = {
      {
        name = "Launch ASM with GDB",
        type = "gdb",
        request = "launch",
        program = function()
          -- Solicita la ruta del ejecutable (compilado previamente)
          return vim.fn.input("Ruta al ejecutable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
    }
  end,
}


