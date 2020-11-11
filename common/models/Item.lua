local class = require('common/utils/class')

local Item = class(function (self, id_name, name, description, weight, amount)
    self.idName = id_name
    self.name = name
    self.description = description
    self.weight = weight
    self.amount = amount
end)

return Item
