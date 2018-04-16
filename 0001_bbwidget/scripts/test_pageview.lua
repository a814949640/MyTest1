require "base"

local func_next_CPageView_test_scene = nil
local func_back_CPageView_test_scene = nil
local func_ref_CPageView_test_scene = nil

-- createCPageViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCPageViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CPageView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CPageView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CPageView_test_scene()
	end)
	
	baseScene.setTitle("BBPageViewBasicTest")
	baseScene.setDescription("PageView basic test")
	
	local function data_source(convertview, idx)
		local pPageCell = tolua.cast(convertview, "BBPageViewCell")
		local pButton = nil

		if pPageCell == nil then
			pPageCell = BBPageViewCell:new()
			pPageCell:autorelease()
			pPageCell:setBackgroundImage("background.png")

			pButton = BBButton:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
			pButton:getLabel():setFontSize(30.0)
			pButton:setPosition(ccp(484 / 2, 320 / 2))
			pButton:setTag(1)
			pPageCell:addChild(pButton)
		else
			pButton = tolua.cast(pPageCell:getChildByTag(1), "BBButton")
		end
		
		pButton:getLabel():setString(tostring(idx))

		return pPageCell;
	end
	
	local label = BBLabel:create()
	label:setAnchorPoint(ccp(0, 0.5))
	label:setPosition(ccp(800, 320))
	label:setFontSize(35.0)
	label:setString("none")
	baseScene.window:addChild(label)
	
	local function on_page_changed(sender, idx)
		label:setString(tostring(idx))
	end
	

	local pPageView = BBPageView:create(CCSize(484, 320))
	pPageView:setCountOfCell(10)
	pPageView:setDataSourceAdapterScriptHandler(data_source)
	pPageView:setOnPageChangedScriptHandler(on_page_changed)
	pPageView:setPosition(ccp(480, 320))
	baseScene.window:addChild(pPageView)
	pPageView:reloadData()
	
	return baseScene.scene;
end


-- createCPageViewVerticalTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCPageViewVerticalTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CPageView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CPageView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CPageView_test_scene()
	end)
	
	baseScene.setTitle("BBPageViewVerticalTest")
	baseScene.setDescription("PageView in vertical")
	
	
	local label = BBLabel:create()
	label:setAnchorPoint(ccp(0, 0.5))
	label:setPosition(ccp(800, 320))
	label:setFontSize(35.0)
	label:setString("none")
	baseScene.window:addChild(label)
	
	local function data_source(convertview, idx)
		local pPageCell = tolua.cast(convertview, "BBPageViewCell")
		local pButton = nil

		if pPageCell == nil then
			pPageCell = BBPageViewCell:new()
			pPageCell:autorelease()
			pPageCell:setBackgroundImage("background.png")

			pButton = BBButton:createWith9Sprite(CCSize(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
			pButton:getLabel():setFontSize(30.0)
			pButton:setPosition(ccp(484 / 2, 320 / 2))
			pButton:setTag(1)
			pPageCell:addChild(pButton)
		else
			pButton = tolua.cast(pPageCell:getChildByTag(1), "BBButton")
		end
		
		pButton:getLabel():setString(tostring(idx))

		return pPageCell;
	end
	
	local function on_page_changed(sender, idx)
		label:setString(tostring(idx))
	end
	
	local pPageView = BBPageView:create(CCSize(484, 320))
	pPageView:setCountOfCell(10)
	pPageView:setDataSourceAdapterScriptHandler(data_source)
	pPageView:setOnPageChangedScriptHandler(on_page_changed)
	pPageView:setPosition(ccp(480, 320))
	pPageView:setDirection(eScrollViewDirectionVertical)
	baseScene.window:addChild(pPageView)
	pPageView:reloadData()

	return baseScene.scene;
end





local _n_CPageView_test_idx = 0;

local function get_CPageView_test_scene()
	if _n_CPageView_test_idx == 0 then
		return createCPageViewBasicTest()
	elseif _n_CPageView_test_idx == 1 then
		return createCPageViewVerticalTest()
	else
		_n_CPageView_test_idx = 0;
		return createCPageViewBasicTest()
	end
	return nil
end

function push_CPageView_test_scene()
	_n_CPageView_test_idx = 0;
	local scene = get_CPageView_test_scene()
	_p_director:pushScene(scene)
end

func_next_CPageView_test_scene = function()
	_n_CPageView_test_idx = _n_CPageView_test_idx + 1;
	local scene = get_CPageView_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CPageView_test_scene = function()
	_n_CPageView_test_idx = _n_CPageView_test_idx - 1;
	local scene = get_CPageView_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CPageView_test_scene = function()
	local scene = get_CPageView_test_scene()
	_p_director:replaceScene(scene)
end




























