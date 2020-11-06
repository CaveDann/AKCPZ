AKCStart = {}

stk = 0;
sgk = 0;
sok = 0;
file = "AKCDataFile.txt";
mod = "AKCPZ";

function AKCStart.drawText()
    if AKCStart.testData() then
        klist = AKCStart.readData();
        --[[if next(klist) == nil then
            stk = 0;
            sgk = 0;
            sok = 0;
        else]]--
            stk = klist[1];
            sgk = klist[2];
            sok = klist[3];
        --end
        --[[if stk == nil or stk == '' then
            stk = 0;
        end
        if not stk then
            stk = 0;
        end
        if sgk == nil or sgk == '' then
            sgk = 0;
        end
        if sok == nil or sok == '' then
            sok = 0;
        end]]--
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

function AKCStart.testData()
    local f = getModFileReader(mod, file, false);
    if f then f:close() end
    return f ~= nil;
end

function AKCStart.readData()
    lines = {}
    if not AKCStart.testData() then
        for i = 1,3 do
            line = 0;
            lines[#lines + 1] = line;
        end
        return lines
    else
        local f = getModFileReader(mod, file, false)
        for i = 1,3 do
            line = f:readLine();
            lines[#lines + 1] = line;
        end
        f:close();
        return lines
    end
end