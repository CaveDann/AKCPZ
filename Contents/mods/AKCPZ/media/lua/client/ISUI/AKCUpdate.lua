AKCUpdate = {}

tk = 0;
ogk = 0;
gk = 0;
ngk = 0;
ok = 0;
file = "AKCDataFile.txt"
mod = "AKCPZ"

function AKCUpdate.updateText()
    ngk = 1 + getPlayer():getZombieKills();
    if ogk ~= 0 then
        local diff = ngk - ogk;
        if diff > 1 then --vehicle catchup clause
            tk = tk + diff;
            gk = 1 + getPlayer():getZombieKills();
            ogk = gk;
        elseif diff == 1 then --standard +1
            tk = tk + 1;
            gk = 1 + getPlayer():getZombieKills();
            ogk = gk;
        elseif diff == 0 then --kills not tracked by vanilla
            tk = tk + 1;
            gk = getPlayer():getZombieKills();
            ogk = 1 + gk;
        end
    else
        tk = tk + 1;
    end
    --tk = tk + 1;
    --gk = 1 + getPlayer():getZombieKills();
    ok = tk - gk;
    local zText = "Zombies Killed (Total): "..tostring(tk).." <LINE> Zombies Killed (Weapons): "..tostring(gk).." <LINE> Zombies Killed (Other): "..tostring(ok);
    AKCTab.HomeWindow.text = zText;
    AKCTab.HomeWindow:paginate();
    --ogk = gk;
end

function AKCUpdate.writeData()
    local writeData = getModFileWriter(mod, file, true, false);
    writeData:write(tostring(tk).."\n");
    writeData:write(tostring(gk).."\n");
    writeData:write(tostring(ok).."\n");
    writeData:close();
end

function AKCUpdate.hourlyData()
    local tgk = getPlayer():getZombieKills();
    local tdiff = tgk - gk;
    local ttk = tk + tdiff;
    local tok = ttk - tgk;
    local zText = "Zombies Killed (Total): "..tostring(ttk).." <LINE> Zombies Killed (Weapons): "..tostring(tgk).." <LINE> Zombies Killed (Other): "..tostring(tok);
    AKCTab.HomeWindow.text = zText;
    AKCTab.HomeWindow:paginate();
end

Events.OnZombieDead.Add(AKCUpdate.updateText);
Events.OnSave.Add(AKCUpdate.writeData);
Events.EveryHours.Add(AKCUpdate.hourlyData);
