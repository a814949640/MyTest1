require "base"

local func_next_CTableView_test_scene = nil
local func_back_CTableView_test_scene = nil
local func_ref_CTableView_test_scene = nil

-- createCTableViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCTableViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CTableView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CTableView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CTableView_test_scene()
	end)
	
	baseScene.setTitle("BBTableViewBasicTest")
	baseScene.setDescription("TableView basic test")
	
	local function data_source(convertview, idx)
		local cell = tolua.cast(convertview, "BBTableViewCell")
		local btn = nil
		
		if cell == nil then
			cell = BBTableViewCell:new()
			cell:autorelease()

			btn = BBButton:createWith9Sprite(CCSizeMake(70, 70), "sprite9_btn1.png", "sprite9_btn2.png")
			btn:setPosition(ccp(74.0 / 2, 70.0 / 2))
			btn:getLabel():setFontSize(25.0)
			btn:setTag(1)
			cell:addChild(btn)
		else
			btn = tolua.cast(cell:getChildByTag(1), "BBButton")
		end
		
		btn:getLabel():setString(tostring(idx))
		btn:setUserTag(idx)
	
		return cell;
	end
	
	local aTable = BBTableView:create(CCSize(74.0 * 5, 70.0))
	aTable:setSizeOfCell(CCSize(74.0, 70.0))
	aTable:setCountOfCell(50)
	aTable:setDataSourceAdapterScriptHandler(data_source)
	aTable:setPosition(ccp(480, 320))
	baseScene.window:addChild(aTable)
	aTable:reloadData()

	
	return baseScene.scene;
end


local tab_data = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z"
}
-- createCTableViewBindingDataAndVertical
-- =====================================================
-- =====================================================
-- =====================================================
local function createCTableViewBindingDataAndVertical()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CTableView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CTableView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CTableView_test_scene()
	end)
	
	baseScene.setTitle("BBTableViewBindingDataAndVertical")
	baseScene.setDescription("binding data with table")
	
	
	local label = BBLabel:create()
	label:setAnchorPoint(ccp(0, 0.5))
	label:setPosition(ccp(200, 320))
	label:setFontSize(35.0)
	label:setString("click button")
	baseScene.window:addChild(label)
	
	local function on_click(sender)
		local btn = tolua.cast(sender, "BBButton")
		label:setString(tab_data[btn:getUserTag()])
	end
	
	local function data_source(convertview, idx)
		local cell = tolua.cast(convertview, "BBTableViewCell")
		local btn = nil
		
		if cell == nil then
			cell = BBTableViewCell:new()
			cell:autorelease()

			btn = BBButton:createWith9Sprite(CCSizeMake(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
			btn:setOnClickScriptHandler(on_click)
			btn:setPosition(ccp(150.0 / 2, 54.0 / 2))
			btn:getLabel():setFontSize(25.0)
			btn:setTag(1)
			cell:addChild(btn)
		else
			btn = tolua.cast(cell:getChildByTag(1), "BBButton")
		end
		
		btn:getLabel():setString(tab_data[idx + 1])
		btn:setUserTag(idx + 1)
	
		return cell;
	end
	
	local aTable = BBTableView:create(CCSize(150.0, 54.0 * 5))
	aTable:setCountOfCell(table.getn(tab_data))
	aTable:setSizeOfCell(CCSize(150.0, 54.0))
	aTable:setDataSourceAdapterScriptHandler(data_source)
	aTable:setDirection(eScrollViewDirectionVertical)
	aTable:setPosition(ccp(480, 320))
	baseScene.window:addChild(aTable)
	aTable:reloadData()
	
	
	return baseScene.scene;
end	


-- createCTableViewReloadTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCTableViewReloadTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CTableView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CTableView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CTableView_test_scene()
	end)
	
	baseScene.setTitle("BBTableViewReloadTest")
	baseScene.setDescription("click button will pop a string into vector and reload\n table with auto relocate")
	
	
	
	local v_datas = {
		"First"
	};
	
	local idx = 1;
	local aTable;
	
	function on_click(sender)
		if idx >= table.getn(tab_data) + 1 then
			return;
		end
		
		v_datas[table.getn(v_datas) + 1] = tab_data[idx];
		idx = idx + 1;
		aTable:setCountOfCell(table.getn(v_datas))
		aTable:reloadData()
		aTable:setContentOffset(ccp(aTable:getMaxOffset().x, aTable:getMaxOffset().y))
	end
	
	local function data_source(convertview, idx)
		local cell = tolua.cast(convertview, "BBTableViewCell")
		local btn = nil
		
		if cell == nil then
			cell = BBTableViewCell:new()
			cell:autorelease()

			btn = BBButton:createWith9Sprite(CCSizeMake(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
			btn:setPosition(ccp(150.0 / 2, 54.0 / 2))
			btn:getLabel():setFontSize(25.0)
			btn:setTag(1)
			cell:addChild(btn)
		else
			btn = tolua.cast(cell:getChildByTag(1), "BBButton")
		end
		
		btn:getLabel():setString(v_datas[idx + 1])
		btn:setUserTag(idx + 1)
	
		return cell;
	end
	
	aTable = BBTableView:create(CCSize(150.0, 54.0 * 5))
	aTable:setCountOfCell(table.getn(v_datas))
	aTable:setSizeOfCell(CCSize(150.0, 54.0))
	aTable:setDataSourceAdapterScriptHandler(data_source)
	aTable:setDirection(eScrollViewDirectionVertical)
	aTable:setAutoRelocate(true)
	aTable:setPosition(ccp(480, 320))
	baseScene.window:addChild(aTable)
	aTable:reloadData()

	local pButton = BBButton:createWith9Sprite(CCSizeMake(150, 50), "sprite9_btn1.png", "sprite9_btn2.png")
	pButton:setOnClickScriptHandler(on_click)
	pButton:setPosition(ccp(200, 320))
	pButton:getLabel():setFontSize(25.0)
	pButton:getLabel():setString("reloadData")
	baseScene.window:addChild(pButton)
	
	
	return baseScene.scene;
end	



local _n_CTableView_test_idx = 0;

local function get_CTableView_test_scene()
	if _n_CTableView_test_idx == 0 then
		return createCTableViewBasicTest()
	elseif _n_CTableView_test_idx == 1 then
		return createCTableViewBindingDataAndVertical()
	elseif _n_CTableView_test_idx == 2 then
		return createCTableViewReloadTest()
	else
		_n_CTableView_test_idx = 0;
		return createCTableViewBasicTest()
	end
	return nil
end

function push_CTableView_test_scene()
	_n_CTableView_test_idx = 0;
	local scene = get_CTableView_test_scene()
	_p_director:pushScene(scene)
end

func_next_CTableView_test_scene = function()
	_n_CTableView_test_idx = _n_CTableView_test_idx + 1;
	local scene = get_CTableView_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CTableView_test_scene = function()
	_n_CTableView_test_idx = _n_CTableView_test_idx - 1;
	local scene = get_CTableView_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CTableView_test_scene = function()
	local scene = get_CTableView_test_scene()
	_p_director:replaceScene(scene)
end




























