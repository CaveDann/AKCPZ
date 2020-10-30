AKCUpdate = {}

function AKCUpdate.updateText()
    local zText = "Zombies Killed (Total): "..tostring(0).." <LINE> Zombies Killed (Weapons): "..tostring(1).." <LINE> Zombies Killed (Other): "..tostring(2);
    AKCTab.HomeWindow.text = zText;
    AKCTab.HomeWindow:paginate();
end

Events.OnPlayerUpdate.Add(AKCUpdate.updateText);