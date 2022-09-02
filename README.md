# lspdiags.nvim
A simple plugin that uses a quickfix list to show project diagnostics

## Dependencies
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

## Installation

Install with your preferred package manager
<details>
	<summary><a href="https://github.com/wbthomason/packer.nvim">packer.nvim</a></summary>

```lua
use({
  "rubyowo/lspdiags.nvim",
})
```

</details>

<details>
	<summary><a href="https://github.com/junegunn/vim-plug">vim-plug</a></summary>

```vim
Plug 'rubyowo/lspdiags.nvim'
```

</details>

## Configuration
The default settings for the plugin:
```lua
require('lspdiags').setup({
    debounce = 150, -- only update the list at most every `debounce` ms
    triggers = { -- The autocommands to register
        'WinEnter',
        'BufEnter',
        'DiagnosticChanged',
    },
    auto_open = false, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
})
```
