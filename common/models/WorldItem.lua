local Item = require('common/models/Item')
local class = require('common/utils/class')
local uuid = require('common/utils/uuid')

local WorldItem = class(Item, function (self, item, prop)
    Item.init(self, item.idName, item.name, item.description, item.weight, item.amount)
    self.id = uuid()
    self.prop = prop
end)

return WorldItem
