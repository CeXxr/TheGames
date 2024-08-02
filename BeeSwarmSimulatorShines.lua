for _, v in pairs(workspace.Collectibles:GetDescendants()) do
    if v.Name == "BackDecal" and v.Texture == "rbxassetid://18743050736" and v.Transparency == 0 then
        v.Parent.Name = "Shine"
        task.wait()
    end
end

local function TweenTo(cf, dur)
    local direction = (cf.p - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).unit
    local targetCFrame = CFrame.new(cf.p)
    local distance = (targetCFrame.p - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.p).Magnitude
    local tweenInfo = TweenInfo.new(dur, Enum.EasingStyle.Linear)
    local tween = TweenService:Create(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), tweenInfo, {
        CFrame = targetCFrame
    })
    tween:Play()
    tween.Completed:wait()
    return tween
end

for _, v in pairs(workspace.Collectibles:GetChildren()) do
    if v.Name == "Shine" then
        TweenTo(v.CFrame, 3)
        task.wait(1)
    end
end
