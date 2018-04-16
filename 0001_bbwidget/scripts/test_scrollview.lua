require "base"

local func_next_CScrollView_test_scene = nil
local func_back_CScrollView_test_scene = nil
local func_ref_CScrollView_test_scene = nil

-- createCScrollViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCScrollViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CScrollView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CScrollView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CScrollView_test_scene()
	end)
	
	baseScene.setTitle("BBScrollViewBasicTest")
	baseScene.setDescription("ScrollView basic test")
	
	local pBg = CCSprite:create("background.png")
	pBg:setPosition(ccp(480, 320))
	baseScene.window:addChild(pBg)

	local pScroll = BBScrollView:create(CCSize(480, 320))
	pScroll:setPosition(ccp(480, 320))
	pScroll:setDirection(eScrollViewDirectionBoth)
	baseScene.window:addChild(pScroll)

	local pSprite = CCSprite:create("scrollcontent.png")
	pSprite:setAnchorPoint(ccp(0,0))
	pSprite:setPosition(ccp(0,0))
	pScroll:setContainerSize(pSprite:getContentSize())
	pScroll:getContainer():addChild(pSprite)
	
	return baseScene.scene;
end



-- createCScrollViewEventTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCScrollViewEventTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CScrollView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CScrollView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CScrollView_test_scene()
	end)
	baseScene.setTitle("BBScrollViewEventTest")
	baseScene.setDescription("test event")
	
	local pBg = CCSprite:create("background.png")
	pBg:setPosition(ccp(680, 320))
	baseScene.window:addChild(pBg)
	
	local label1 = BBLabel:create()
	label1:setAnchorPoint(ccp(0, 0.5))
	label1:setPosition(ccp(35, 460))
	label1:setFontSize(35.0)
	label1:setString("contentOffset:")
	baseScene.window:addChild(label1)

	local pScroll = BBScrollView:create(CCSize(480, 320))
	pScroll:setOnScrollingScriptHandler(function(sender)
		local str = string.format("contentOffset:[%d][%d]", pScroll:getContentOffset().x, pScroll:getContentOffset().y)
		label1:setString(str)
	end)
	pScroll:setPosition(ccp(680, 320))
	pScroll:setDirection(eScrollViewDirectionBoth)
	baseScene.window:addChild(pScroll)

	local pSprite = CCSprite:create("scrollcontent.png")
	pSprite:setAnchorPoint(ccp(0,0))
	pSprite:setPosition(ccp(0,0))
	pScroll:setContainerSize(pSprite:getContentSize())
	pScroll:getContainer():addChild(pSprite)

	

	return baseScene.scene;
end


-- createCScrollViewHorizontalTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCScrollViewHorizontalTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CScrollView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CScrollView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CScrollView_test_scene()
	end)
	baseScene.setTitle("BBScrollViewHorizontalTest")
	baseScene.setDescription("test event")
	
	local pBg = CCSprite:create("background.png")
	pBg:setPosition(ccp(480, 320))
	baseScene.window:addChild(pBg)

	local pScroll = BBScrollView:create(CCSize(480, 320))
	pScroll:setPosition(ccp(480, 320))
	pScroll:setDirection(eScrollViewDirectionHorizontal)
	baseScene.window:addChild(pScroll)

	local pSprite = CCSprite:create("scrollcontent.png")
	pSprite:setAnchorPoint(ccp(0,0))
	pSprite:setPosition(ccp(0,0))
	pScroll:setContainerSize(pSprite:getContentSize())
	pScroll:getContainer():addChild(pSprite)
	
	for i = 0, 9, 1 do
		local pIcon = CCSprite:create("icon.png")
		pIcon:setAnchorPoint(ccp(0,0))
		pIcon:setPosition(ccp(i * 100, 0))
		pScroll:getContainer():addChild(pIcon)
	end

	for i = 0, 4, 1 do
		local pButton = BBButton:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
		pButton:setAnchorPoint(ccp(0,0))
		pButton:setPosition(ccp(i * 200, 200))
		pScroll:getContainer():addChild(pButton)
	end
	

	return baseScene.scene;
end


-- createCScrollViewVerticalTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCScrollViewVerticalTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CScrollView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CScrollView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CScrollView_test_scene()
	end)
	baseScene.setTitle("BBScrollViewVerticalTest")
	baseScene.setDescription("direction by vertical\n add some toggle button in the same group")
	
	
	local pBg = CCSprite:create("background.png")
	pBg:setPosition(ccp(480, 320))
	baseScene.window:addChild(pBg)

	local pScroll = BBScrollView:create(CCSize(480, 320))
	pScroll:setPosition(ccp(480, 320))
	pScroll:setDirection(eScrollViewDirectionVertical)
	baseScene.window:addChild(pScroll)

	local pSprite = CCSprite:create("scrollcontent.png")
	pSprite:setAnchorPoint(ccp(0,0))
	pSprite:setPosition(ccp(0,0))
	pScroll:setContainerSize(pSprite:getContentSize())
	pScroll:getContainer():addChild(pSprite)

	for i = 0, 4, 1 do
		local pToggleButton = BBToggleView:create("toggle1_1.png", "toggle1_2.png")
		pToggleButton:setAnchorPoint(ccp(0,0))
		pToggleButton:setPosition(ccp(130, i * 130))
		pToggleButton:setExclusion(1)
		pScroll:getContainer():addChild(pToggleButton)
	end

	return baseScene.scene;
end


-- createCScrollViewAttributeTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCScrollViewAttributeTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CScrollView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CScrollView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CScrollView_test_scene()
	end)
	baseScene.setTitle("BBScrollViewAttributeTest")
	baseScene.setDescription("test attribute of scroll")
	
	local pBg = CCSprite:create("background.png")
	pBg:setPosition(ccp(680, 320))
	baseScene.window:addChild(pBg)

	local pScroll = BBScrollView:create(CCSize(480, 320))
	pScroll:setPosition(ccp(680, 320))
	pScroll:setDirection(eScrollViewDirectionVertical)
	baseScene.window:addChild(pScroll)

	local pSprite = CCSprite:create("scrollcontent.png")
	pSprite:setAnchorPoint(ccp(0,0))
	pSprite:setPosition(ccp(0,0))
	pScroll:setContainerSize(pSprite:getContentSize())
	pScroll:getContainer():addChild(pSprite)

	for i = 0, 4, 1 do
		local pToggleButton = BBToggleView:create("toggle1_1.png", "toggle1_2.png")
		pToggleButton:setAnchorPoint(ccp(0,0))
		pToggleButton:setPosition(ccp(130, i * 130))
		pToggleButton:setExclusion(1)
		pScroll:getContainer():addChild(pToggleButton)
	end
	
	
	local function on_click(sender)
		local p_toggle = tolua.cast(sender, "BBToggleView")
		local p_text = p_toggle:getUserObject()
		
		if p_toggle:isChecked() == true then
			p_text:setString("true")
		else
			p_text:setString("false")
		end
		
		if p_toggle:getUserTag() == 1 then
			pScroll:setDeaccelerateable(p_toggle:isChecked())
		elseif p_toggle:getUserTag() == 2 then
			pScroll:setBounceable(p_toggle:isChecked())
		elseif p_toggle:getUserTag() == 3 then
			pScroll:setDragable(p_toggle:isChecked())
		elseif p_toggle:getUserTag() == 4 then
			pScroll:setTouchEnabled(p_toggle:isChecked())
		end
		
	end

	local pToggle1 = BBToggleView:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pToggle1:getLabel():setFontSize(28)
	pToggle1:getLabel():setString("setDeaccelerateable")
	pToggle1:setPosition(150, 480)
	pToggle1:setChecked(true)
	pToggle1:setOnClickScriptHandler(on_click)
	pToggle1:setUserTag(1)
	baseScene.window:addChild(pToggle1)

	local label1 = BBLabel:create()
	label1:setAnchorPoint(ccp(0, 0.5))
	label1:setPosition(ccp(300, 480))
	label1:setFontSize(35.0)
	label1:setString("true")
	baseScene.window:addChild(label1)
	pToggle1:setUserObject(label1)

	local pToggle2 = BBToggleView:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pToggle2:getLabel():setFontSize(28)
	pToggle2:getLabel():setString("setBounceable")
	pToggle2:setPosition(150, 400)
	pToggle2:setChecked(true)
	pToggle2:setOnClickScriptHandler(on_click)
	pToggle2:setUserTag(2)
	baseScene.window:addChild(pToggle2)

	local label2 = BBLabel:create()
	label2:setAnchorPoint(ccp(0, 0.5))
	label2:setPosition(ccp(300, 400))
	label2:setFontSize(35.0)
	label2:setString("true")
	baseScene.window:addChild(label2)
	pToggle2:setUserObject(label2)


	local pToggle3 = BBToggleView:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pToggle3:getLabel():setFontSize(28)
	pToggle3:getLabel():setString("setDragable")
	pToggle3:setPosition(150, 320)
	pToggle3:setChecked(true)
	pToggle3:setOnClickScriptHandler(on_click)
	pToggle3:setUserTag(3)
	baseScene.window:addChild(pToggle3)

	local label3 = BBLabel:create()
	label3:setAnchorPoint(ccp(0, 0.5))
	label3:setPosition(ccp(300, 320))
	label3:setFontSize(35.0)
	label3:setString("true")
	baseScene.window:addChild(label3)
	pToggle3:setUserObject(label3)

	local pToggle4 = BBToggleView:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pToggle4:getLabel():setFontSize(28)
	pToggle4:getLabel():setString("setTouchEnabled")
	pToggle4:setPosition(150, 240)
	pToggle4:setChecked(true)
	pToggle4:setOnClickScriptHandler(on_click)
	pToggle4:setUserTag(4)
	baseScene.window:addChild(pToggle4)

	local label4 = BBLabel:create()
	label4:setAnchorPoint(ccp(0, 0.5))
	label4:setPosition(ccp(300, 240))
	label4:setFontSize(35.0)
	label4:setString("true")
	baseScene.window:addChild(label4)
	pToggle4:setUserObject(label4)

	return baseScene.scene;
end


-- createCScrollViewAnimationTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCScrollViewAnimationTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CScrollView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CScrollView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CScrollView_test_scene()
	end)
	baseScene.setTitle("BBScrollViewAnimationTest")
	baseScene.setDescription("test animation")
	
	
	local pBg = CCSprite:create("background.png")
	pBg:setPosition(ccp(680, 320))
	baseScene.window:addChild(pBg)

	local pScroll = BBScrollView:create(CCSize(480, 320))
	pScroll:setPosition(ccp(680, 320))
	pScroll:setDirection(eScrollViewDirectionHorizontal)
	baseScene.window:addChild(pScroll)

	local pSprite = CCSprite:create("scrollcontent.png")
	pSprite:setAnchorPoint(ccp(0,0))
	pSprite:setPosition(ccp(0,0))
	pScroll:setContainerSize(pSprite:getContentSize())
	pScroll:getContainer():addChild(pSprite)

	for i = 0, 9, 1 do
		local pIcon = CCSprite:create("icon.png")
		pIcon:setAnchorPoint(ccp(0,0))
		pIcon:setPosition(ccp(i * 100, 100))
		pScroll:getContainer():addChild(pIcon)
	end
	
	local function on_click(sender)
		local btn = tolua.cast(sender, "BBButton")
		if btn:getUserTag() == 1 then
			pScroll:setContentOffsetInDuration(ccp(pScroll:getMinOffset().x, pScroll:getMinOffset().y), 1.0)
		elseif btn:getUserTag() == 2 then
			pScroll:setContentOffsetEaseIn(ccp(pScroll:getMaxOffset().x, pScroll:getMaxOffset().y), 1.0, 0.2)
		elseif btn:getUserTag() == 3 then
			pScroll:setContentOffset(ccp(pScroll:getMinOffset().x, pScroll:getMinOffset().y))
		end
	end

	local pButton1 = BBButton:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pButton1:getLabel():setFontSize(28)
	pButton1:getLabel():setString("scrollToRight")
	pButton1:setPosition(120, 480)
	pButton1:setOnClickScriptHandler(on_click)
	pButton1:setUserTag(1)
	baseScene.window:addChild(pButton1)

	local label1 = BBLabel:create()
	label1:setAnchorPoint(ccp(0, 0.5))
	label1:setPosition(ccp(240, 480))
	label1:setFontSize(35.0)
	label1:setString("setContentOffsetInDuration")
	baseScene.window:addChild(label1)


	local pButton2 = BBButton:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pButton2:getLabel():setFontSize(28)
	pButton2:getLabel():setString("scrollToLeft")
	pButton2:setPosition(120, 400)
	pButton2:setOnClickScriptHandler(on_click)
	pButton2:setUserTag(2)
	baseScene.window:addChild(pButton2)

	local label2 = BBLabel:create()
	label2:setAnchorPoint(ccp(0, 0.5))
	label2:setPosition(ccp(240, 400))
	label2:setFontSize(35.0)
	label2:setString("setContentOffsetEaseIn")
	baseScene.window:addChild(label2)

	local pButton3 = BBButton:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pButton3:getLabel():setFontSize(28)
	pButton3:getLabel():setString("scrollToRight")
	pButton3:setPosition(120, 320)
	pButton3:setOnClickScriptHandler(on_click)
	pButton3:setUserTag(3)
	baseScene.window:addChild(pButton3)

	local label3 = BBLabel:create()
	label3:setAnchorPoint(ccp(0, 0.5))
	label3:setPosition(ccp(240, 320))
	label3:setFontSize(35.0)
	label3:setString("setContentOffset")
	baseScene.window:addChild(label3)
	
	
	return baseScene.scene;
end	


-- createCScrollViewInsideScrollTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCScrollViewInsideScrollTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CScrollView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CScrollView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CScrollView_test_scene()
	end)
	baseScene.setTitle("BBScrollViewInsideScrollTest")
	baseScene.setDescription("Scroll view inside the other one")
	
	
	local pScroll = BBScrollView:create(CCSize(480, 320))
	pScroll:setBackgroundImage("background.png")
	pScroll:setPosition(ccp(480, 320))
	pScroll:setDirection(eScrollViewDirectionBoth)
	baseScene.window:addChild(pScroll)

	local pSprite = CCSprite:create("scrollcontent.png")
	pSprite:setAnchorPoint(ccp(0,0))
	pSprite:setPosition(ccp(0,0))
	pScroll:setContainerSize(pSprite:getContentSize())
	pScroll:getContainer():addChild(pSprite)

	local pScroll2 = BBScrollView:create(CCSize(272, 76))
	pScroll2:setDirection(eScrollViewDirectionHorizontal)
	pScroll2:setBackgroundImage("background3.png")
	pScroll2:setPosition(ccp(480 /2, 320 / 2))
	pScroll:getContainer():addChild(pScroll2)

	pScroll2:setContainerSize(CCSize(62 * 20, 76))
	for i = 0, 19, 1 do
		local pSp = CCSprite:create("icon.png")
		pSp:setAnchorPoint(ccp(0,0))
		pSp:setPosition(ccp(i * 62, 0))
		pScroll2:getContainer():addChild(pSp)
	end

	return baseScene.scene;
end	

	
	

local _n_CScrollView_test_idx = 0;

local function get_CScrollView_test_scene()
	if _n_CScrollView_test_idx == 0 then
		return createCScrollViewBasicTest()
	elseif _n_CScrollView_test_idx == 1 then
		return createCScrollViewEventTest()
	elseif _n_CScrollView_test_idx == 2 then
		return createCScrollViewHorizontalTest()
	elseif _n_CScrollView_test_idx == 3 then
		return createCScrollViewVerticalTest()
	elseif _n_CScrollView_test_idx == 4 then
		return createCScrollViewAttributeTest()
	elseif _n_CScrollView_test_idx == 5 then
		return createCScrollViewAnimationTest()
	elseif _n_CScrollView_test_idx == 6 then
		return createCScrollViewInsideScrollTest()
	else
		_n_CScrollView_test_idx = 0;
		return createCScrollViewBasicTest()
	end
	return nil
end

function push_CScrollView_test_scene()
	_n_CScrollView_test_idx = 0;
	local scene = get_CScrollView_test_scene()
	_p_director:pushScene(scene)
end

func_next_CScrollView_test_scene = function()
	_n_CScrollView_test_idx = _n_CScrollView_test_idx + 1;
	local scene = get_CScrollView_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CScrollView_test_scene = function()
	_n_CScrollView_test_idx = _n_CScrollView_test_idx - 1;
	local scene = get_CScrollView_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CScrollView_test_scene = function()
	local scene = get_CScrollView_test_scene()
	_p_director:replaceScene(scene)
end




























