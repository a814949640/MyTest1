require "base"

local func_next_CProgressBar_test_scene = nil
local func_back_CProgressBar_test_scene = nil
local func_ref_CProgressBar_test_scene = nil

-- createCProgressBarBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCProgressBarBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CProgressBar_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CProgressBar_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CProgressBar_test_scene()
	end)
	
	baseScene.setTitle("BBProgressBarBasicTest")
	baseScene.setDescription("click the button to changed progress")
	
	
	local label = nil
	local m_pProgressBar = nil
	
	local function on_progressing(sender, n_value)
		label:setString(string.format("value %d, percentage %f", m_pProgressBar:getValue(), m_pProgressBar:getPercentage()))
	end
	
	local function on_click(sender)
		local pButton = tolua.cast(sender, "BBButton")
		if pButton:getUserTag() == 1 then
			m_pProgressBar:setValue(m_pProgressBar:getValue() + 10)
		elseif pButton:getUserTag() == 2 then
			m_pProgressBar:setValue(m_pProgressBar:getValue() - 5)
		elseif pButton:getUserTag() == 3 then
			if m_pProgressBar:getDirection() == eProgressBarDirectionLeftToRight then
				m_pProgressBar:setDirection(eProgressBarDirectionRightToLeft)
			else
				m_pProgressBar:setDirection(eProgressBarDirectionLeftToRight)
			end
		elseif pButton:getUserTag() == 4 then
			m_pProgressBar:startProgress(100, 5.0)
		elseif pButton:getUserTag() == 5 then
			m_pProgressBar:stopProgress()
		end
	end
	
	local m_pBg = CCSprite:create("background.png")
	m_pBg:setScale(1.3)
	m_pBg:setPosition(ccp(480, 320))
	baseScene.window:addChild(m_pBg)

	m_pProgressBar = BBProgressBar:create("progress.png")
	m_pProgressBar:setBackgroundImage("progress_bg.png")
	m_pProgressBar:setPosition(ccp(480, 320))
	m_pProgressBar:setMaxValue(100)
	m_pProgressBar:setMinValue(0)
	m_pProgressBar:setDirection(eProgressBarDirectionLeftToRight)
	m_pProgressBar:setOnValueChangedScriptHandler(on_progressing)
	m_pProgressBar:setContentSize(CCSize(960, 640))
	baseScene.window:addChild(m_pProgressBar)

	local pButton = BBButton:createWith9Sprite(CCSize(150, 60),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton:setPosition(ccp(250, 450))
	pButton:setUserTag(1)
	pButton:setOnClickScriptHandler(on_click)
	pButton:getLabel():setFontSize(30)
	pButton:getLabel():setString("Add")
	baseScene.window:addChild(pButton)

	local pButton2 = BBButton:createWith9Sprite(CCSize(150, 60),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton2:setPosition(ccp(450, 450))
	pButton2:setUserTag(2)
	pButton2:setOnClickScriptHandler(on_click)
	pButton2:getLabel():setFontSize(30)
	pButton2:getLabel():setString("Less")
	baseScene.window:addChild(pButton2)

	local pButton3 = BBButton:createWith9Sprite(CCSize(200, 60),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton3:setPosition(ccp(670, 450))
	pButton3:setUserTag(3)
	pButton3:setOnClickScriptHandler(on_click)
	pButton3:getLabel():setFontSize(30)
	pButton3:getLabel():setString("change direction")
	baseScene.window:addChild(pButton3)

	local pButton4 = BBButton:createWith9Sprite(CCSize(150, 60),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton4:setPosition(ccp(350, 200))
	pButton4:setUserTag(4)
	pButton4:setOnClickScriptHandler(on_click)
	pButton4:getLabel():setFontSize(30)
	pButton4:getLabel():setString("startProgress")
	pButton4:setCascadeTextSizeEnabled(true, CCSize(50, 30))
	baseScene.window:addChild(pButton4)

	local pButton5 = BBButton:createWith9Sprite(CCSize(150, 60),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton5:setPosition(ccp(650, 200))
	pButton5:setUserTag(5)
	pButton5:setOnClickScriptHandler(on_click)
	pButton5:getLabel():setFontSize(30)
	pButton5:getLabel():setString("stopProgress")
	pButton5:setCascadeTextSizeEnabled(true, CCSize(50, 30))
	baseScene.window:addChild(pButton5)
	
	label = BBLabel:create()
	label:setAnchorPoint(ccp(0, 0.5))
	label:setPosition(ccp(200, 400))
	label:setFontSize(35.0)
	label:setString("none")
	baseScene.window:addChild(label)
	
	return baseScene.scene;
end




local _n_CProgressBar_test_idx = 0;

local function get_CProgressBar_test_scene()
	if _n_CProgressBar_test_idx == 0 then
		return createCProgressBarBasicTest()
	else
		_n_CProgressBar_test_idx = 0;
		return createCProgressBarBasicTest()
	end
	return nil
end

function push_CProgressBar_test_scene()
	_n_CProgressBar_test_idx = 0;
	local scene = get_CProgressBar_test_scene()
	_p_director:pushScene(scene)
end

func_next_CProgressBar_test_scene = function()
	_n_CProgressBar_test_idx = _n_CProgressBar_test_idx + 1;
	local scene = get_CProgressBar_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CProgressBar_test_scene = function()
	_n_CProgressBar_test_idx = _n_CProgressBar_test_idx - 1;
	local scene = get_CProgressBar_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CProgressBar_test_scene = function()
	local scene = get_CProgressBar_test_scene()
	_p_director:replaceScene(scene)
end




























