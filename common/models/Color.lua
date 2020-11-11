local class = require('common/utils/class')

local Color = class(function (self, r, g, b, a)
    self.r = parseInt(r)
    self.g = parseInt(g)
    self.b = parseInt(b)
    self.a = parseInt(a)
end)

return Color
