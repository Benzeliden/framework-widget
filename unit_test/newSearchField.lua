-- Copyright (C) 2012 Corona Inc. All Rights Reserved.
-- File: newSearchField unit test.

-- Change the package.path and make it so we can require the "widget.lua" file from the root directory
-------------------------------------------------------------------------------------------------
local path = package.path

-- get index of first semicolon
local i = string.find( path, ';', 1, true )
if ( i > 0 ) then
	-- first path (before semicolon) is project dir
	local projDir = string.sub( path, 1, i )

	-- assume widget dir is parent to projDir
	local widgetDir = string.gsub( projDir, '(.*)/([^/]?/\?\.lua)', '%1/../%2' )
	package.path = widgetDir .. path
end

package.preload.widget = nil
-------------------------------------------------------------------------------------------------

local widget = require( "widget" )
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

--Forward reference for test function timer
local testTimer = nil

function scene:createScene( event )
	local group = self.view
	
	--Display an iOS style background
	local background = display.newImage( "assets/background.png" )
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
	local TEST_REMOVE_SEARCH_FIELD = false
	local TEST_DELAY = 1000

	-- Set a theme
	widget.setTheme( "theme_ios" )
	
	local function onEvent( event )
		local phase = event.phase
		
		--print( event.phase ) 
	end
		
	
	local newSearchField = widget.newSearchField
	{
		left = 150,
		top = 200,
		placeholder = "Search For ...",
		listener = onEvent,
	}
	group:insert( newSearchField )

	----------------------------------------------------------------------------------------------------------------
	--											TESTS
	----------------------------------------------------------------------------------------------------------------
	
	-- Test removing the search field
	if TEST_REMOVE_SEARCH_FIELD then
		timer.performWithDelay( 100, function()
			display.remove( newSearchField )
			
			TEST_DELAY = TEST_DELAY + TEST_DELAY
		end )
	end

	
end

function scene:exitScene( event )
	--Cancel test timer if active
	if testTimer ~= nil then
		timer.cancel( testTimer )
		testTimer = nil
	end
	
	storyboard.purgeAll()
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "exitScene", scene )

return scene
