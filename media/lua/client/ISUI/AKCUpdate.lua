AKCUpdate = {}

function AKCUpdate.updateText()
    local zText = "Zombies Killed (Total): <LINE> Zombies Killed (Weapons): <LINE> Zombies Killed (Other): ";
    AKCTab.HomeWindow.text = zText
    AKCTab.HomeWindow:paginate()
end

Events.OnPlayerUpdate.Add(AKCUpdate.updateText);