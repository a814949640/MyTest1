require "base"

local func_next_CTextRich_test_scene = nil
local func_back_CTextRich_test_scene = nil
local func_ref_CTextRich_test_scene = nil

-- createCTextRichBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCTextRichBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CTextRich_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CTextRich_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CTextRich_test_scene()
	end)
	
	baseScene.setTitle("BBTextRichBasicTest")
	baseScene.setDescription("a basic text rich widget with a single line")
	
	local labelRich = BBTextRich:create()
	labelRich:insertElement("TEXT", "", 20)
	labelRich:insertElement("Rich", "", 45)
	labelRich:insertElement("And", "", 25, ccc3(255, 0, 0))
	labelRich:insertElement("cocos2d-x", "", 70, ccc3(0, 0, 255))
	labelRich:setPosition(ccp(960/2, 640/2))
	labelRich:reloadData()

	local pColor = BBColorView:create(ccc4(255, 0, 0, 50))
	pColor:setContentSize(labelRich:getContentSize())
	pColor:setPosition(ccp(960/2, 640/2))

	baseScene.window:addChild(pColor)
	baseScene.window:addChild(labelRich)

	
	return baseScene.scene;
end

-- createCTextRichEventTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCTextRichEventTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CTextRich_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CTextRich_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CTextRich_test_scene()
	end)
	
	baseScene.setTitle("BBTextRichEventTest")
	baseScene.setDescription("mutil line and event test")
	
	local m_pLabel = nil
	
	local function onClickTextRich(sender, description)
		if description ~= nil then
			m_pLabel:setString(description)
		else 
			m_pLabel:setString("click")
		end
	end
	
	local labelRich = BBTextRich:create()
	labelRich:setMaxLineLength(20)
	labelRich:setVerticalSpacing(15.0)
	labelRich:insertElement("[System]:", "", 30)
	labelRich:insertElement("cocos2d-x ", "", 30, ccc3(255, 0, 0))
	labelRich:insertElement("is a good engine for mobile phone and ")
	labelRich:insertElement("cocoswidget ", "", 30, ccc3(255, 0, 0))
	labelRich:insertElement("is helpful for it ", "", 30, ccc3(255, 0, 0))
	labelRich:insertElement("[ click me ] ", "", 30, ccc3(255,0,255), "Label")
	labelRich:insertElement("my name is ", "", 30)
	labelRich:insertElement("Jason lee - Lijunlin", "", 30, ccc3(255,255,0), "Jason lee - Lijunlin")

	local pIcon = CCSprite:create("icon.png")
	pIcon:runAction(CCRepeatForever:create(CCBlink:create(1.0, 5)))

	labelRich:insertElement(pIcon, 4, "Image")
	labelRich:insertElement("hehe ByeBye","", 30)
	labelRich:setPosition(ccp(960/2, 640/2))
	labelRich:reloadData()
	labelRich:setOnTextRichClickScriptHandler(onClickTextRich)
	baseScene.window:addChild(labelRich)

	m_pLabel = BBLabel:create("None", "", 30)
	m_pLabel:setPosition(ccp(800, 320))
	baseScene.window:addChild(m_pLabel)
	
	return baseScene.scene;
end






local _n_CTextRich_test_idx = 0;

local function get_CTextRich_test_scene()
	if _n_CTextRich_test_idx == 0 then
		return createCTextRichBasicTest()
	elseif _n_CTextRich_test_idx == 1 then
		return createCTextRichEventTest()
	else
		_n_CTextRich_test_idx = 0;
		return createCTextRichBasicTest()
	end
	return nil
end

function push_CTextRich_test_scene()
	_n_CTextRich_test_idx = 0;
	local scene = get_CTextRich_test_scene()
	_p_director:pushScene(scene)
end

func_next_CTextRich_test_scene = function()
	_n_CTextRich_test_idx = _n_CTextRich_test_idx + 1;
	local scene = get_CTextRich_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CTextRich_test_scene = function()
	_n_CTextRich_test_idx = _n_CTextRich_test_idx - 1;
	local scene = get_CTextRich_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CTextRich_test_scene = function()
	local scene = get_CTextRich_test_scene()
	_p_director:replaceScene(scene)
end




























