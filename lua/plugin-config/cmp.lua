-- cmp.lua

local lspkind = require('lspkind')
local cmp = require 'cmp'

cmp.setup {
  -- snippet engine
  snippet = {
    expand = function(args)
      -- for `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  -- sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'vsnip' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'omni' },
    { name = 'path' },
    { name = 'treesitter' },
  }),
  -- window
  window = {
    completion = {
      border = 'shadow'
    },
    documentation = {
      border = 'shadow'
    },
    -- completion = cmp.config.window.bordered {
    --   winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None"
    -- },
    -- documentation = cmp.config.window.bordered {
    --   winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None"
    -- },
  },
  mapping = require 'user.keymaps'.cmp(cmp),
  -- format with lspkind
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function(entry, vim_item)
        -- show source
        vim_item.menu = '[' .. string.upper(entry.source.name) .. ']'
        return vim_item
      end
    })
  },
}

-- use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources(
    {
      { name = 'path' },
      { name = 'buffer' },
      { name = 'cmdline' }
    })
}
)
