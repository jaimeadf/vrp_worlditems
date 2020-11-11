local class = require('common/utils/class')

local ItemManager = class()

function ItemManager:create(id_name, amount)
    return {
        idName = id_name,
        name = vRP.getItemName(id_name),
        weight = vRP.getItemWeight(id_name),
        description = vRP.getItemDescription(id_name),
        amount = amount
    }
end

return ItemManager
