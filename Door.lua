local Door = script.Parent
local MarketPlaceService = game:GetService("MarketplaceService")

Door.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local Player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
		if Player then
			local UserID = Player.UserId
			local GamePassID = 679295807
			local OwnsGamepass = MarketPlaceService:UserOwnsGamePassAsync(UserID, GamePassID)
			if OwnsGamepass then
				Door.Transparency = 0.6
				Door.CanCollide = false
				wait(5)
				Door.Transparency = 0
				Door.CanCollide = true
			else
				MarketPlaceService:PromptGamePassPurchase(Player, GamePassID)
			end
		end
	end
end)
