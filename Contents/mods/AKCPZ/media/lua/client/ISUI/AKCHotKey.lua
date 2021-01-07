require "ISUI/ISLayoutManager"

AKCHotKey = {}

AKCHotKey.setKeybinds = function()
	bind = {};
	bind.value = "[AKCPZ]";
	table.insert(keyBinding, bind);
	bind = {};
	bind.value = "AKCPZToggle";
	bind.key = Keyboard.KEY_RCONTROL;
	table.insert(keyBinding, bind);
end

-- Don't check for press until game start so that main menu operation isn't affected
AKCHotKey.startCheckPress = function()
	Events.OnKeyPressed.Add(AKCHotKey.checkPress);
end

AKCHotKey.checkPress = function(AKCKeyPress)
	if AKCKeyPress == getCore():getKey("AKCPZToggle") then
		if AKCTab.resizable == true then
			AKCTab:setVisible(false);
			AKCTab.resizable = false;
		else
			AKCTab:setVisible(true);
			AKCTab.resizable = true;
		end;
	end;
end

Events.OnGameStart.Add(AKCHotKey.startCheckPress);
Events.OnGameBoot.Add(AKCHotKey.setKeybinds);
