local class = require('common/utils/class')

local ItemManager = class()

function ItemManager:create(id_name, amount)
    local name, weight, description = vRP.getItemDefinition(id_name)
    return {
        idName = id_name or 'unknown',
        name = name or id_name or 'unknown name',
        weight = weight or 0,
        description = description or '',
        amount = amount
    }
end

return ItemManager
