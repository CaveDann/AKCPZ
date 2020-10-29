AKCTab = ISCollapsableWindow:derive("AKCTab");
function AKCTab:initialise()
	ISCollapsableWindow.initialise(self);
end

function DrawAKCTab()
	AKCTab = AKCTab:new(70, 0, 250, 100)
	AKCTab:addToUIManager();
	AKCTab.pin = false;
	AKCTab.resizable = true;
	AKCTab:setVisible(true);
end

function AKCTab:new(x, y, w, h)
	local stats = {};
	stats = ISCollapsableWindow:new(x, y, w, h);
	setmetatable(stats, self);
	self.__index = self;
	stats.title = "AKC";
	stats.pin = false;
	stats:noBackground();
	return stats;
end

function AKCTab:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.HomeWindow = ISRichTextPanel:new(0, 16, 250, 84);
	self.HomeWindow:initialise();
	self.HomeWindow.autosetheight = false;
	self:addChild(self.HomeWindow);
end

Events.OnGameStart.Add(DrawAKCTab);

