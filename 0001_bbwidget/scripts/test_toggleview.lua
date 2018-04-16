require "base"

local fnTestNext = nil
local fnTestBack = nil
local fnTestRef  = nil

-- createCToggleViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCToggleViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		fnTestNext()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		fnTestBack()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		fnTestRef()
	end)
	
	baseScene.setTitle("BBToggleViewBasicTest")
	baseScene.setDescription("toggle button")
	

	local label = BBLabel:create()
	label:setAnchorPoint(ccp(0, 0.5))
	label:setPosition(ccp(380, 400))
	label:setFontSize(35.0)
	label:setString("none")
	baseScene.window:addChild(label)
	
	local toggle = BBToggleView:create("toggle1_2.png", "toggle1_1.png")
	toggle:setOnClickScriptHandler(function(sender)
		if toggle:isChecked() == true then
			label:setString("checked")
		else
			label:setString("unchecked")
		end
	end)
	toggle:setPosition(ccp(480, 320))
	baseScene.window:addChild(toggle)

	
	return baseScene.scene;
end



-- createCToggleViewGroupTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCToggleViewGroupTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		fnTestNext()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		fnTestBack()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		fnTestRef()
	end)
	
	baseScene.setTitle("BBToggleViewGroupTest")
	baseScene.setDescription("Toggle button in group")
	
	local function on_click(sender, b_checked)
		local p_toggle = tolua.cast(sender, "BBToggleView")
		local p_text = p_toggle:getUserObject()
		if b_checked then
			p_text:setString("checked")
		else
			p_text:setString("unchecked")
		end
	end
	
	local toggle1 = BBToggleView:create("toggle1_2.png", "toggle1_1.png")
	toggle1:setOnCheckScriptHandler(on_click)
	toggle1:setPosition(ccp(200, 450))
	toggle1:setExclusion(1)
	baseScene.window:addChild(toggle1)

	local toggle2 = BBToggleView:create("toggle1_2.png", "toggle1_1.png")
	toggle2:setOnCheckScriptHandler(on_click)
	toggle2:setPosition(ccp(200, 350))
	toggle2:setExclusion(1)
	baseScene.window:addChild(toggle2)

	local toggle3 = BBToggleView:create("toggle1_2.png", "toggle1_1.png")
	toggle3:setOnCheckScriptHandler(on_click)
	toggle3:setPosition(ccp(200, 250))
	toggle3:setExclusion(1)
	baseScene.window:addChild(toggle3)

	local label1 = BBLabel:create()
	label1:setAnchorPoint(ccp(0, 0.5))
	label1:setPosition(ccp(350, 450))
	label1:setFontSize(35.0)
	label1:setString("none")
	baseScene.window:addChild(label1)
	toggle1:setUserObject(label1)

	local label2 = BBLabel:create()
	label2:setAnchorPoint(ccp(0, 0.5))
	label2:setPosition(ccp(350, 350))
	label2:setFontSize(35.0)
	label2:setString("none")
	baseScene.window:addChild(label2)
	toggle2:setUserObject(label2)

	local label3 = BBLabel:create()
	label3:setAnchorPoint(ccp(0, 0.5))
	label3:setPosition(ccp(350, 250))
	label3:setFontSize(35.0)
	label3:setString("none")
	baseScene.window:addChild(label3)
	toggle3:setUserObject(label3)

	local toggle4 = BBToggleView:create("toggle1_2.png", "toggle1_1.png")
	toggle4:setPosition(ccp(700, 250))
	toggle4:setExclusion(2)
	baseScene.window:addChild(toggle4)

	local toggle5 = BBToggleView:create("toggle1_2.png", "toggle1_1.png")
	toggle5:setPosition(ccp(700, 350))
	toggle5:setExclusion(2)
	baseScene.window:addChild(toggle5)
	
	return baseScene.scene;
end









local _n_CToggleView_test_idx = 0;

local function get_CToggleView_test_scene()
	if _n_CToggleView_test_idx == 0 then
		return createCToggleViewBasicTest()
	elseif _n_CToggleView_test_idx == 1 then
		return createCToggleViewGroupTest()
	else
		_n_CToggleView_test_idx = 0;
		return createCToggleViewBasicTest()
	end
	return nil
end

function push_CToggleView_test_scene()
	_n_CToggleView_test_idx = 0;
	local scene = get_CToggleView_test_scene()
	_p_director:pushScene(scene)
end

fnTestNext = function()
	_n_CToggleView_test_idx = _n_CToggleView_test_idx + 1;
	local scene = get_CToggleView_test_scene()
	_p_director:replaceScene(scene)
end

fnTestBack = function()
	_n_CToggleView_test_idx = _n_CToggleView_test_idx - 1;
	local scene = get_CToggleView_test_scene()
	_p_director:replaceScene(scene)
end

fnTestRef = function()
	local scene = get_CToggleView_test_scene()
	_p_director:replaceScene(scene)
end




























