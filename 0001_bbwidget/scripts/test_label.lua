require "base"

local func_next_CLabel_test_scene = nil
local func_back_CLabel_test_scene = nil
local func_ref_CLabel_test_scene = nil

-- createCLabelBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCLabelBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CLabel_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CLabel_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CLabel_test_scene()
	end)
	
	baseScene.setTitle("BBLabelBasicTest")
	baseScene.setDescription("BBLabel extern CCLabelTTF (long click and click)")
	
	local label1 = BBLabel:create("Hello CCTK And cocoswidget", "", 30.0)
	label1:setPosition(ccp(480, 450))
	baseScene.window:addChild(label1)
	
	local label3 = BBLabel:create("none", "", 30.0)
	label3:setPosition(ccp(750, 380))
	baseScene.window:addChild(label3)

	local label2 = BBLabel:create("Click me test event", "", 30.0)
	label2:setTouchEnabled(true)
	label2:setOnLongClickScriptHandler(function(sender, p_touch)
		label3:setString("LongClicked")
		return false;
	end)
	label2:setOnClickScriptHandler(function(sender)
		label3:setString("Clicked")
	end)
	label2:setOnTouchBeganScriptHandler(function(sender, p_touch)
		label2:stopActionByTag(1)
		local pScaleTo = CCScaleTo:create(0.1, 1.3)
		pScaleTo:setTag(1)
		label2:runAction(pScaleTo)
		return eWidgetTouchTransient;
	end)
	
	local function on_touch_end(sender, p_touch, duration)
		label2:stopActionByTag(1)
		local pScaleTo = CCScaleTo:create(0.1, 1.0)
		pScaleTo:setTag(1)
		label2:runAction(pScaleTo)
		return true;
	end
	
	label2:setOnTouchEndedScriptHandler(on_touch_end)
	label2:setOnTouchCancelledScriptHandler(on_touch_end)
	label2:setColor(ccc3(0, 255, 0))
	label2:setPosition(ccp(480, 380))
	baseScene.window:addChild(label2)
	
	return baseScene.scene;
end


-- createCLabelAtlasTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCLabelAtlasTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CLabel_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CLabel_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CLabel_test_scene()
	end)
	
	baseScene.setTitle("BBLabelBasicTest")
	baseScene.setDescription("BBLabelAtlas extern CCLabelAtlas (test event)")
	
	local label = BBLabelAtlas:create(";12456", "num.png", 26, 34, 49)
	label:setTouchEnabled(true)
	label:setAnchorPoint(ccp(0.5, 0.5))
	label:setPosition(ccp(480, 320))
	label:setOnTouchBeganScriptHandler(function(p,t)
		label:stopActionByTag(1)
		local pScaleTo = CCScaleTo:create(0.1, 1.3)
		pScaleTo:setTag(1)
		label:runAction(pScaleTo)
		return eWidgetTouchTransient;
	end)
	
	local function on_touch_end(p,t,f)
		label:stopActionByTag(1)
		local pScaleTo = CCScaleTo:create(0.1, 1.0)
		pScaleTo:setTag(1)
		label:runAction(pScaleTo)
		return true;
	end
	
	label:setOnTouchEndedScriptHandler(on_touch_end)
	label:setOnTouchCancelledScriptHandler(on_touch_end)
	baseScene.window:addChild(label)

	return baseScene.scene;
end


-- createCLabelBMFontTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCLabelBMFontTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CLabel_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CLabel_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CLabel_test_scene()
	end)
	
	baseScene.setTitle("BBLabelBMFontTest")
	baseScene.setDescription("BBLabelBMFont extern CCLabelBMFont")
	
	local label = BBLabelBMFont:create("hello cocos2d-x and cocoswidget", "arial-unicode-26.fnt")
	label:setPosition(ccp(480, 320))
	baseScene.window:addChild(label)

	return baseScene.scene;
end




local _n_CLabel_test_idx = 0;

local function get_CLabel_test_scene()
	if _n_CLabel_test_idx == 0 then
		return createCLabelBasicTest()
	elseif _n_CLabel_test_idx == 1 then
		return createCLabelAtlasTest()
	elseif _n_CLabel_test_idx == 2 then
		return createCLabelBMFontTest()
	else
		_n_CLabel_test_idx = 0;
		return createCLabelBasicTest()
	end
	return nil
end

function push_CLabel_test_scene()
	_n_CLabel_test_idx = 0;
	local scene = get_CLabel_test_scene()
	_p_director:pushScene(scene)
end

func_next_CLabel_test_scene = function()
	_n_CLabel_test_idx = _n_CLabel_test_idx + 1;
	local scene = get_CLabel_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CLabel_test_scene = function()
	_n_CLabel_test_idx = _n_CLabel_test_idx - 1;
	local scene = get_CLabel_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CLabel_test_scene = function()
	local scene = get_CLabel_test_scene()
	_p_director:replaceScene(scene)
end




























