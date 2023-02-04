-- basic
require("core.basic")
require("core.highlight")
require("core.keys")
require("core.run")

-- plugins
local state, result = pcall(require, "extends.bootstrap")
if not state then
  print(result)
end

require("extends.manage")
