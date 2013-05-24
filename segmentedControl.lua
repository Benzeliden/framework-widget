-- Copyright (C) 2013 Corona Inc. All Rights Reserved.
-- File: newSegmentedControl unit test.

local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local USE_ANDROID_THEME = false

--Forward reference for test function timer
local testTimer = nil

function scene:createScene( event )
	local group = self.view
	
	-- Test android theme
	if USE_ANDROID_THEME then
		widget.setTheme( "widget_theme_android" )
	end
	
	--Display an iOS style background
	local background = display.newImage( "unitTestAssets/background.png" )
	group:insert( background )
	
	--Button to return to unit test listing
	local returnToListing = widget.newButton{
	    id = "returnToListing",
	    left = 60,
	    top = 10,
	    label = "Return To Menu",
	    width = 200, height = 52,
	    cornerRadius = 8,
	    onRelease = function() storyboard.gotoScene( "unitTestListing" ) end;
	}
	group:insert( returnToListing )
	
	----------------------------------------------------------------------------------------------------------------
	--										START OF UNIT TEST
	----------------------------------------------------------------------------------------------------------------
	
	--Toggle these defines to execute automated tests.
	local TEST_REMOVE_SEGMENTED_CONTROL = false
	local TEST_DELAY = 1000
	
	local currentSegment = display.newEmbossedText( "You selected: ", 40, 200, native.systemFontBold, 18 )
	group:insert( currentSegment )
	
	local function onPress( event )
	--	print( "Segment no:", event.target.segmentNumber )
		--print( "Segment label:", event.target.segmentLabel )
		
		currentSegment:setText( "You selected: " .. event.target.segmentLabel )
	end
	
	-- Create a new progress view object
	local newSegmentedControl = widget.newSegmentedControl
	{
		left = 45,
		top = 80,
		segments = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" },
		defaultSegment = 1,
		--segmentWidth = 25,
		--[[
		labelSize = 14,
		labelFont = native.systemFontBold,
		labelXOffset = 0,
		labelYOffset = - 2,
		--]]
		onPress = onPress,
	}
	--newSegmentedControl.x = display.contentCenterX
	group:insert( newSegmentedControl )
	
	----------------------------------------------------------------------------------------------------------------
	--											TESTS
	----------------------------------------------------------------------------------------------------------------

	-- Test removing the segmentedControl
	if TEST_REMOVE_SEGMENTED_CONTROL then
		timer.performWithDelay( 100, function()
			display.remove( newSegmentedControl )
			
			TEST_DELAY = TEST_DELAY + TEST_DELAY
		end )
	end

	
end

function scene:didExitScene( event )
	--Cancel test timer if active
	if testTimer ~= nil then
		timer.cancel( testTimer )
		testTimer = nil
	end
	
	storyboard.removeAll()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "didExitScene", scene )

return scene
