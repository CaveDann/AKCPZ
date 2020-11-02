AKCStart = {}

stk = 0;
sgk = 0;
sok = 0;

function AKCStart.drawText()
    stk = getPlayer():getZombieKills();
    sgk = getPlayer():getZombieKills();
    local pText = "Zombies Killed (Total): "..tostring(stk).." <LINE> Zombies Killed (Weapons): "..tostring(sgk).." <LINE> Zombies Killed (Other): "..tostring(sok);
    AKCTab.HomeWindow.text = pText;
    AKCTab.HomeWindow:paginate();
end
