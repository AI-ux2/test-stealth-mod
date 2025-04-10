-- Right-Click Menu Integration for Stealth Mechanics
Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldObjects)
    local playerObj = getSpecificPlayer(player)

    -- Crouch-Walk Option
    if not playerObj.isCrouching then
        context:addOption("Crouch-Walk", nil, function()
            playerObj:crouchWalk()
        end)
    else
        context:addOption("Stop Crouch-Walking", nil, function()
            playerObj:stopCrouching()
        end)
    end

    -- Zombie Camouflage Option
    if playerObj:getInventory():contains("ZombieGuts") then
        context:addOption("Apply Zombie Camouflage", nil, function()
            playerObj:applyZombieCamouflage(600) -- Camouflage lasts 10 seconds
        end)
    end

    -- Distraction Bottle Option
    if playerObj:getInventory():contains("EmptyBottle") then
        context:addOption("Throw Distraction Bottle", nil, function()
            local mouseX, mouseY = getMouseSquare()
            createDistractionBottle(playerObj, mouseX, mouseY)
        end)
    end

    -- Smoke Bomb Option
    if playerObj:getInventory():contains("SmokeBomb") then
        context:addOption("Deploy Smoke Bomb", nil, function()
            local mouseX, mouseY = getMouseSquare()
            deploySmokeBomb(playerObj, mouseX, mouseY)
        end)
    end

    -- NPC Commands (if applicable)
    for _, obj in ipairs(worldObjects) do
        if instanceof(obj, "NPCSurvivor") then
            local npc = obj
            context:addOption("Order NPC to Enter Stealth", nil, function()
                npc:enterStealthMode()
            end)
            context:addOption("Order NPC to Investigate Noise", nil, function()
                local mouseX, mouseY = getMouseSquare()
                npc:investigate({ x = mouseX, y = mouseY })
            end)
        end
    end
end)
