_p_director = CCDirector:sharedDirector()

function createScene()
	local tab_scene = {};
	tab_scene.scene = nil
	tab_scene.window = nil
	tab_scene.btnNext = nil
	tab_scene.btnBack = nil
	tab_scene.btnRef = nil
	tab_scene.p_title_text = nil
	tab_scene.p_description_text = nil
	
	tab_scene.setTitle = function(str)
		if tab_scene.p_title_text ~= nil then
			tab_scene.p_title_text:setString(str)
		end
	end
	
	tab_scene.setDescription = function(str)
		if tab_scene.p_description_text ~= nil then
			tab_scene.p_description_text:setString(str)
		end
	end

	local scene = CCScene:create()
	tab_scene.scene = scene;
	
	local window = BBWidgetWindow:create()
	window:setTag(1)
	window:setMultiTouchEnabled(true)
	scene:addChild(window)
	tab_scene.window = window;

	--next btn
	local btnNext = BBButton:create("next1.png", "next2.png")
	btnNext:setPosition(ccp(630, 55))
	window:addChild(btnNext)
	tab_scene.btnNext = btnNext;
	
	--back btn
	local btnBack = BBButton:create("back1.png", "back2.png")
	btnBack:setPosition(ccp(330, 55))
	window:addChild(btnBack)
	tab_scene.btnBack = btnBack;
	
	--ref btn
	local btnRef = BBButton:create("again1.png", "again2.png")
	btnRef:setPosition(ccp(480, 55))
	window:addChild(btnRef)
	tab_scene.btnRef = btnRef;

	--title
	local p_title_text = BBLabel:create()
	p_title_text:setFontSize(45)
	p_title_text:setPosition(ccp(480, 600))
	p_title_text:setTag(1)
	window:addChild(p_title_text)
	tab_scene.p_title_text = p_title_text;
	
	-- description
	local p_description_text = BBLabel:create()
	p_description_text:setHorizontalAlignment(kCCTextAlignmentCenter)
	p_description_text:setAnchorPoint(ccp(0.5, 1.0))
	p_description_text:setFontSize(30)
	p_description_text:setPosition(ccp(480, 570))
	p_description_text:setTag(2)
	window:addChild(p_description_text)
	tab_scene.p_description_text = p_description_text;
	
	local function on_click_exit(sender)
		_p_director:popScene()
	end
	
	local function on_menu_text_touchbegan(sender, p_touch)
		
		sender:stopActionByTag(1)
		local p_scale_to = CCScaleTo:create(0.1, 1.3)
		p_scale_to:setTag(1)
		sender:runAction(p_scale_to)
		
		return eWidgetTouchTransient;
	end
	
	local function on_menu_text_touchended(sender, p_touch, duration)
	
		sender:stopActionByTag(1)
		local p_scale_to = CCScaleTo:create(0.1, 1.0)
		p_scale_to:setTag(1)
		sender:runAction(p_scale_to)
		
		return true;
	end
	
	-- exit
	local p_menu_text = BBLabel:create("Back", "", 45)
	p_menu_text:setTouchEnabled(true)
	p_menu_text:setOnTouchCancelledScriptHandler(on_menu_text_touchended)
	p_menu_text:setOnTouchEndedScriptHandler(on_menu_text_touchended)
	p_menu_text:setOnTouchBeganScriptHandler(on_menu_text_touchbegan)
	p_menu_text:setOnClickScriptHandler(on_click_exit)
	p_menu_text:setPosition(ccp(893, 35))
	window:addChild(p_menu_text)
	tab_scene.p_menu_text = p_menu_text;
	
	return tab_scene;
end