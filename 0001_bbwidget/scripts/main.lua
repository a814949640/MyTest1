require "base"
require "test_button"
require "test_toggleview"
require "test_label"
require "test_scrollview"
require "test_tableview"
require "test_gridpageview"
require "test_gridview"
require "test_layout"
require "test_pageview"
require "test_listview"
require "test_checkbox"
require "test_controlview"
require "test_progressbar"
require "test_slider"
require "test_textrich"
require "test_expandablelistview"
require "test_draworder"

CCFileUtils:sharedFileUtils():addSearchPath("res/")

local _tab_menu_items = {
	"Button Test",
	"ToggleView Test",
	"Label Test",
	"ScrollView Test",
	"TableView Test",
	"PageGridView Test",
	"GridView Test",
	"Layout Test",
	"PageView Test",
	"ListView Test",
	"CheckBox Test",
	"ControlView Test",
	"ProgressBar Test",
	"Slider Test",
	"TextRich Test",
	"ExpandableListView Test",
	"DrawOrder Dispatch Test"
}

function main()
	local scene = CCScene:create()
	_p_director:runWithScene(scene)
	
	local window = BBWidgetWindow:create()
	window:setMultiTouchEnabled(false)
	scene:addChild(window)
	
	local function on_table_view_item_clicked(sender)
		local target = tolua.cast(sender, "BBLabel")
		local idx = target:getUserTag() + 1;
		
		if idx == 1 then
			push_CButton_test_scene()
		elseif idx == 2 then
			push_CToggleView_test_scene()
		elseif idx == 3 then
			push_CLabel_test_scene()
		elseif idx == 4 then
			push_CScrollView_test_scene()
		elseif idx == 5 then
			push_CTableView_test_scene()
		elseif idx == 6 then
			push_CGridPageView_test_scene()
		elseif idx == 7 then
			push_CGridView_test_scene()
		elseif idx == 8 then
			push_CLayout_test_scene()
		elseif idx == 9 then
			push_CPageView_test_scene()
		elseif idx == 10 then
			push_CListView_test_scene()
		elseif idx == 11 then 
			push_CCheckBox_test_scene()
		elseif idx == 12 then
			push_CControlViewView_test_scene()
		elseif idx == 13 then
			push_CProgressBar_test_scene()
		elseif idx == 14 then
			push_CSlider_test_scene()
		elseif idx == 15 then
			push_CTextRich_test_scene()
		elseif idx == 16 then
			push_CExpandableListView_test_scene()
		elseif idx == 17 then
			push_DrawOrderTest_test_scene()
		end
	end
	
	local function on_table_view_item_touchbegan(sender, p_touch)
		local target = tolua.cast(sender, "BBLabel")
		target:stopActionByTag(1)
		local p_scale_to = CCScaleTo:create(0.1, 1.3)
		p_scale_to:setTag(1)
		target:runAction(p_scale_to)
		return eWidgetTouchTransient;
	end
	
	local function on_table_view_item_touchended(sender, p_touch, duration)
		local target = tolua.cast(sender, "BBLabel")
		target:stopActionByTag(1)
		local p_scale_to = CCScaleTo:create(0.1, 1.0)
		p_scale_to:setTag(1)
		target:runAction(p_scale_to)
		return true;
	end
	
	local function table_view_data_source(p_obj, idx)
		local cell = tolua.cast(p_obj, "BBTableViewCell")
		local p_text = nil
		
		if cell == nil 
		then
			cell = BBTableViewCell:new()
			cell:autorelease()
			
			p_text = BBLabel:create()
			p_text:setFontSize(40)
			p_text:setPosition(ccp(350, 50))
			p_text:setTouchEnabled(true)
			p_text:setOnTouchBeganScriptHandler(on_table_view_item_touchbegan)
			p_text:setOnTouchEndedScriptHandler(on_table_view_item_touchended)
			p_text:setOnTouchCancelledScriptHandler(on_table_view_item_touchended)
			p_text:setOnClickScriptHandler(on_table_view_item_clicked)
			p_text:setTag(1)
			cell:addChild(p_text)
		else
			p_text = tolua.cast(cell:getChildByTag(1), "BBLabel")
		end
		
		p_text:setUserTag(idx)
		p_text:setString(tostring(_tab_menu_items[idx + 1]))
		
		return cell;
	end
	
	local p_table_view = BBTableView:create(CCSizeMake(700, 640))
	p_table_view:setDataSourceAdapterScriptHandler(table_view_data_source)
	p_table_view:setCountOfCell(table.getn(_tab_menu_items))
	p_table_view:setSizeOfCell(CCSizeMake(700, 100))
	p_table_view:setBounceable(true)
	p_table_view:setDirection(eScrollViewDirectionVertical)
	p_table_view:setPosition(ccp(480, 320))
	window:addChild(p_table_view)
	p_table_view:reloadData()
	

end

main()