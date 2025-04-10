function createDistractionBottle(player, targetX, targetY)
    print(player.name .. " throws a bottle at (" .. targetX .. ", " .. targetY .. ").")
    throwObject(player, targetX, targetY, "GlassShatter")
end

function deploySmokeBomb(player, targetX, targetY)
    print(player.name .. " deploys a smoke bomb at (" .. targetX .. ", " .. targetY .. ").")
    createSmokeEffect(targetX, targetY, 5) -- Simulate obscuring the area for 5 seconds
end
