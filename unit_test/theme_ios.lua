-----------------------------------------------------------------------------------------
-- theme_ios.lua
-----------------------------------------------------------------------------------------
local modname = ...
local theme = {}
package.loaded[modname] = themeTable
local assetDir = "widget_ios"
local imageSuffix = display.imageSuffix or ""

-----------------------------------------------------------------------------------------
-- button
-----------------------------------------------------------------------------------------

theme.button = 
{
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	
	topLeftFrame = "button_topLeft",
	topLeftFrameOver =  "button_topLeftOver",
	middleLeftFrame = "button_middleLeft",
	middleLeftFrameOver = "button_middleLeftOver",
	bottomLeftFrame = "button_bottomLeft",
	bottomLeftFrameOver = "button_bottomLeftOver",
	
	topMiddleFrame = "button_topMiddle",
	topMiddleOverFrame = "button_topMiddleOver",
	middleFrame = "button_middle",
	middleOverFrame = "button_middleOver",
	bottomMiddleFrame = "button_bottomMiddle",
	bottomMiddleOverFrame = "button_bottomMiddleOver",
	
	topRightFrame = "button_topRight",
	topRightFrameOver = "button_topRightOver",
	middleRightFrame = "button_middleRight",
	middleRightOverFrame = "button_middleRightOver",
	bottomRightFrame = "button_bottomRight",
	bottomRightOverFrame = "button_bottomRightOver",
	
	width = 180, 
	height = 50,
	font = "Helvetica-Bold",
	fontSize = 20,
	labelColor = 
	{ 
		default = { 0, 0, 0 },
		over = { 0, 0, 0 },
	},
	embossedLabel = true,
}


-----------------------------------------------------------------------------------------
-- slider
-----------------------------------------------------------------------------------------

theme.slider = 
{
	-- default style
	width = 220, 
	height = 10,
	background = assetDir .. "/slider/sliderBg.png",
	fillImage = assetDir .. "/slider/sliderFill.png",
	fillWidth = 2, leftWidth = 16,
	handle = assetDir .. "/slider/handle.png",
	handleWidth = 32, handleHeight = 32,
	
	-- slider styles
	--[[
	small120 = 
	{
		width = 120, 10,
		background = assetDir .. "/slider/small120/sliderBg.png",
		fillImage = assetDir .. "/slider/sliderFill.png",
		fillWidth = 2, leftWidth = 16,
		handle = assetDir .. "/slider/handle.png",
		handleWidth = 32, handleHeight = 32
	},
	--]]
}

-----------------------------------------------------------------------------------------
-- pickerWheel
-----------------------------------------------------------------------------------------

theme.pickerWheel = 
{
	width = 296, height = 222,
	maskFile=assetDir .. "/pickerWheel/wheelmask.png",
	overlayImage=assetDir .. "/pickerWheel/overlay.png",
	overlayWidth=320, overlayHeight=222,
	bgImage=assetDir .. "/pickerWheel/bg.png",
	bgImageWidth=1, bgImageHeight=222,
	separator=assetDir .. "/pickerWheel/separator.png",
	separatorWidth=8, separatorHeight=1,
	font = "HelveticaNeue-Bold",
	fontSize = 22
}

-----------------------------------------------------------------------------------------
-- tabBar
-----------------------------------------------------------------------------------------

theme.tabBar =
{
	sheet = assetDir .. "/assets.png",
    data = assetDir .. ".assets",
	backgroundFrame = "tabBar_background",
	backgroundFrameWidth = 25,
	backgroundFrameHeight = 50,
	tabSelectedLeftFrame = "tabBar_tabSelectedLeftEdge",
	tabSelectedRightFrame = "tabBar_tabSelectedRightEdge",
	tabSelectedMiddleFrame = "tabBar_tabSelectedMiddle",
	tabSelectedFrameWidth = 10,
	tabSelectedFrameHeight = 50,
	tabSelectedFrame = "tabBar_tabSelected",
	iconInActiveFrame = "tabBar_iconInactive",
	iconActiveFrame = "tabBar_iconActive",
}

-----------------------------------------------------------------------------------------
-- spinner
-----------------------------------------------------------------------------------------

theme.spinner = 
{
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	startFrame = "spinner_spinner",
	width = 40,
	height = 40,
	incrementEvery = 50,
	deltaAngle = 30,
}

-----------------------------------------------------------------------------------------
-- switch
-----------------------------------------------------------------------------------------

theme.switch = 
{
	-- Default (on/off switch)
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	backgroundFrame = "switch_background",
	backgroundWidth = 165,
	backgroundHeight = 31,
	overlayFrame = "switch_overlay",
	overlayWidth = 83,
	overlayHeight = 31,
	handleDefaultFrame = "switch_handle",
	handleOverFrame = "switch_handleOver",
	mask = assetDir .. "/masks/switch/onOffMask.png",
	
	radio =
	{
		sheet = assetDir .. "/assets.png",
		data = assetDir .. ".assets",
		width = 33,
		height = 34,
		frameOff = "switch_radioButtonDefault",
		frameOn = "switch_radioButtonSelected",
	},
	checkbox = 
	{
		sheet = assetDir .. "/assets.png",
		data = assetDir .. ".assets",
		width = 33,
		height = 33,
		frameOff = "switch_checkboxDefault",
		frameOn = "switch_checkboxSelected",
	},
}

-----------------------------------------------------------------------------------------
-- stepper
-----------------------------------------------------------------------------------------

theme.stepper = 
{
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	defaultFrame = "stepper_nonActive",
	noMinusFrame = "stepper_noMinus",
	noPlusFrame = "stepper_noPlus",
	minusActiveFrame = "stepper_minusActive",
	plusActiveFrame = "stepper_plusActive",
	width = 102,
	height = 38,
}

-----------------------------------------------------------------------------------------
-- progressView
-----------------------------------------------------------------------------------------

theme.progressView = 
{
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	fillXOffset = 4.5,
	fillYOffset = 4,
	fillOuterWidth = 12,
	fillOuterHeight = 18,
	fillWidth = 12, 
	fillHeight = 10,
	
	fillOuterLeftFrame = "progressView_leftFillBorder",
	fillOuterMiddleFrame = "progressView_middleFillBorder",
	fillOuterRightFrame = "progressView_rightFillBorder",
	
	fillInnerLeftFrame = "progressView_leftFill",
	fillInnerMiddleFrame = "progressView_middleFill",
	fillInnerRightFrame = "progressView_rightFill",
}

-----------------------------------------------------------------------------------------
-- segmentedControl
-----------------------------------------------------------------------------------------

theme.segmentedControl = 
{
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	width = 12,
	height = 29,
	leftSegmentFrame = "segmentedControl_left",
	leftSegmentSelectedFrame = "segmentedControl_leftOn",
	rightSegmentFrame = "segmentedControl_right",
	rightSegmentSelectedFrame = "segmentedControl_rightOn",
	middleSegmentFrame = "segmentedControl_middle",
	middleSegmentSelectedFrame = "segmentedControl_middleOn",
	dividerFrame = "segmentedControl_divider",
}

-----------------------------------------------------------------------------------------
-- searchField
-----------------------------------------------------------------------------------------

theme.searchField = 
{
    sheet = assetDir .. "/assets.png",
    data = assetDir .. ".assets",
    leftFrame = "searchField_leftEdge",
	rightFrame = "searchField_rightEdge",
	middleFrame = "searchField_middle",
	magnifyingGlassFrame = "searchField_magnifyingGlass",
    cancelFrame = "searchField_remove",
    edgeWidth = 17.5,
    edgeHeight = 30,
	magnifyingGlassFrameWidth = 16,
	magnifyingGlassFrameHeight = 17,
    cancelFrameWidth = 19,
    cancelFrameHeight = 19,
	textFieldWidth = 145,
	textFieldHeight = 20,
}

return theme
