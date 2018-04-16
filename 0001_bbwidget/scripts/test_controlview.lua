require "base"

local func_next_CControlViewView_test_scene = nil
local func_back_CControlViewView_test_scene = nil
local func_ref_CControlViewView_test_scene = nil

-- createCControlViewViewBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCControlViewViewBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CControlViewView_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CControlViewView_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CControlViewView_test_scene()
	end)
	
	baseScene.setTitle("BBControlViewBasicTest")
	baseScene.setDescription("control the icon to move")
	
	local m_pIcon = nil
	
	local function on_control(sender, fx, fy)
		local x, y =  m_pIcon:getPosition()
		m_pIcon:setPosition(ccp(x + fx, fy + y))
	end

	m_pIcon = CCSprite:create("icon.png")
	m_pIcon:setPosition(ccp(480, 320))
	baseScene.window:addChild(m_pIcon)

	local pView = BBControlView:create("control_baseboard.png", "control_joystick.png")
	pView:setPosition(ccp(100, 100))
	pView:setRadius(pView:getContentSize().width / 2)
	pView:setOnControlScriptHandler(on_control)
	pView:setAnchorPoint(ccp(0,0))
	pView:setScale(1.5)
	pView:setOpacity(200)
	baseScene.window:addChild(pView)

	local pView2 = BBControlView:create()
	pView2:setBaseBoardImage("control_baseboard.png")
	pView2:setPosition(ccp(860, 100))
	pView2:setRadius(pView2:getContentSize().width / 2)
	pView2:setOnControlScriptHandler(on_control)
	pView2:setAnchorPoint(ccp(1, 0))
	pView2:setScale(1.5)
	pView2:setOpacity(200)
	baseScene.window:addChild(pView2)

	
	return baseScene.scene;
end




local _n_CControlViewView_test_idx = 0;

local function get_CControlViewView_test_scene()
	if _n_CControlViewView_test_idx == 0 then
		return createCControlViewViewBasicTest()
	else
		_n_CControlViewView_test_idx = 0;
		return createCControlViewViewBasicTest()
	end
	return nil
end

function push_CControlViewView_test_scene()
	_n_CControlViewView_test_idx = 0;
	local scene = get_CControlViewView_test_scene()
	_p_director:pushScene(scene)
end

func_next_CControlViewView_test_scene = function()
	_n_CControlViewView_test_idx = _n_CControlViewView_test_idx + 1;
	local scene = get_CControlViewView_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CControlViewView_test_scene = function()
	_n_CControlViewView_test_idx = _n_CControlViewView_test_idx - 1;
	local scene = get_CControlViewView_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CControlViewView_test_scene = function()
	local scene = get_CControlViewView_test_scene()
	_p_director:replaceScene(scene)
end




























