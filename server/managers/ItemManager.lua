local class = require('common/utils/class')

local ItemManager = class()

function ItemManager:create(id_name, amount)
    local name, weight, description = vRP.getItemDefinition(id_name)
    return {
        idName = id_name,
        name = name,
        weight = weight,
        description = description,
        amount = amount
    }
end

return ItemManager
