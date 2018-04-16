require "base"

local func_next_DrawOrderTest_test_scene = nil
local func_back_DrawOrderTest_test_scene = nil
local func_ref_DrawOrderTest_test_scene = nil

-- createDrawOrderTestBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createDrawOrderTestBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_DrawOrderTest_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_DrawOrderTest_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_DrawOrderTest_test_scene()
	end)
	
	baseScene.setTitle("DrawOrderTestBasicTest")
	baseScene.setDescription("swap zorder for see event dispatch")
	
	local pButton1 = nil
	local pButton2 = nil
	
	local function onClick(sender)
		local z1 = pButton1:getZOrder()
		local z2 = pButton2:getZOrder()
		baseScene.window:reorderChild(pButton1, z2)
		baseScene.window:reorderChild(pButton2, z1)
	end

	local pSwapBtn = BBButton:create()
	pSwapBtn:setPosition(ccp(170, 320))
	pSwapBtn:setScale9Enabled(true)
	pSwapBtn:setNormalImage("sprite9_btn1.png")
	pSwapBtn:setSelectedImage("sprite9_btn2.png")
	pSwapBtn:initText("swap z order", "", 30)
	pSwapBtn:setCascadeTextSizeEnabled(true, CCSize(50, 30))
	pSwapBtn:setOnClickScriptHandler(onClick)
	baseScene.window:addChild(pSwapBtn)

	pButton1 = BBButton:create("btn1_1.png", "btn1_2.png")
	pButton1:setPosition(ccp(480, 320))
	baseScene.window:addChild(pButton1, 1)

	pButton2 = BBButton:create("btn1_1.png", "btn1_2.png")
	pButton2:setPosition(ccp(520, 350))
	baseScene.window:addChild(pButton2, 2)
	
	return baseScene.scene;
end




local _n_DrawOrderTest_test_idx = 0;

local function get_DrawOrderTest_test_scene()
	if _n_DrawOrderTest_test_idx == 0 then
		return createDrawOrderTestBasicTest()
	else
		_n_DrawOrderTest_test_idx = 0;
		return createDrawOrderTestBasicTest()
	end
	return nil
end

function push_DrawOrderTest_test_scene()
	_n_DrawOrderTest_test_idx = 0;
	local scene = get_DrawOrderTest_test_scene()
	_p_director:pushScene(scene)
end

func_next_DrawOrderTest_test_scene = function()
	_n_DrawOrderTest_test_idx = _n_DrawOrderTest_test_idx + 1;
	local scene = get_DrawOrderTest_test_scene()
	_p_director:replaceScene(scene)
end

func_back_DrawOrderTest_test_scene = function()
	_n_DrawOrderTest_test_idx = _n_DrawOrderTest_test_idx - 1;
	local scene = get_DrawOrderTest_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_DrawOrderTest_test_scene = function()
	local scene = get_DrawOrderTest_test_scene()
	_p_director:replaceScene(scene)
end




























