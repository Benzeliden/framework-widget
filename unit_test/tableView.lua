-- Copyright (C) 2012 Corona Inc. All Rights Reserved.
-- File: newTableView unit test.

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
	
	-- Set a theme
	widget.setTheme( "theme_ios" )
	
	-- Button to return to unit test listing
	local returnToListing = widget.newButton
	{
	    id = "returnToListing",
	    left = 0,
	    top = 5,
	    label = "Exit",
		labelAlign = "center",
		fontSize = 18,
	    width = 200, height = 52,
	    cornerRadius = 8,
	    onRelease = function() storyboard.gotoScene( "unitTestListing" ) end;
	}
	returnToListing.x = display.contentCenterX
	group:insert( returnToListing )
	
	----------------------------------------------------------------------------------------------------------------
	--										START OF UNIT TEST
	----------------------------------------------------------------------------------------------------------------
	
	--Toggle these defines to execute tests. NOTE: It is recommended to only enable one of these tests at a time
	local TEST_SCROLL_TO_Y = false
	local TEST_SCROLL_TO_INDEX = false
	local TEST_DELETE_ALL_ROWS = false
	local TEST_DELETE_SINGLE_ROW = false
	local TEST_LOCKING_LIST = false
	
	-- Listen for tableView events
	local function tableViewListener( event )
		local phase = event.phase
		
		print( event.phase )
	end

	-- Handle row rendering
	local function onRowRender( event )
		local phase = event.phase
		local row = event.row
		
		local rowTitle = display.newText( row, "Row " .. row.index, 0, 0, nil, 14 )
		rowTitle.x = row.x - ( row.contentWidth * 0.5 ) + ( rowTitle.contentWidth * 0.5 )
		rowTitle.y = row.contentHeight * 0.5
		rowTitle:setTextColor( 0, 0, 0 )
	end
	
	-- Handle touches on the row
	local function onRowTouch( event )
		local phase = event.phase
				
		if "press" == phase then
			print( "Touched row:", event.target.index )
		end
	end
	
	-- Create a tableView
	local tableView = widget.newTableView
	{
		top = 100,
		width = 320, 
		height = 366,
		maskFile = "assets/mask-320x366.png",
		listener = tableViewListener,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch,
	}
	group:insert( tableView )
	
	-- Create 100 rows
	for i = 1, 100 do
		local isCategory = false
		local rowHeight = 40
		local rowColor = { 255, 255, 255 }
		local lineColor = { 220, 220, 220 }
		
		-- Make some rows categories
		if i == 25 or i == 50 or i == 75 then
			isCategory = true
			rowHeight = 24
			rowColor = { 150, 160, 180, 200 }
		end
		
		-- Insert the row into the tableView
		tableView:insertRow
		{
			isCategory = isCategory,
			rowHeight = rowHeight,
			rowColor = rowColor,
			lineColor = lineColor,
		}
	end
	
	timer.performWithDelay( 1000, function()
		--tableView:deleteRow( 6 )
		--tableView:deleteAllRows()
		--tableView:scrollToIndex( 40 )
		--tableView:scrollToY( { y = - 300, time = 800 } )
	end)

	----------------------------------------------------------------------------------------------------------------
	--											TESTS
	----------------------------------------------------------------------------------------------------------------			
	
	--Test locking list
	if TEST_LOCKING_LIST then
		list.isLocked = true
	end
	
	--Test to scroll list to Y position
	if TEST_SCROLL_TO_Y then
		testTimer = timer.performWithDelay( 1000, function()
			list:scrollToY( -3755, 6000 ) -- y = -3755
		end, 1 )
	end
	
	--Test to scroll list to index
	if TEST_SCROLL_TO_INDEX then
		testTimer = timer.performWithDelay( 1000, function()
			list:scrollToIndex( 68, 6000 )	-- y = -3755
		end, 1 )
	end
	
	--Test deleting single row
	if TEST_DELETE_SINGLE_ROW then
		testTimer = timer.performWithDelay( 1000, function()			
			list:deleteRow( 5 ) --Delete Row 5
		end, 1 )
	end
	
	--Test delete all rows
	if TEST_DELETE_ALL_ROWS then
		testTimer = timer.performWithDelay( 1000, function()			
			list:deleteAllRows() --No rows after execution
		end, 1 )
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
