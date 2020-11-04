AKCStart = {}

stk = 0;
sgk = 0;
sok = 0;
file = "AKCDataFile.txt";
mod = "AKCPZ";

function AKCStart.drawText()
    if AKCFile.testData() then
        klist = AKCFile.readData();
        stk = klist[1];
        sgk = klist[2];
        sok = klist[3];
        ok = sok;
    else
        stk = getPlayer():getZombieKills();
        sgk = getPlayer():getZombieKills();
        ok = 0;
    end
    tk = stk;
    gk = sgk;
    ngk = sgk;
    ogk = sgk;
    local pText = "Zombies Killed (Total): "..tostring(stk).." <LINE> Zombies Killed (Weapons): "..tostring(sgk).." <LINE> Zombies Killed (Other): "..tostring(sok);
    AKCTab.HomeWindow.text = pText;
    AKCTab.HomeWindow:paginate();
end

function AKCFile.testData()
    local f = getModFileReader(mod, file, false);
    if f then f:close() end;
    return f ~= nil;
end

function AKCFile.readData()
    if not AKCFile.testData() then return {} end
    lines = {}
    local f = getModFileReader(mod, file, true)
    for i = 1,3 do
        line = f:readLine();
        lines[#lines + 1] = line;
    end
    return lines
end