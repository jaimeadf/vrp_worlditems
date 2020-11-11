local WorldItemMapper = {}

function WorldItemMapper.toDto(world_item)
    return {
        id = world_item.id,
        label = ('~b~[E]~s~ %s ~y~%d'):format(world_item.name, world_item.amount),
        position = world_item.prop.position
    }

end

return WorldItemMapper
