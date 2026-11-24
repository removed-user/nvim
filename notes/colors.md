# Color Modes Support
8-bit:  256-color 
24-bit: truecolor

## Terminal Emulator Standards
`https://github.com/termstandard/colors/blob/master/README.md`


termguicolors

"Awesome Neovim Colors": 
`https://www.trackawesomelist.com/rockerBOO/awesome-neovim/readme/`
"Awesome Vim Colors": 
`https://github.com/rafi/awesome-vim-colorschemes`
"neovim-colorscheme":`https://github.com/topics/neovim-colorscheme`
"vim-colorscheme": 
`https://github.com/topics/vim-colorscheme`





### Minimal example
> Auto set termguicolors
```lua
local function supports_truecolor()
  local term = vim.env.TERM or ""
  local colorterm = vim.env.COLORTERM or ""

  if term == "linux" or term == "fbterm" then
    return false
  end

  return colorterm == "truecolor" or colorterm == "24bit" or term == "kmscon"
end

vim.opt.termguicolors = supports_truecolor()

```
