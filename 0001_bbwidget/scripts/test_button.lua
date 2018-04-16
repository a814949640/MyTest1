require "base"

local fnTestNext = nil
local fnTestBack = nil
local fnTestRef  = nil

-- createCButtonBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCButtonBasicTest()
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
	
	baseScene.setTitle("BBButtonBasicTest")
	baseScene.setDescription("button by create")
	
	local button = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button:setPosition(ccp(480, 320))
	baseScene.window:addChild(button)
	
	return baseScene.scene;
end

-- createCButtonEventTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCButtonEventTest()
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
	
	baseScene.setTitle("BBButtonEventTest")
	baseScene.setDescription("button events")
	
	
	local label1 = BBLabel:create()
	label1:setAnchorPoint(ccp(0, 0))
	label1:setPosition(ccp(260, 430))
	label1:setFontSize(35.0)
	label1:setString("none")
	baseScene.window:addChild(label1)
	
	local p_duration_text = BBLabel:create()
	p_duration_text:setPosition(ccp(260, 390))
	p_duration_text:setFontSize(35.0)
	p_duration_text:setAnchorPoint(ccp(0, 0.5))
	baseScene.window:addChild(p_duration_text)
	
	local function setDuraiont(duration)
		p_duration_text:setString("ms:"..tostring(duration))
	end
	
	local function on_btn_touchbegan(sender, p_touch)
		label1:setString("Down")
		return eWidgetTouchTransient;
	end
	
	local function on_btn_touchmoved(sender, p_touch, duration)
		label1:setString("Moved")
		setDuraiont(duration)
		return true;
	end
	
	local function on_btn_touchended(sender, p_touch, duration)
		label1:setString("Ended")
		setDuraiont(duration)
		return true;
	end
	
	local function on_btn_touchcancelled(sender, p_touch, duration)
		label1:setString("Cancelled")
		setDuraiont(duration)
		return true;
	end
	
	local button1 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button1:setOnTouchBeganScriptHandler(on_btn_touchbegan)
	button1:setOnTouchMovedScriptHandler(on_btn_touchmoved)
	button1:setOnTouchEndedScriptHandler(on_btn_touchended)
	button1:setOnTouchCancelledScriptHandler(on_btn_touchcancelled)
	button1:setPosition(ccp(350, 320))
	baseScene.window:addChild(button1)
	
	local label2 = BBLabel:create()
	label2:setAnchorPoint(ccp(0, 0.5))
	label2:setPosition(ccp(520, 430))
	label2:setFontSize(35.0)
	label2:setString("none")
	baseScene.window:addChild(label2)
	
	local function on_click(sender)
		label2:setString("Clicked")
	end
	
	local button2 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button2:setOnClickScriptHandler(on_click)
	button2:setPosition(ccp(610, 320))
	baseScene.window:addChild(button2)
	
	return baseScene.scene;
end

-- createCButtonLongClickTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCButtonLongClickTest()
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
	
	baseScene.setTitle("BBButtonLongClickTest")
	baseScene.setDescription("drag the 2s button after long click\n (the touch event will back to BBWidgetWindow after long click)")
	
	local button1 = nil
	local label1 = nil
	
	local function on_click(sender)
		label1:setString("Clicked")
	end
	
	local function on_Btn1_long_click(sender)
		label1:setString("Long Clicked")
		return false;
	end
	
	button1 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button1:setOnClickScriptHandler(on_click)
	button1:setOnLongClickScriptHandler(on_Btn1_long_click)
	button1:setPosition(ccp(350, 320))
	baseScene.window:addChild(button1)
	
	label1 = BBLabel:create()
	label1:setAnchorPoint(ccp(0, 0.5))
	label1:setPosition(ccp(260, 430))
	label1:setFontSize(35.0)
	label1:setString("none")
	baseScene.window:addChild(label1)
	
	local button2 = nil
	local label2 = nil
	
	local function on_btn2_long_click(sender, p_touch)
		button2:setPosition(baseScene.window:convertTouchToNodeSpace(p_touch))
		return true;
	end
	
	local function layout_atferlongclick_move(sender, p_touch, duration)
		button2:setPosition(baseScene.window:convertTouchToNodeSpace(p_touch))
	end
	
	baseScene.window:setOnTouchMovedAfterLongClickScriptHandler(layout_atferlongclick_move)
		
	label2 = BBLabel:create()
	label2:setAnchorPoint(ccp(0, 0.5))
	label2:setPosition(ccp(520, 430))
	label2:setFontSize(35.0)
	label2:setString("drag after long click!")
	baseScene.window:addChild(label2)

	button2 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button2:setOnLongClickScriptHandler(on_btn2_long_click)
	button2:setPosition(ccp(610, 320))
	baseScene.window:addChild(button2)
	
	return baseScene.scene;
end


-- createCButtonWithTextTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCButtonWithTextTest()
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
	
	baseScene.setTitle("BBButtonWithTextTest")
	baseScene.setDescription("TextButton and offset for text")
	
	local button1 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button1:setPosition(ccp(350, 320))
	button1:getLabel():setFontSize(32.0)
	button1:getLabel():setString("Cocos2d-x")
	baseScene.window:addChild(button1)

	local label1 = BBLabel:create()
	label1:setAnchorPoint(ccp(0, 0.5))
	label1:setPosition(ccp(260, 430))
	label1:setFontSize(35.0)
	label1:setString("Text")
	baseScene.window:addChild(label1)

	local button2 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button2:getLabel():setFontSize(32.0)
	button2:getLabel():setString("CocosWidget")
	button2:setLabelOffset(ccp(0, 10))
	button2:setPosition(ccp(610, 320))
	baseScene.window:addChild(button2)

	local label2 = BBLabel:create()
	label2:setAnchorPoint(ccp(0, 0.5))
	label2:setPosition(ccp(520, 430))
	label2:setFontSize(35.0)
	label2:setString("Text With Offset")
	baseScene.window:addChild(label2)
	
	return baseScene.scene;
end



-- createCButtonAttributeTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCButtonAttributeTest()
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
	
	baseScene.setTitle("BBButtonAttributeTest")
	baseScene.setDescription("")
	
	local button1 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button1:getLabel():setFontSize(30.0)
	button1:getLabel():setString("true")
	button1:setPosition(ccp(480, 500))
	button1:setEnabled(true)
	baseScene.window:addChild(button1)

	local button1ex = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button1ex:getLabel():setFontSize(30.0)
	button1ex:getLabel():setString("false")
	button1ex:setPosition(ccp(680, 500))
	button1ex:setEnabled(false)
	baseScene.window:addChild(button1ex)

	local label1 = BBLabel:create()
	label1:setAnchorPoint(ccp(1, 0.5))
	label1:setPosition(ccp(350, 500))
	label1:setFontSize(35.0)
	label1:setString("setEnabled()")
	baseScene.window:addChild(label1)

	local button2 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button2:getLabel():setFontSize(30.0)
	button2:getLabel():setString("true")
	button2:setPosition(ccp(480, 400))
	button2:setTouchEnabled(true)
	baseScene.window:addChild(button2)

	local button2ex = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button2ex:getLabel():setFontSize(30.0)
	button2ex:getLabel():setString("false")
	button2ex:setPosition(ccp(680, 400))
	button2ex:setTouchEnabled(false)
	baseScene.window:addChild(button2ex)

	local label2 = BBLabel:create()
	label2:setAnchorPoint(ccp(1, 0.5))
	label2:setPosition(ccp(350, 400))
	label2:setFontSize(35.0)
	label2:setString("setTouchEnabled()")
	baseScene.window:addChild(label2)
	
	local button3 = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button3:getLabel():setFontSize(30.0)
	button3:getLabel():setString("true")
	button3:setPosition(ccp(480, 300))
	button3:setVisible(true)
	baseScene.window:addChild(button3)

	local button3ex = BBButton:create("btn1_1.png", "btn1_2.png", "btn1_3.png")
	button3ex:getLabel():setFontSize(30.0)
	button3ex:getLabel():setString("false")
	button3ex:setPosition(ccp(680, 300))
	button3ex:setVisible(false)
	baseScene.window:addChild(button3ex)

	local label3 = BBLabel:create()
	label3:setAnchorPoint(ccp(1, 0.5))
	label3:setPosition(ccp(350, 300))
	label3:setFontSize(35.0)
	label3:setString("setVisible()")
	baseScene.window:addChild(label3)
	
	
	return baseScene.scene;
end



-- createCButton9SpriteTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCButton9SpriteTest()
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
	
	baseScene.setTitle("BBButton9SpriteTest")
	baseScene.setDescription("9PatchSprite by create")
	
	local button = BBButton:createWith9Sprite(CCSize(196, 68),"sprite9_btn1.png", "sprite9_btn2.png")
	button:getLabel():setFontSize(30.0)
	button:getLabel():setString("one")
	button:setPosition(ccp(480, 370))
	baseScene.window:addChild(button)

	local button2 = BBButton:create()
	button2:setContentSize(CCSize(196, 68))
	button2:setScale9Enabled(true)
	button2:setNormalImage("sprite9_btn1.png")
	button2:setSelectedImage("sprite9_btn2.png")
	button2:getLabel():setFontSize(30.0)
	button2:getLabel():setString("two")
	button2:setPosition(ccp(480, 270))
	baseScene.window:addChild(button2)
	


	return baseScene.scene;
end



local m_lData = {
	"a",
	"ab",
	"abc",
	"abcd",
	"abcdef",
	"abcdefgi",
	"hahahahaha\nhehehehehe",
	"hahahahaha\nhehehehehe\nkukukukukukukuku"
};
m_Size = table.getn(m_lData) + 1;
m_idx = 1

-- createCButtonChangeSizeTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCButtonChangeSizeTest()
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
	
	baseScene.setTitle("BBButtonChangeSizeTest")
	baseScene.setDescription("click the button for change anothor one")
	

	local m_button = BBButton:create()
	m_button:setScale9Enabled(true)
	m_button:setNormalImage("sprite9_btn1.png")
	m_button:setSelectedImage("sprite9_btn2.png")
	m_button:getLabel():setFontSize(30.0)
	m_button:getLabel():setString("none")
	m_button:setCascadeTextSizeEnabled(true, CCSize(50, 30))
	m_button:setPosition(ccp(480, 320))
	baseScene.window:addChild(m_button)
	
	local function on_click(sender)
		if m_idx == m_Size then
			return;
		end
		m_button:setText(tostring(m_lData[m_idx]))
		m_idx = m_idx + 1;
	end

	local pBtn = BBButton:createWith9Sprite(CCSizeMake(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pBtn:setPosition(ccp(250, 320))
	pBtn:getLabel():setFontSize(27)
	pBtn:getLabel():setString("click me")
	pBtn:setOnClickScriptHandler(on_click)
	baseScene.window:addChild(pBtn)
	
	
	return baseScene.scene;
end




local _n_CButton_test_idx = 0;

local function get_CButton_test_scene()
	if _n_CButton_test_idx == 0 then
		return createCButtonBasicTest()
	elseif _n_CButton_test_idx == 1 then
		return createCButtonEventTest()
	elseif _n_CButton_test_idx == 2 then
		return createCButtonLongClickTest()
	elseif _n_CButton_test_idx == 3 then
		return createCButtonWithTextTest()
	elseif _n_CButton_test_idx == 4 then
		return createCButtonAttributeTest()
	elseif _n_CButton_test_idx == 5 then
		return createCButton9SpriteTest()
	elseif _n_CButton_test_idx == 6 then
		return createCButtonChangeSizeTest()
	else
		_n_CButton_test_idx = 0;
		return createCButtonBasicTest()
	end
	return nil
end

function push_CButton_test_scene()
	_n_CButton_test_idx = 0;
	local scene = get_CButton_test_scene()
	_p_director:pushScene(scene)
end

fnTestNext = function()
	_n_CButton_test_idx = _n_CButton_test_idx + 1;
	local scene = get_CButton_test_scene()
	_p_director:replaceScene(scene)
end

fnTestBack = function()
	_n_CButton_test_idx = _n_CButton_test_idx - 1;
	local scene = get_CButton_test_scene()
	_p_director:replaceScene(scene)
end

fnTestRef = function()
	local scene = get_CButton_test_scene()
	_p_director:replaceScene(scene)
end




























