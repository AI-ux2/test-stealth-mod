function timer(duration, callback)
    local elapsedTime = 0
    Events.OnTick.Add(function()
        elapsedTime = elapsedTime + 1
        if elapsedTime >= duration then
            Events.OnTick.Remove(callback)
            callback()
        end
    end)
end

function isPlayerVisible(player, npc)
    local dx = player.position.x - npc.position.x
    local dy = player.position.y - npc.position.y
    local distance = math.sqrt(dx * dx + dy * dy)

    if distance > npc.viewRange then
        return false
    end

    local angle = math.atan2(dy, dx)
    local facingAngle = npc.facingAngle
    local viewCone = npc.viewCone -- Angle range of visibility

    return angle >= facingAngle - viewCone / 2 and angle <= facingAngle + viewCone / 2
end
