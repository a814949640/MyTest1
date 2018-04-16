require "base"

local func_next_CListView_test_scene = nil
local func_back_CListView_test_scene = nil
local func_ref_CListView_test_scene = nil



-- createCListViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCListViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CListView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CListView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CListView_test_scene()
	end)
	
	baseScene.setTitle("BBListViewBasicTest")
	baseScene.setDescription("ListView Test")
	
	local m_data = {};
	table.insert(m_data, { s = CCSize(480, 10), c = ccc3(255,255,255) })
	table.insert(m_data, { s = CCSize(480, 20), c = ccc3(255,0,0) })
	table.insert(m_data, { s = CCSize(480, 30), c = ccc3(0,255,0) })
	table.insert(m_data, { s = CCSize(100, 40), c = ccc3(255,127,0) })
	table.insert(m_data, { s = CCSize(480, 50), c = ccc3(255,0,255) })
	table.insert(m_data, { s = CCSize(400, 60), c = ccc3(0,0,255) })
	table.insert(m_data, { s = CCSize(300, 80), c = ccc3(255,0,0) })
	table.insert(m_data, { s = CCSize(480, 30), c = ccc3(166,166,166) })
	table.insert(m_data, { s = CCSize(480, 40), c = ccc3(255,255,0) })
	
	
	local m_pListView = nil
	
	local function onClick(sender)
		if table.getn(m_data) > 0 then
			local tagItem = m_data[1];
			local pNode = CCNode:create()
			pNode:setContentSize(tagItem.s)
			local pLayout = BBLayout:create()
			pLayout:setBackgroundColor(ccc4(tagItem.c.r, tagItem.c.g, tagItem.c.b, 255))
			pLayout:setAnchorPoint(ccp(0.5, 0.5))
			pLayout:setContentSize(CCSize(tagItem.s.width - 4, tagItem.s.height - 2))
			pLayout:setPosition(ccp(tagItem.s.width/2, tagItem.s.height/2))
			pNode:addChild(pLayout)
			m_pListView:insertNodeAtLast(pNode)
			m_pListView:reloadData()
			table.remove(m_data, 1)
		end
	end
	
	m_pListView = BBListView:create(CCSize(480, 320))
	m_pListView:setBackgroundImage("background.png")
	m_pListView:setPosition(ccp(480, 320))
	m_pListView:setDirection(eScrollViewDirectionVertical)
	baseScene.window:addChild(m_pListView)

	local pButton = BBButton:createWith9Sprite(CCSize(150, 50),"sprite9_btn1.png", "sprite9_btn2.png")
	pButton:setPosition(ccp(150, 320))
	pButton:setOnClickScriptHandler(onClick)
	pButton:getLabel():setFontSize(30)
	pButton:getLabel():setString("Add")
	baseScene.window:addChild(pButton)

	
	return baseScene.scene;
end


-- createCListViewOperateTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCListViewOperateTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CListView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CListView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CListView_test_scene()
	end)
	
	baseScene.setTitle("BBListViewOperateTest")
	baseScene.setDescription("Add or Remove operate")
	
	local last_add_idx = 0;
	local m_pListView = nil
	
	local function func_on_click(sender)
		local pButton = tolua.cast(sender, "BBButton")	
		if pButton:getUserTag() == 1 then
			local pLayout = BBLayout:create()
			pLayout:setContentSize(CCSize(480, 30))

			local pColor = BBColorView:create(ccc4(128, 0, 0, 255))
			pColor:setContentSize(CCSize(480 - 4, 30 - 2))
			pColor:setPosition(ccp(480 /2, 30 /2))
			pLayout:addChild(pColor)

			local pButton =  BBButton:createWith9Sprite(CCSize(150, 25),"sprite9_btn1.png", "sprite9_btn2.png")
			pButton:setPosition(ccp(480 /2, 30 /2))
			pButton:getLabel():setFontSize(20)
			pButton:getLabel():setString(tostring(last_add_idx))
			pLayout:addChild(pButton)
			last_add_idx = last_add_idx + 1;

			m_pListView:insertNodeAtLast(pLayout)
			m_pListView:reloadData()
			
		elseif pButton:getUserTag() == 2 then
		
			local pLayout = BBLayout:create()
			pLayout:setContentSize(CCSize(480, 30))

			local pColor = BBColorView:create(ccc4(0, 128, 0, 255))
			pColor:setContentSize(CCSize(480 - 4, 30 - 2))
			pColor:setPosition(ccp(480 /2, 30 /2))
			pLayout:addChild(pColor)

			local pButton =  BBButton:createWith9Sprite(CCSize(150, 25),
					"sprite9_btn1.png", "sprite9_btn2.png")
			pButton:setPosition(ccp(480 /2, 30 /2))
			pButton:getLabel():setFontSize(20)
			pButton:getLabel():setString(tostring(last_add_idx))
			pLayout:addChild(pButton)
			last_add_idx = last_add_idx + 1;

			m_pListView:insertNodeAtFront(pLayout)
			m_pListView:reloadData()
			
		elseif pButton:getUserTag() == 3 then
		
			m_pListView:removeLastNode()
			m_pListView:reloadData()
			
		elseif pButton:getUserTag() == 4 then
		
			m_pListView:removeFrontNode()
			m_pListView:reloadData()
			
		end
	end
	
	m_pListView = BBListView:create(CCSize(480, 320))
	m_pListView:setBackgroundImage("background.png")
	m_pListView:setPosition(ccp(480, 320))
	m_pListView:setDirection(eScrollViewDirectionVertical)
	baseScene.window:addChild(m_pListView)

	local pButton = BBButton:createWith9Sprite(CCSize(150, 50),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton:setPosition(ccp(150, 450))
	pButton:setUserTag(1)
	pButton:setOnClickScriptHandler(func_on_click)
	pButton:getLabel():setFontSize(30)
	pButton:getLabel():setString("Add Last")
	baseScene.window:addChild(pButton)

	local pButton2 = BBButton:createWith9Sprite(CCSize(150, 50),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton2:setPosition(ccp(150, 380))
	pButton2:setUserTag(2)
	pButton2:setOnClickScriptHandler(func_on_click)
	pButton2:getLabel():setFontSize(30)
	pButton2:getLabel():setString("Add Front")
	baseScene.window:addChild(pButton2)

	local pButton3 = BBButton:createWith9Sprite(CCSize(150, 50),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton3:setPosition(ccp(150, 310))
	pButton3:setUserTag(3)
	pButton3:setOnClickScriptHandler(func_on_click)
	pButton3:getLabel():setFontSize(30)
	pButton3:getLabel():setString("Remove Last")
	baseScene.window:addChild(pButton3)

	local pButton4 = BBButton:createWith9Sprite(CCSize(150, 50),
		"sprite9_btn1.png", "sprite9_btn2.png")
	pButton4:setPosition(ccp(150, 240))
	pButton4:setUserTag(4)
	pButton4:setOnClickScriptHandler(func_on_click)
	pButton4:getLabel():setFontSize(30)
	pButton4:getLabel():setString("Remove Front")
	baseScene.window:addChild(pButton4)

	return baseScene.scene;
end





local _n_CListView_test_idx = 0;

local function get_CListView_test_scene()
	if _n_CListView_test_idx == 0 then
		return createCListViewBasicTest()
	elseif _n_CListView_test_idx == 1 then
		return createCListViewOperateTest()
	else
		_n_CListView_test_idx = 0;
		return createCListViewBasicTest()
	end
	return nil
end

function push_CListView_test_scene()
	_n_CListView_test_idx = 0;
	local scene = get_CListView_test_scene()
	_p_director:pushScene(scene)
end

func_next_CListView_test_scene = function()
	_n_CListView_test_idx = _n_CListView_test_idx + 1;
	local scene = get_CListView_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CListView_test_scene = function()
	_n_CListView_test_idx = _n_CListView_test_idx - 1;
	local scene = get_CListView_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CListView_test_scene = function()
	local scene = get_CListView_test_scene()
	_p_director:replaceScene(scene)
end




























