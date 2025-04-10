function Player:crouchWalk()
    self.isCrouching = true
    self.noiseLevel = self.noiseLevel * 0.5 -- Reduce noise by half
    print(self.name .. " is crouch-walking.")
end

function Player:stopCrouching()
    self.isCrouching = false
    self.noiseLevel = self.baseNoiseLevel -- Reset noise level
    print(self.name .. " stopped crouch-walking.")
end

function Player:applyZombieCamouflage(duration)
    self.isCamouflaged = true
    self.visibilityToZombies = self.visibilityToZombies * 0.1 -- Reduce visibility
    print(self.name .. " is now camouflaged with zombie blood.")

    timer(duration, function()
        self.isCamouflaged = false
        self.visibilityToZombies = self.baseVisibilityToZombies
        print(self.name .. "'s zombie camouflage has worn off.")
    end)
end
