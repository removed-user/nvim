## Loader function for the validator 
### to be used for global export

```
-- lua/utils/vrequire.lua
local function setup(opts)
  opts = opts or {}
  local name = opts.name or "vrequire"
  local validator_mod = opts.validator or "your_validator"

  _G[name] = function(modname)
    local mod = require(modname)
    require(validator_mod)(modname, mod)
    return mod
  end
end
return { setup = setup }
```


### V2 Don't override pre-existing globals (unless forced)
```
-- lua/utils/vrequire.lua
local function setup(opts)
  opts = opts or {}
  local name = opts.name or "vrequire"
  local validator_mod = opts.validator or "your_validator"

  if _G[name] ~= nil and not opts.force then
    vim.notify(
      string.format("[vrequire] Global '_G.%s' already exists; skipping registration.", name),
      vim.log.levels.WARN
    )
    return
  end

  _G[name] = function(modname)
    local mod = require(modname)
    require(validator_mod)(modname, mod)
    return mod
  end
end

return { setup = setup }
```

### HOW USE???

```
-- Default name (_G.vrequire)
require("utils.vrequire").setup()

-- Or a custom global name (_G.safe_require)
require("utils.vrequire").setup({
  name = "safe_require",
  validator = "config.validator",
})
```
