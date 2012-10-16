-----------------------------------------------------------------------------------------
--
-- theme_ios.lua
--
-----------------------------------------------------------------------------------------
local modname = ...
local themeTable = {}
package.loaded[modname] = themeTable
local assetDir = "widget_ios"
local imageSuffix = display.imageSuffix or ""

-----------------------------------------------------------------------------------------
--
-- button
--
-----------------------------------------------------------------------------------------
--
-- specify a "style" option to use different button styles on a per-button basis
--
-- example:
-- local button = widget.newButton{ style="blue1Small" }
--
-- NOTE: using a "style" is not required (default options will be used).
--
-----------------------------------------------------------------------------------------

themeTable.button = {
	-- if no style is specified, will use default:
	default = assetDir .. "/button/default.png",
	over = assetDir .. "/button/over.png",
	width = 278, height = 46,
	font = "Helvetica-Bold",
	fontSize = 20,
	labelColor = { default={0}, over={255} },
	emboss = true,
	
	-- button styles
	
	blue1Small = {
		default = assetDir .. "/button/blue1Small/default.png",
		over = assetDir .. "/button/blue1Small/over.png",
		width = 60, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	blue1Large = {
		default = assetDir .. "/button/blue1Large/default.png",
		over = assetDir .. "/button/blue1Large/over.png",
		width = 90, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	blue2Small = {
		default = assetDir .. "/button/blue2Small/default.png",
		over = assetDir .. "/button/blue2Small/over.png",
		width = 60, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	blue2Large = {
		default = assetDir .. "/button/blue2Large/default.png",
		over = assetDir .. "/button/blue2Large/over.png",
		width = 90, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	blackSmall = {
		default = assetDir .. "/button/blackSmall/default.png",
		over = assetDir .. "/button/blackSmall/over.png",
		width = 60, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	blackLarge = {
		default = assetDir .. "/button/blackLarge/default.png",
		over = assetDir .. "button/blackLarge/over.png",
		width = 90, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	redSmall = {
		default = assetDir .. "/button/redSmall/default.png",
		over = assetDir .. "/button/redSmall/over.png",
		width = 60, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	redLarge = {
		default = assetDir .. "/button/redLarge/default.png",
		over = assetDir .. "/button/redLarge/over.png",
		width = 90, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	backSmall = {
		default = assetDir .. "/button/backSmall/default.png",
		over = assetDir .. "/button/backSmall/over.png",
		width = 60, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	backLarge = {
		default = assetDir .. "/button/backLarge/default.png",
		over = assetDir .. "/button/backLarge/over.png",
		width = 90, height = 30,
		font = "HelveticaNeue-Bold",
		fontSize = 12,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	sheetGreen = {
		default = assetDir .. "/button/sheetGreen/default.png",
		over = assetDir .. "button/sheetGreen/over.png",
		width = 278, height = 46,
		font = "HelveticaNeue-Bold",
		fontSize = 20,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	sheetRed = {
		default = assetDir .. "/button/sheetRed/default.png",
		over = assetDir .. "/button/sheetRed/over.png",
		width = 278, height = 46,
		font = "HelveticaNeue-Bold",
		fontSize = 20,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	sheetBlack = {
		default = assetDir .. "/button/sheetBlack/default.png",
		over = assetDir .. "/button/sheetBlack/over.png",
		width = 278, height = 46,
		font = "HelveticaNeue-Bold",
		fontSize = 20,
		labelColor = { default={255}, over={255} },
		emboss = true,
	},
	
	sheetYellow = {
		default = assetDir .. "/button/sheetYellow/default.png",
		over = assetDir .. "/button/sheetYellow/over.png",
		width = 278, height = 46,
		font = "HelveticaNeue-Bold",
		fontSize = 20,
		labelColor = { default={255}, over={255} },
		emboss = true,
	}
}


-----------------------------------------------------------------------------------------
--
-- slider
--
-----------------------------------------------------------------------------------------

themeTable.slider = {
	-- default style
	width = 220, height = 10,
	background = assetDir .. "/slider/sliderBg.png",
	fillImage = assetDir .. "/slider/sliderFill.png",
	fillWidth = 2, leftWidth = 16,
	handle = assetDir .. "/slider/handle.png",
	handleWidth = 32, handleHeight = 32,
	
	-- slider styles
	
	small120 = {
		width = 120, 10,
		background = assetDir .. "/slider/small120/sliderBg.png",
		fillImage = assetDir .. "/slider/sliderFill.png",
		fillWidth = 2, leftWidth = 16,
		handle = assetDir .. "/slider/handle.png",
		handleWidth = 32, handleHeight = 32
	}
}

-----------------------------------------------------------------------------------------
--
-- pickerWheel
--
-----------------------------------------------------------------------------------------

themeTable.pickerWheel = {
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
--
-- spinner
--
-----------------------------------------------------------------------------------------

themeTable.spinner = 
{
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	start = "spinner_spinner",
	width = 40,
	height = 40,
	incrementEvery = 50,
	deltaAngle = 30,
}


-----------------------------------------------------------------------------------------
--
-- switch
--
-----------------------------------------------------------------------------------------

themeTable.switch = 
{
	-- Default (on/off switch)
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	background = "switch_background",
	backgroundWidth = 165,
	backgroundHeight = 31,
	overlay = "switch_overlay",
	overlayWidth = 83,
	overlayHeight = 31,
	handle = "switch_handle",
	handleOver = "switch_handleOver",
	switchType = "onOff",
	mask = assetDir .. "/masks/switch/onOffMask.png",
	
	radio =
	{
		sheet = assetDir .. "/assets.png",
		data = assetDir .. ".assets",
		width = 33,
		height = 34,
		defaultFrame = "switch_radioButtonDefault",
		selectedFrame = "switch_radioButtonSelected",
		switchType = "radio",
	},
	checkbox = 
	{
		sheet = assetDir .. "/assets.png",
		data = assetDir .. ".assets",
		width = 33,
		height = 33,
		defaultFrame = "switch_checkboxDefault",
		selectedFrame = "switch_checkboxSelected",
		switchType = "checkbox",
	},
}

-----------------------------------------------------------------------------------------
--
-- stepper
--
-----------------------------------------------------------------------------------------

themeTable.stepper = 
{
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	default = "stepper_nonActive",
	noMinus = "stepper_noMinus",
	noPlus = "stepper_noPlus",
	minusActive = "stepper_minusActive",
	plusActive = "stepper_plusActive",
	width = 102,
	height = 38,
}

-----------------------------------------------------------------------------------------
--
-- searchField
--
-----------------------------------------------------------------------------------------

themeTable.searchField = 
{
	sheet = assetDir .. "/assets.png",
	data = assetDir .. ".assets",
	defaultFrame = "searchField_bar",
	cancelFrame = "searchField_remove",
	defaultFrameWidth = 207,
	defaultFrameHeight = 33,
	cancelFrameWidth = 19,
	cancelFrameHeight = 19,
}

-----------------------------------------------------------------------------------------

return themeTable