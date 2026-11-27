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

# HOW USE???


-- Default name (_G.vrequire)
require("utils.vrequire").setup()

-- Or a custom global name (_G.safe_require)
require("utils.vrequire").setup({
  name = "safe_require",
  validator = "config.validator",
})
