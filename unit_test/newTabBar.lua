local widget = require( "widgetnew" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

function scene:createScene( event )
	local group = self.view
	
	--Display an iOS style background
	local background = display.newImage( "assets/background.png" )
	group:insert( background )
	
	--Button to return to unit test listing
	local returnToListing = widget.newButton{
	    id = "returnToListing",
	    left = 60,
	    top = 50,
	    label = "Return To Menu",
	    width = 200, height = 52,
	    cornerRadius = 8,
	    onRelease = function() storyboard.gotoScene( "unitTestListing" ) end;
	}
	group:insert( returnToListing )
	
	----------------------------------------------------------------------------------------------------------------
	--										START OF UNIT TEST													  --
	----------------------------------------------------------------------------------------------------------------
	
	--[[
	
	RECENT CHANGES/THINGS TO REVIEW:
	
	1) CHANGE/FEATURE NAME. 
	
	How: HOW TO TEST CHANGE.
	Expected behavior: EXPECTED BEHAVIOR OF CHANGE.

	--]]
	
	
	-- create buttons table for the tab bar
	local tabButtons = {
		{
			label = "Tab1",
			default = "assets/tabIcon.png",
			down = "assets/tabIcon-down.png",
			width = 32, height = 32,
			onPress = function() print( "Tab 1 pressed" ) end,
			selected = true
		},
		{
			label = "Tab2",
			default = "assets/tabIcon.png",
			down = "assets/tabIcon-down.png",
			width = 32, height = 32,
			onPress = function() print( "Tab 2 pressed" ) end,
		},
		{
			label = "Tab3",
			default = "assets/tabIcon.png",
			down = "assets/tabIcon-down.png",
			width = 32, height = 32,
			onPress = function() print( "Tab 3 pressed" ) end,
		}
	}
	
	-- create a tab-bar and place it at the bottom of the screen
	local demoTabs = widget.newTabBar{
		top = display.contentHeight-50,
		buttons = tabButtons,
		maxTabWidth = 120
	}
	group:insert( demoTabs )
	
	----------------------------------------------------------------------------------------------------------------
	--											TESTS											 	  			  --
	----------------------------------------------------------------------------------------------------------------
	
	--[[
	timer.performWithDelay( 2000, function()
		end, 1 )
	--]]
	
end

function scene:exitScene( event )
	storyboard.purgeAll()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "exitScene", scene )

return scene
