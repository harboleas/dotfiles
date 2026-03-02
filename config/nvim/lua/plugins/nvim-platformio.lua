-- 1. Configuración Global (Base + Menús)
vim.g.pioConfig = {
  lsp = 'clangd',
  clangd_source = 'ccls',
  menu_key = '<leader>p', 
  menu_name = 'PlatformIO',
  debug = false,
  -- Aquí definimos todos los submenús para que estén disponibles siempre
  menu_bindings = {
    { node = 'item', desc = '[L]ist terminals',    shortcut = 'l', command = 'PioTermList' },
    { node = 'item', desc = '[T]erminal Core CLI', shortcut = 't', command = 'Piocmdf' },
    {
      node = 'menu',
      desc = '[G]eneral',
      shortcut = 'g',
      items = {
        { node = 'item', desc = '[B]uild',       shortcut = 'b', command = 'Piocmdf run' },
        { node = 'item', desc = '[U]pload',      shortcut = 'u', command = 'Piocmdf run -t upload' },
        { node = 'item', desc = '[M]onitor',     shortcut = 'm', command = 'Piocmdh run -t monitor' },
        { node = 'item', desc = '[C]lean',       shortcut = 'c', command = 'Piocmdf run -t clean' },
        { node = 'item', desc = '[F]ull clean',  shortcut = 'f', command = 'Piocmdf run -t fullclean' },
        { node = 'item', desc = '[D]evice list', shortcut = 'd', command = 'Piocmdf device list' },
      },
    },
    {
      node = 'menu',
      desc = '[P]latform',
      shortcut = 'p',
      items = {
        { node = 'item', desc = '[B]uild file system',  shortcut = 'b', command = 'Piocmdf run -t buildfs' },
        { node = 'item', desc = 'Program [S]ize',       shortcut = 's', command = 'Piocmdf run -t size' },
        { node = 'item', desc = '[U]pload file system', shortcut = 'u', command = 'Piocmdf run -t uploadfs' },
        { node = 'item', desc = '[E]rase Flash',        shortcut = 'e', command = 'Piocmdf run -t erase' },
      },
    },
    {
      node = 'menu',
      desc = '[D]ependencies',
      shortcut = 'd',
      items = {
        { node = 'item', desc = '[L]ist packages',     shortcut = 'l', command = 'Piocmdf pkg list' },
        { node = 'item', desc = '[O]utdated packages', shortcut = 'o', command = 'Piocmdf pkg outdated' },
        { node = 'item', desc = '[U]pdate packages',   shortcut = 'u', command = 'Piocmdf pkg update' },
      },
    },
  },
}

return {
  'anurag3301/nvim-platformio.lua',
  
  -- optional: cond used to enable/disable platformio
  -- based on existance of platformio.ini file and .pio folder in cwd.
  -- You can enable platformio plugin, using :Pioinit command
  cond = function()
    -- local platformioRootDir = vim.fs.root(vim.fn.getcwd(), { 'platformio.ini' }) -- cwd and parents
    local platformioRootDir = (vim.fn.filereadable('platformio.ini') == 1) and vim.fn.getcwd() or nil
    if platformioRootDir then
      -- if platformio.ini file exist in cwd, enable plugin to install plugin (if not istalled) and load it.
      vim.g.platformioRootDir = platformioRootDir
    elseif (vim.uv or vim.loop).fs_stat(vim.fn.stdpath('data') .. '/lazy/nvim-platformio.lua') == nil then
      -- if nvim-platformio not installed, enable plugin to install it first time
      vim.g.platformioRootDir = vim.fn.getcwd()
    else                                                     -- if nvim-platformio.lua installed but disabled, create Pioinit command
      vim.api.nvim_create_user_command('Pioinit', function() --available only if no platformio.ini and .pio in cwd
        vim.api.nvim_create_autocmd('User', {
          pattern = { 'LazyRestore', 'LazyLoad' },
          once = true,
          callback = function(args)
            if args.match == 'LazyRestore' then
              require('lazy').load({ plugins = { 'nvim-platformio.lua' } })
            elseif args.match == 'LazyLoad' then
              local pio_install_status = require('platformio.utils').pio_install_check()
              if not pio_install_status then return end
              vim.notify('PlatformIO loaded', vim.log.levels.INFO, { title = 'PlatformIO' })
              require("platformio").setup(vim.g.pioConfig)
              vim.cmd('Pioinit')
            end
          end,
        })
        vim.g.platformioRootDir = vim.fn.getcwd()
        require('lazy').restore({ plguins = { 'nvim-platformio.lua' }, show = false })
      end, {})
    end
    return vim.g.platformioRootDir ~= nil
  end,

  dependencies = {
    'akinsho/toggleterm.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim',
    'nvim-treesitter/nvim-treesitter',
  },

  config = function()
    local pok, platformio = pcall(require, 'platformio')
    if pok then
      platformio.setup(vim.g.pioConfig)
    end
  end,
}

