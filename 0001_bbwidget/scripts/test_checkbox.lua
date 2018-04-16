require "base"

local func_next_CCheckBox_test_scene = nil
local func_back_CCheckBox_test_scene = nil
local func_ref_CCheckBox_test_scene = nil

-- createCCheckBoxBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCCheckBoxBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CCheckBox_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CCheckBox_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CCheckBox_test_scene()
	end)
	
	baseScene.setTitle("BBCheckBoxBasicTest")
	baseScene.setDescription("checkbox face, click it")
	
	local label = BBLabel:create()
	label:setAnchorPoint(ccp(0, 0.5))
	label:setPosition(ccp(380, 400))
	label:setFontSize(35.0)
	label:setString("none")
	baseScene.window:addChild(label)
	
	local function onClick(sender)
		local pCheckBox = tolua.cast(sender, "BBCheckBox")
		if pCheckBox:isChecked() then
			label:setString("checked")
		else
			label:setString("unchecked")
		end
	end
	
	local pCheckBox = BBCheckBox:create()
	pCheckBox:setNormalImage("ckb_normal_01.png")
	pCheckBox:setNormalPressImage("ckb_normal_02.png")
	pCheckBox:setCheckedImage("ckb_selected_01.png")
	pCheckBox:setCheckedPressImage("ckb_selected_02.png")
	pCheckBox:setDisabledNormalImage("ckb_disable_01.png")
	pCheckBox:setDisabledCheckedImage("ckb_disable_02.png")
	pCheckBox:setOnClickScriptHandler(onClick)
	pCheckBox:setPosition(ccp(480, 320))
	baseScene.window:addChild(pCheckBox)

	local pCheckBox2 = BBCheckBox:create()
	pCheckBox2:setNormalImage("ckb_normal_01.png")
	pCheckBox2:setCheckedImage("ckb_selected_01.png")
	pCheckBox2:setOnClickScriptHandler(onClick)
	pCheckBox2:setPosition(ccp(560, 320))
	baseScene.window:addChild(pCheckBox2)
	
	return baseScene.scene;
end


-- createCCheckBoxExclusionTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCCheckBoxExclusionTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CCheckBox_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CCheckBox_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CCheckBox_test_scene()
	end)
	
	baseScene.setTitle("BBCheckBoxExclusionTest")
	baseScene.setDescription("checkbox exclusion test")
	
	local pCheckBox1 = BBCheckBox:create()
	pCheckBox1:setNormalImage("ckb_normal_01.png")
	pCheckBox1:setNormalPressImage("ckb_normal_02.png")
	pCheckBox1:setCheckedImage("ckb_selected_01.png")
	pCheckBox1:setCheckedPressImage("ckb_selected_02.png")
	pCheckBox1:setDisabledNormalImage("ckb_disable_01.png")
	pCheckBox1:setDisabledCheckedImage("ckb_disable_02.png")
	pCheckBox1:setPosition(ccp(480, 490))
	pCheckBox1:setTag(1)
	pCheckBox1:setExclusion(1)
	pCheckBox1:setChecked(true)
	pCheckBox1:setEnabled(false)
	baseScene.window:addChild(pCheckBox1)
	
	local pCheckBox2 = BBCheckBox:create()
	pCheckBox2:setNormalImage("ckb_normal_01.png")
	pCheckBox2:setNormalPressImage("ckb_normal_02.png")
	pCheckBox2:setCheckedImage("ckb_selected_01.png")
	pCheckBox2:setCheckedPressImage("ckb_selected_02.png")
	pCheckBox2:setDisabledNormalImage("ckb_disable_01.png")
	pCheckBox2:setDisabledCheckedImage("ckb_disable_02.png")
	pCheckBox2:setPosition(ccp(480, 425))
	pCheckBox2:setExclusion(1)
	baseScene.window:addChild(pCheckBox2)
	
	local pCheckBox3 = BBCheckBox:create()
	pCheckBox3:setNormalImage("ckb_normal_01.png")
	pCheckBox3:setNormalPressImage("ckb_normal_02.png")
	pCheckBox3:setCheckedImage("ckb_selected_01.png")
	pCheckBox3:setCheckedPressImage("ckb_selected_02.png")
	pCheckBox3:setDisabledNormalImage("ckb_disable_01.png")
	pCheckBox3:setDisabledCheckedImage("ckb_disable_02.png")
	pCheckBox3:setPosition(ccp(480, 360))
	pCheckBox3:setExclusion(1)
	baseScene.window:addChild(pCheckBox3)
	
	local pCheckBox4 = BBCheckBox:create()
	pCheckBox4:setNormalImage("ckb_normal_01.png")
	pCheckBox4:setNormalPressImage("ckb_normal_02.png")
	pCheckBox4:setCheckedImage("ckb_selected_01.png")
	pCheckBox4:setCheckedPressImage("ckb_selected_02.png")
	pCheckBox4:setDisabledNormalImage("ckb_disable_01.png")
	pCheckBox4:setDisabledCheckedImage("ckb_disable_02.png")
	pCheckBox4:setPosition(ccp(480, 295))
	pCheckBox4:setExclusion(1)
	baseScene.window:addChild(pCheckBox4)
	
	local pCheckBox5 = BBCheckBox:create()
	pCheckBox5:setNormalImage("ckb_normal_01.png")
	pCheckBox5:setNormalPressImage("ckb_normal_02.png")
	pCheckBox5:setCheckedImage("ckb_selected_01.png")
	pCheckBox5:setCheckedPressImage("ckb_selected_02.png")
	pCheckBox5:setDisabledNormalImage("ckb_disable_01.png")
	pCheckBox5:setDisabledCheckedImage("ckb_disable_02.png")
	pCheckBox5:setPosition(ccp(480, 230))
	pCheckBox5:setExclusion(1)
	baseScene.window:addChild(pCheckBox5)
	
	local pCheckBox6 = BBCheckBox:create()
	pCheckBox6:setNormalImage("ckb_normal_01.png")
	pCheckBox6:setNormalPressImage("ckb_normal_02.png")
	pCheckBox6:setCheckedImage("ckb_selected_01.png")
	pCheckBox6:setCheckedPressImage("ckb_selected_02.png")
	pCheckBox6:setDisabledNormalImage("ckb_disable_01.png")
	pCheckBox6:setDisabledCheckedImage("ckb_disable_02.png")
	pCheckBox6:setPosition(ccp(480, 165))
	pCheckBox6:setExclusion(1)
	baseScene.window:addChild(pCheckBox6)
	
	local function on_click(sender)
		pCheckBox1:setChecked(true)
	end
	
	local pButton = BBButton:createWith9Sprite(CCSize(280, 60), "sprite9_btn1.png", "sprite9_btn2.png")
	pButton:setPosition(ccp(200, 450))
	pButton:setUserTag(1)
	pButton:setOnClickScriptHandler(on_click)
	pButton:getLabel():setFontSize(30)
	pButton:getLabel():setString("set true for first")
	baseScene.window:addChild(pButton)
	
	return baseScene.scene;
end





local _n_CCheckBox_test_idx = 0;

local function get_CCheckBox_test_scene()
	if _n_CCheckBox_test_idx == 0 then
		return createCCheckBoxBasicTest()
	elseif _n_CCheckBox_test_idx == 1 then
		return createCCheckBoxExclusionTest()
	else
		_n_CCheckBox_test_idx = 0;
		return createCCheckBoxBasicTest()
	end
	return nil
end

function push_CCheckBox_test_scene()
	_n_CCheckBox_test_idx = 0;
	local scene = get_CCheckBox_test_scene()
	_p_director:pushScene(scene)
end

func_next_CCheckBox_test_scene = function()
	_n_CCheckBox_test_idx = _n_CCheckBox_test_idx + 1;
	local scene = get_CCheckBox_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CCheckBox_test_scene = function()
	_n_CCheckBox_test_idx = _n_CCheckBox_test_idx - 1;
	local scene = get_CCheckBox_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CCheckBox_test_scene = function()
	local scene = get_CCheckBox_test_scene()
	_p_director:replaceScene(scene)
end




























