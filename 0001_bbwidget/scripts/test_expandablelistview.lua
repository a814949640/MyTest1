require "base"

local func_next_CExpandableListView_test_scene = nil
local func_back_CExpandableListView_test_scene = nil
local func_ref_CExpandableListView_test_scene = nil

-- createCExpandableListViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCExpandableListViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CExpandableListView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CExpandableListView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CExpandableListView_test_scene()
	end)
	
	baseScene.setTitle("BBExpandableListViewBasicTest")
	baseScene.setDescription("click item to expand")
	
	local pListView = nil
	
	local function onClick(psender)
		local pButton = tolua.cast(psender, "BBButton")
		pListView:collapse(pButton:getUserTag())
		pListView:reloadData()
	end
	
	pListView = BBExpandableListView:create(CCSize(320, 390))
	pListView:setBackgroundImage("background2.png")
	pListView:setPosition(ccp(480, 320))
	baseScene.window:addChild(pListView)

	for i = 0, 10, 1 do
		local pExpandableNode = BBExpandableNode:create()
		pExpandableNode:setContentSize(CCSize(320, 50))
		pListView:insertExpandableNodeAtLast(pExpandableNode)

		local pExpandableNodeBg = BBImageViewScale9:create(CCSize(320, 45), "expandnodebg.png")
		pExpandableNodeBg:setPosition(ccp(320/2, 50/2))
		pExpandableNode:addChild(pExpandableNodeBg)

		local pColBtn = BBButton:createWith9Sprite(CCSize(35, 35), "sprite9_btn1.png", "sprite9_btn2.png")
		pColBtn:setPosition(ccp(320 - 30, 50 / 2))
		pColBtn:setText("-")
		pColBtn:setUserTag(i)
		pColBtn:setOnClickScriptHandler(onClick)
		pExpandableNode:addChild(pColBtn)

		local pTitleLabel = BBLabel:create(string.format("ExpandableNode : %d",i), "", 28)
		pTitleLabel:setPosition(ccp(10, 50/2))
		pTitleLabel:setAnchorPoint(ccp(0, 0.5))
		pExpandableNode:addChild(pTitleLabel)

		pExpandableNode:insertItemNodeAtLast(BBLabel:create(string.format("Label %d - 1", i), "", 30))
		pExpandableNode:insertItemNodeAtLast(BBLabel:create(string.format("Label %d - 2", i), "", 30))
		pExpandableNode:insertItemNodeAtLast(BBLabel:create(string.format("Label %d - 3", i), "", 30))
		
		local pButton = BBButton:createWith9Sprite(CCSize(150, 38), "sprite9_btn1.png", "sprite9_btn2.png")
		pButton:setOnClickScriptHandler(onClick)
		pButton:initText("collapse", "", 28)
		pButton:setUserTag(i)
		pButton:setPosition(ccp(100, 40/2))
		local pBtnLayout = BBLayout:create(CCSize(320, 40))
		pBtnLayout:addChild(pButton)
		pExpandableNode:insertItemNodeAtLast(pBtnLayout)
	end

	pListView:reloadData()
	
	return baseScene.scene;
end






local _n_CExpandableListView_test_idx = 0;

local function get_CExpandableListView_test_scene()
	if _n_CExpandableListView_test_idx == 0 then
		return createCExpandableListViewBasicTest()
	else
		_n_CExpandableListView_test_idx = 0;
		return createCExpandableListViewBasicTest()
	end
	return nil
end

function push_CExpandableListView_test_scene()
	_n_CExpandableListView_test_idx = 0;
	local scene = get_CExpandableListView_test_scene()
	_p_director:pushScene(scene)
end

func_next_CExpandableListView_test_scene = function()
	_n_CExpandableListView_test_idx = _n_CExpandableListView_test_idx + 1;
	local scene = get_CExpandableListView_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CExpandableListView_test_scene = function()
	_n_CExpandableListView_test_idx = _n_CExpandableListView_test_idx - 1;
	local scene = get_CExpandableListView_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CExpandableListView_test_scene = function()
	local scene = get_CExpandableListView_test_scene()
	_p_director:replaceScene(scene)
end




























