require "base"

local func_next_CGridPageView_test_scene = nil
local func_back_CGridPageView_test_scene = nil
local func_ref_CGridPageView_test_scene = nil

-- createCGridPageViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCGridPageViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CGridPageView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CGridPageView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CGridPageView_test_scene()
	end)
	
	baseScene.setTitle("BBGridPageViewBasicTest")
	baseScene.setDescription("GridPageView basic test")
	
	local function data_source(convertview, idx)
		local pCell = tolua.cast(convertview, "BBGridPageViewCell")
		local pButton = nil

		if pCell == nil then
			pCell = BBGridPageViewCell:new()
			pCell:autorelease()

			pButton = BBButton:createWith9Sprite(CCSizeMake(70, 70), "sprite9_btn1.png", "sprite9_btn2.png")
			pButton:setPosition(ccp(320 / 4 / 2, 390 / 5 / 2))
			pButton:getLabel():setFontSize(25.0)
			pButton:setTag(5)
			pCell:addChild(pButton)
		else
			pButton = tolua.cast(pCell:getChildByTag(5), "BBButton")
		end
		
		if idx ~= -1 then
			pButton:setVisible(true)
			pButton:getLabel():setString(tostring(idx))
			pButton:setUserTag(idx)
		else
			pButton:setVisible(false)
		end
		return pCell;
	end
	
	local pBg = CCSprite:create("background2.png")
	pBg:setPosition(ccp(480, 320))
	baseScene.window:addChild(pBg)

	local aTable = BBGridPageView:create(CCSizeMake(320, 390))
	aTable:setSizeOfCell(CCSizeMake(320 / 4, 390 / 5))
	aTable:setCountOfCell(72)
	aTable:setDataSourceAdapterScriptHandler(data_source)
	aTable:setColumns(4)
	aTable:setRows(5)
	aTable:setAutoRelocate(true)
	aTable:setPosition(ccp(480, 320))
	baseScene.window:addChild(aTable)
	aTable:reloadData()
	
	return baseScene.scene;
end


-- createCGridPageViewBackPackTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCGridPageViewBackPackTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CGridPageView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CGridPageView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CGridPageView_test_scene()
	end)
	
	baseScene.setTitle("BBGridPageViewBackPackTest")
	baseScene.setDescription("backpack test, long click item and drag into circle for remove")
	
	local m_vData = {};
	local m_pSelectedSprite = nil
	local m_pToggleImage = nil
	local aTable = nil
	
	for i = 0, 71, 1 do
		m_vData[i + 1] = i;
	end

	local pBg = CCSprite:create("background2.png")
	pBg:setPosition(ccp(480, 320))
	baseScene.window:addChild(pBg)
	
	
	local function on_item_longclick(sender, p_touch)
		local pIconButton = tolua.cast(sender, "BBButton")
		pIconButton:setVisible(false)
		m_pSelectedSprite:setVisible(true)
		m_pSelectedSprite:setPosition(p_touch:getLocation())
		return true;
	end
	
	local function on_afterlongclick_moved(sender, p_touch, duration)
		m_pSelectedSprite:setPosition(p_touch:getLocation())
		local tLayoutPoint = baseScene.window:convertTouchToNodeSpace(p_touch)
		if m_pToggleImage:boundingBox():containsPoint(tLayoutPoint) == true then
			m_pToggleImage:setChecked(true)
		else
			m_pToggleImage:setChecked(false)
		end
	end
	
	local function on_afterlongclick_ended(sender, p_touch, duration)
		
		local pIconButton = tolua.cast(sender, "BBButton")
		m_pSelectedSprite:setPosition(p_touch:getLocation())
		
		pIconButton:setVisible(true) --back to the same as before dragged
		m_pSelectedSprite:setVisible(false)
		m_pToggleImage:setChecked(false)

		local tLayoutPoint = baseScene.window:convertTouchToNodeSpace(p_touch)
		if m_pToggleImage:boundingBox():containsPoint(tLayoutPoint) == true then
			table.remove(m_vData,pIconButton:getUserTag())
			aTable:setCountOfCell(table.getn(m_vData))
			aTable:reloadData()
		end
	end
	
	baseScene.window:setOnTouchMovedAfterLongClickScriptHandler(on_afterlongclick_moved)
	baseScene.window:setOnTouchEndedAfterLongClickScriptHandler(on_afterlongclick_ended)
	baseScene.window:setOnTouchCancelledAfterLongClickScriptHandler(on_afterlongclick_ended)
	
	local function data_source(convertview, idx)
		local pCell = tolua.cast(convertview, "BBGridPageViewCell")
		local pIconButton = nil

		if pCell == nil then
			pCell = BBGridPageViewCell:new()
			pCell:autorelease()

			local pBg = BBImageViewScale9:create("sprite9_btn1.png")
			pBg:setContentSize(CCSize(70, 70))
			pBg:setPosition(ccp(320 / 4 / 2, 390 / 5 / 2))
			pCell:addChild(pBg, -1)

			pIconButton = BBButton:create("icon.png")
			pIconButton:setOnLongClickScriptHandler(on_item_longclick)
			pIconButton:getLabel():setFontSize(25)
			pIconButton:setPosition(ccp(320 / 4 / 2, 390 / 5 / 2))
			pIconButton:setLabelOffset(ccp(-15, -15))
			pIconButton:setTag(1)
			pCell:addChild(pIconButton)
		else
			pIconButton = tolua.cast(pCell:getChildByTag(1), "BBButton")
		end

		if idx ~= -1 then
			pIconButton:setVisible(true)

			pIconButton:getLabel():setString(tostring(m_vData[idx + 1]))
			pIconButton:setUserTag(idx + 1)
		else
			pIconButton:setVisible(false)
		end

		return pCell;
	end

	aTable = BBGridPageView:create(CCSizeMake(320, 390))
	aTable:setDataSourceAdapterScriptHandler(data_source)
	aTable:setSizeOfCell(CCSizeMake(320 / 4, 390 / 5))
	aTable:setCountOfCell(table.getn(m_vData))
	aTable:setColumns(4)
	aTable:setRows(5)
	aTable:setAutoRelocate(true)
	aTable:setPosition(ccp(480, 320))
	baseScene.window:addChild(aTable)
	aTable:reloadData()

	m_pSelectedSprite = CCSprite:create("icon.png")
	m_pSelectedSprite:setOpacity(170)
	--m_pSelectedSprite:setZOrder(1)
	m_pSelectedSprite:setVisible(false)
	baseScene.window:addChild(m_pSelectedSprite, 1)

	m_pToggleImage = BBToggleView:create("circle1.png", "circle2.png")
	m_pToggleImage:setPosition(ccp(200, 320))
	baseScene.window:addChild(m_pToggleImage)

	return baseScene.scene;
end




local _n_CGridPageView_test_idx = 0;

local function get_CGridPageView_test_scene()
	if _n_CGridPageView_test_idx == 0 then
		return createCGridPageViewBasicTest()
	elseif _n_CGridPageView_test_idx == 1 then
		return createCGridPageViewBackPackTest()
	else
		_n_CGridPageView_test_idx = 0;
		return createCGridPageViewBasicTest()
	end
	return nil
end

function push_CGridPageView_test_scene()
	_n_CGridPageView_test_idx = 0;
	local scene = get_CGridPageView_test_scene()
	_p_director:pushScene(scene)
end

func_next_CGridPageView_test_scene = function()
	_n_CGridPageView_test_idx = _n_CGridPageView_test_idx + 1;
	local scene = get_CGridPageView_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CGridPageView_test_scene = function()
	_n_CGridPageView_test_idx = _n_CGridPageView_test_idx - 1;
	local scene = get_CGridPageView_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CGridPageView_test_scene = function()
	local scene = get_CGridPageView_test_scene()
	_p_director:replaceScene(scene)
end




























