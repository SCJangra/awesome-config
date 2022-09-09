local opts = require 'opts'

local concat_groups = function(...)
  return table.concat({ ... }, opts.group_separator)
end

return {
  concat_groups = concat_groups,
}
