AKCUpdate = {}

--[[tk = 0;
ogk = 0;
gk = 0;
ngk = 0;
ok = 0;]]--
file = "AKCDataFile.txt"
mod = "AKCPZ"

function AKCUpdate.updateText()
    ngk = 1 + getPlayer():getZombieKills();
    if ogk ~= 0 then
        local diff = ngk - ogk;
        if diff > 1 then
            tk = tk + diff;
        elseif diff == 1 then
            tk = tk + 1;
        elseif diff == 0 then
            tk = tk + 1;
        end
    else
        tk = tk + 1;
    end
    --tk = tk + 1;
    gk = 1 + getPlayer():getZombieKills();
    ok = tk - gk;
    local zText = "Zombies Killed (Total): "..tostring(tk).." <LINE> Zombies Killed (Weapons): "..tostring(gk).." <LINE> Zombies Killed (Other): "..tostring(ok);
    AKCTab.HomeWindow.text = zText;
    AKCTab.HomeWindow:paginate();
    ogk = gk;
end

function AKCUpdate.writeData()
    local writeData = getModFileWriter(mod, file, true, false);
    writeData:write(tostring(tk).."\n");
    writeData:write(tostring(gk).."\n");
    writeData:write(tostring(ok).."\n");
    writeData:close();
end

--[[AKCFile.testData = function(file)
    local f = io.open(file, "rb");
    if f then f:close() end;
    return f ~= nil;
end

AKCFile.readData = function(file)
    if not AKCFile.testData(file) then return {} end
    lines = {}
    for line in io.lines(file) do
        lines[#lines + 1] = line;
    end
    return lines
end]]--

Events.OnZombieDead.Add(AKCUpdate.updateText);
Events.OnSave.Add(AKCUpdate.writeData);
