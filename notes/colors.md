# Color Modes Support
8-bit:  256-color 
24-bit: truecolor


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
