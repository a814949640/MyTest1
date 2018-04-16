require "base"

local func_next_CGridView_test_scene = nil
local func_back_CGridView_test_scene = nil
local func_ref_CGridView_test_scene = nil

-- createCGridViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCGridViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CGridView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CGridView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CGridView_test_scene()
	end)
	
	baseScene.setTitle("BBGridViewBasicTest")
	baseScene.setDescription("GridView basic test (only work in vertical)")
	
	local function data_source(convertview, idx)
		local pCell = tolua.cast(convertview,"BBGridViewCell")
		local pButton = nil

		if pCell == nil then
			pCell = BBGridViewCell:new()
			pCell:autorelease()

			pButton = BBButton:createWith9Sprite(CCSizeMake(70, 70), "sprite9_btn1.png", "sprite9_btn2.png")
			pButton:setPosition(ccp(480 / 5 / 2, 320 / 4 / 2))
			pButton:getLabel():setFontSize(25.0)
			pButton:setTag(1)
			pCell:addChild(pButton)
		else
			pButton = tolua.cast(pCell:getChildByTag(1), "BBButton")
		end

		pButton:getLabel():setString(tostring(idx))
		pButton:setUserTag(idx)

		return pCell;
	end

	
	local pBg = CCSprite:create("background.png")
	pBg:setPosition(ccp(480, 320))
	baseScene.window:addChild(pBg)

	local pGridView = BBGridView:create(CCSize(480, 320))
	pGridView:setSizeOfCell(CCSize(480 / 5, 320 / 4))
	pGridView:setCountOfCell(96)
	pGridView:setDataSourceAdapterScriptHandler(data_source)
	pGridView:setColumns(5)
	pGridView:setPosition(ccp(480, 320))
	baseScene.window:addChild(pGridView)
	pGridView:setAutoRelocate(true)
	pGridView:reloadData()
	
	return baseScene.scene;
end






local _n_CGridView_test_idx = 0;

local function get_CGridView_test_scene()
	if _n_CGridView_test_idx == 0 then
		return createCGridViewBasicTest()
	else
		_n_CGridView_test_idx = 0;
		return createCGridViewBasicTest()
	end
	return nil
end

function push_CGridView_test_scene()
	_n_CGridView_test_idx = 0;
	local scene = get_CGridView_test_scene()
	_p_director:pushScene(scene)
end

func_next_CGridView_test_scene = function()
	_n_CGridView_test_idx = _n_CGridView_test_idx + 1;
	local scene = get_CGridView_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CGridView_test_scene = function()
	_n_CGridView_test_idx = _n_CGridView_test_idx - 1;
	local scene = get_CGridView_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CGridView_test_scene = function()
	local scene = get_CGridView_test_scene()
	_p_director:replaceScene(scene)
end




























