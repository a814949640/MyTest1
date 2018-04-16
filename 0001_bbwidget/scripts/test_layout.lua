require "base"

local func_next_CLayout_test_scene = nil
local func_back_CLayout_test_scene = nil
local func_ref_CLayout_test_scene = nil

-- createCLayoutBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCLayoutBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CLayout_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CLayout_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CLayout_test_scene()
	end)
	
	baseScene.setTitle("BBLayoutBasicTest")
	baseScene.setDescription("some things in panel")

	local pLayout = BBLayout:create()
	pLayout:setPosition(ccp(480 ,320))
	pLayout:setContentSize(CCSize(480, 320))
	pLayout:setBackgroundImage("background.png")
	baseScene.window:addChild(pLayout)

	local pButton = BBButton:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pButton:setPosition(ccp(150, 100))
	pLayout:addChild(pButton)

	local pImage = BBImageView:create("icon.png")
	pImage:setPosition(ccp(200, 150))
	pLayout:addChild(pImage)
	
	return baseScene.scene;
end


-- createCLayoutColorTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCLayoutColorTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CLayout_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CLayout_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CLayout_test_scene()
	end)
	
	baseScene.setTitle("BBLayoutColorTest")
	baseScene.setDescription("color panel")
	
	local pLayout = BBLayout:create()
	pLayout:setBackgroundColor(ccc4(255, 0, 0, 255))
	pLayout:setPosition(ccp(480 ,320))
	pLayout:setContentSize(CCSize(480, 320))
	baseScene.window:addChild(pLayout)


	return baseScene.scene;
end


-- createCLayoutGradientTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCLayoutGradientTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CLayout_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CLayout_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CLayout_test_scene()
	end)
	
	baseScene.setTitle("BBLayoutGradientTest")
	baseScene.setDescription("Gradient back ground")
	
	local pLayout = BBLayout:create()
	pLayout:setBackgroundGradient(ccc4(255,0,0,255), ccc4(0,255,0,128), CCPoint(1.0, 0.0))
	pLayout:setPosition(ccp(480 ,320))
	pLayout:setContentSize(CCSize(480, 320))
	baseScene.window:addChild(pLayout)


	return baseScene.scene;
end






local _n_CLayout_test_idx = 0;

local function get_CLayout_test_scene()
	if _n_CLayout_test_idx == 0 then
		return createCLayoutBasicTest()
	elseif _n_CLayout_test_idx == 1 then
		return createCLayoutColorTest()
	elseif _n_CLayout_test_idx == 2 then
		return createCLayoutGradientTest()
	else
		_n_CLayout_test_idx = 0;
		return createCLayoutBasicTest()
	end
	return nil
end

function push_CLayout_test_scene()
	_n_CLayout_test_idx = 0;
	local scene = get_CLayout_test_scene()
	_p_director:pushScene(scene)
end

func_next_CLayout_test_scene = function()
	_n_CLayout_test_idx = _n_CLayout_test_idx + 1;
	local scene = get_CLayout_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CLayout_test_scene = function()
	_n_CLayout_test_idx = _n_CLayout_test_idx - 1;
	local scene = get_CLayout_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CLayout_test_scene = function()
	local scene = get_CLayout_test_scene()
	_p_director:replaceScene(scene)
end




























