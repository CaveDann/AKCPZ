AKCStart = {}

function AKCStart.drawText()
    local pText = "Zombies Killed (Total): "..tostring(0).." <LINE> Zombies Killed (Weapons): "..tostring(1).." <LINE> Zombies Killed (Other): "..tostring(2);
    AKCTab.HomeWindow.text = pText;
    AKCTab.HomeWindow:paginate();
end