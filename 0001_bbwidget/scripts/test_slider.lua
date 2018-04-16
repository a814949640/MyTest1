require "base"

local func_next_CSlider_test_scene = nil
local func_back_CSlider_test_scene = nil
local func_ref_CSlider_test_scene = nil
--
-- createCSliderBasicTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCSliderBasicTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CSlider_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CSlider_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CSlider_test_scene()
	end)
	
	baseScene.setTitle("BBSliderBasicTest")
	baseScene.setDescription("Slider From ProgressBar in vertical direction")
	
	local m_pSlider = nil
	
	local label = BBLabel:create()
	label:setAnchorPoint(ccp(0, 0.5))
	label:setPosition(ccp(380, 400))
	label:setFontSize(35.0)
	label:setString("none")
	baseScene.window:addChild(label)
	
	local function on_value_changing(sender, n_value)
		label:setString(string.format("value %d, percentage %f", m_pSlider:getValue(), m_pSlider:getPercentage()))
	end

	m_pSlider = BBSlider:create("slider.png", "progress_v.png")
	m_pSlider:setBackgroundImage("progress_v_bg.png")
	m_pSlider:setPosition(ccp(130, 320))
	m_pSlider:setMaxValue(100)
	m_pSlider:setMinValue(0)
	m_pSlider:setDirection(eProgressBarDirectionBottomToTop)
	m_pSlider:setOnValueChangedScriptHandler(on_value_changing)
	baseScene.window:addChild(m_pSlider)
	
	return baseScene.scene;
end


-- createCSliderWithScrollTest
-- =====================================================
-- =====================================================
-- =====================================================
local function createCSliderWithScrollTest()
	local baseScene = createScene()
	--next
	baseScene.btnNext:setOnClickScriptHandler(function(sender)
		func_next_CSlider_test_scene()
	end)
	--back
	baseScene.btnBack:setOnClickScriptHandler(function(sender)
		func_back_CSlider_test_scene()
	end)
	--ref
	baseScene.btnRef:setOnClickScriptHandler(function(sender)
		func_ref_CSlider_test_scene()
	end)
	
	baseScene.setTitle("BBSliderWithScrollTest")
	baseScene.setDescription("Slider With ScrollView")
	
	
	local m_pScrollView = BBScrollView:create(CCSize(480, 320))
	m_pScrollView:setBackgroundImage("background.png")
	m_pScrollView:setContainerSize(CCSize(3100, 320))
	m_pScrollView:setDirection(eScrollViewDirectionHorizontal)
	m_pScrollView:setPosition(ccp(480, 350))
	m_pScrollView:setDragable(false)
	baseScene.window:addChild(m_pScrollView)

	local x = 100.0;
	for i = 0, 29, 1 do
		local pIcon = BBButton:createWith9Sprite(CCSize(60, 60), "sprite9_btn1.png", "sprite9_btn2.png")
		pIcon:getLabel():setFontSize(25)
		pIcon:getLabel():setString(tostring(i + 1))
		pIcon:setPosition(ccp( x , 160 ))
		m_pScrollView:getContainer():addChild(pIcon)
		x = x + 100.0;
	end
	
	local function on_value_changing(sender, n_value)
		m_pScrollView:setContentOffset(ccp((-n_value), 0))
	end

	m_pSlider = BBSlider:create()
	m_pSlider:setSliderImage("slider.png")
	m_pSlider:setProgressImage("progress.png")
	m_pSlider:setBackgroundImage("progress_bg.png")

	m_pSlider:setPosition(ccp(480, 140))
	m_pSlider:setMaxValue( m_pScrollView:getContainer():getContentSize().width - m_pScrollView:getContentSize().width )
	m_pSlider:setMinValue(0)
	m_pSlider:setValue(0)
	m_pSlider:setOnValueChangedScriptHandler(on_value_changing)
	baseScene.window:addChild(m_pSlider)

	return baseScene.scene;
end



local _n_CSlider_test_idx = 0;

local function get_CSlider_test_scene()
	if _n_CSlider_test_idx == 0 then
		return createCSliderBasicTest()
	elseif _n_CSlider_test_idx == 1 then
		return createCSliderWithScrollTest()
	else
		_n_CSlider_test_idx = 0;
		return createCSliderBasicTest()
	end
	return nil
end

function push_CSlider_test_scene()
	_n_CSlider_test_idx = 0;
	local scene = get_CSlider_test_scene()
	_p_director:pushScene(scene)
end

func_next_CSlider_test_scene = function()
	_n_CSlider_test_idx = _n_CSlider_test_idx + 1;
	local scene = get_CSlider_test_scene()
	_p_director:replaceScene(scene)
end

func_back_CSlider_test_scene = function()
	_n_CSlider_test_idx = _n_CSlider_test_idx - 1;
	local scene = get_CSlider_test_scene()
	_p_director:replaceScene(scene)
end

func_ref_CSlider_test_scene = function()
	local scene = get_CSlider_test_scene()
	_p_director:replaceScene(scene)
end




























