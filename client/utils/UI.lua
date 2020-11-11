local UI = {}

function UI.drawText(text, position, color, font, scale)
    SetTextScale(0, scale or 0.35)
    SetTextFont(font or 4)
    SetTextProportional(true)
    SetTextColour(color.r, color.g, color.b, color.a)
    SetTextEntry('STRING')
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(position.x, position.y)
end

function UI.drawText3d(text, position, color, font, scale)
    local on_screen, x, y = World3dToScreen2d(position.x, position.y, position.z)
    if on_screen then
        UI.drawText(text, vector2(x, y), color, font, scale)
    end
end

return UI
