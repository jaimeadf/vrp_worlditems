local class = require('common/utils/class')

local BaseService = class(function (self, tunnel)
    self.tunnel = tunnel
end)

function BaseService:start()

end

return BaseService
