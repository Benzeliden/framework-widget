--[[
	Copyright:
		Copyright (C) 2012 Corona Inc. All Rights Reserved.
		
	File: 
		widget_scrollView.lua
		
	What is it?: 
		A widget object that can be used to replicate native scrollViews.
--]]

local M = 
{
	_options = {},
	_widgetName = "widget.newScrollView",
}

-- Creates a new scrollView
local function createScrollView( scrollView, options )
	-- Create a local reference to our options table
	local opt = options
		
	-- Forward references
	local view, viewBackground, viewMask
	
	-- Create the view
	view = display.newGroup()
	
	-- Create the view's background
	viewBackground = display.newRect( scrollView, 0, 0, opt.width, opt.height )
	
	-- If there is a mask file, create the mask
	if opt.maskFile then
		viewMask = graphics.newMask( opt.maskFile, opt.baseDir )
	end
	
	-- If a mask was specified, set it
	if viewMask then
		scrollView:setMask( viewMask )
		scrollView.maskX = opt.width * 0.5
		scrollView.maskY = opt.height * 0.5
		scrollView.isHitTestMasked = true
	end
	
	----------------------------------
	-- Properties
	----------------------------------
	
	-- Background
	viewBackground.isVisible = not opt.shouldHideBackground
	viewBackground.isHitTestable = true
	viewBackground:setFillColor( unpack( opt.backgroundColor ) )
	
	-- Set the view's initial position ( to account for top padding )
	view.y = view.y + opt.topPadding

	-------------------------------------------------------
	-- Assign properties to the view
	-------------------------------------------------------
	
	-- We need to assign these properties to the object
	view._background = viewBackground
	view._mask = mask
	view._startXPos = 0
	view._startYPos = 0
	view._prevXPos = 0
	view._prevYPos = 0
	view._prevX = 0
	view._prevY = 0
	view._delta = 0
	view._velocity = 0
	view._prevTime = 0
	view._lastTime = 0
	view._top = opt.top
	view._left = opt.left
	view._topPadding = opt.topPadding
	view._bottomPadding = opt.bottomPadding
	view._leftPadding = opt.leftPadding
	view._rightPadding = opt.rightPadding
	view._moveDirection = nil
	view._isHorizontalScrollingDisabled = opt.isHorizontalScrollingDisabled
	view._isVerticalScrollingDisabled = opt.isVerticalScrollingDisabled
	view._listener = opt.listener
	view._friction = opt.friction or 0.972
	view._trackVelocity = false	
	view._updateRuntime = false
			
	-------------------------------------------------------
	-- Assign properties/objects to the scrollView
	-------------------------------------------------------
	
	-- Assign objects to the scrollView
	scrollView._view = view
	scrollView:insert( view )
	
	----------------------------------------------------------
	--	PUBLIC METHODS	
	----------------------------------------------------------
	
	-- Function to retrieve the x/y position of the scrollView's content
	function scrollView:getContentPosition()
		return self._view.x, self._view.y
	end
	
	-- Function to scroll the view to a specific position
	function scrollView:scrollToPosition( options )
		local newX = options.x
		local newY = options.y
		local transitionTime = options.time or 400
		local onTransitionComplete = options.onComplete
	
		transition.to( self._view, { x = newX, y = newY, time = transitionTime, transition = easing.inOutQuad, onComplete = onTransitionComplete } )
	end
	
	-- Function to scroll the view to a specified position from a list of constants ( i.e. top/bottom/left/right )
	function scrollView:scrollTo( position, options )
		local newPosition = position or "top"
		local newX = self._view.x
		local newY = self._view.y
		local transitionTime = options.time or 400
		local onTransitionComplete = options.onComplete
		
		-- Set the target x/y positions
		if "top" == newPosition then
			newY = self._view._topPadding
		elseif "bottom" == newPosition then
			newY = self._view._background.y - ( self._view.contentHeight ) + ( self._view._background.contentHeight * 0.5 ) - self._view._bottomPadding
		elseif "left" == newPosition then
			newX = self._view._leftPadding
		elseif "right" == newPosition then
			newX = self._view._background.x - ( self._view.contentWidth ) + ( self._view._background.contentWidth * 0.5 ) - self._view._rightPadding
		end
		
		transition.to( self._view, { x = newX, y = newY, time = transitionTime, transition = easing.inOutQuad, onComplete = onTransitionComplete } )
	end
	
	----------------------------------------------------------
	--	PRIVATE METHODS	
	----------------------------------------------------------
	
	-- Override the insert method for scrollView to insert into the view instead
    scrollView._cachedInsert = scrollView.insert

    function scrollView:insert( arg1, arg2 )
        local index, obj
        
        if arg1 and type(arg1) == "number" then
            index = arg1
        elseif arg1 and type(arg1) == "table" then
            obj = arg1
        end
        
        if arg2 and type(arg2) == "table" then
            obj = arg2
        end
        
        if index then
            self._view:insert( index, obj )
        else
            self._view:insert( obj )
        end
    end

	-- Transfer touch from the view's background to the view's content
	function viewBackground:touch( event )
		view:touch( event )
		
		return true
	end
	
	viewBackground:addEventListener( "touch" )

	-- Handle touches on the scrollview
	function view:touch( event )
		-- Handle momentum scrolling
		require( "widget_momentumScrolling" )._touch( self, event )
		
		-- Execute the listener if one is specified
		if self._listener then
			self._listener( event )
		end
		
		return true
	end
	
	view:addEventListener( "touch" )
	
  	-- EnterFrame
	function view:enterFrame( event )
		-- Handle momentum @ runtime
		require( "widget_momentumScrolling" )._runtime( self, event )
		
		return true
	end
	
	Runtime:addEventListener( "enterFrame", view )
		
	-- Finalize function for the scrollView
	function scrollView:_finalize()
		Runtime:removeEventListener( "enterFrame", self._view )
	end
			
	return scrollView
end


-- Function to create a new scrollView object ( widget.newScrollView )
function M.new( options )	
	local customOptions = options or {}
	
	-- Create a local reference to our options table
	local opt = M._options
	
	-------------------------------------------------------
	-- Properties
	-------------------------------------------------------

	-- Positioning & properties
	opt.left = customOptions.left or 0
	opt.top = customOptions.top or 0
	opt.width = customOptions.width
	opt.height = customOptions.height
	opt.id = customOptions.id
	opt.baseDir = customOptions.baseDir or system.ResourceDirectory
	opt.maskFile = customOptions.maskFile
	opt.listener = customOptions.listener
		
	-- Properties
	opt.shouldHideBackground = customOptions.hideBackground or false
	opt.backgroundColor = customOptions.backgroundColor or { 255, 255, 255, 255 }
	opt.topPadding = customOptions.topPadding or 0
	opt.bottomPadding = customOptions.bottomPadding or 0
	opt.leftPadding = customOptions.leftPadding or 0
	opt.rightPadding = customOptions.rightPadding or 0
	opt.isHorizontalScrollingDisabled = customOptions.horizontalScrollingDisabled or false
	opt.isVerticalScrollingDisabled = customOptions.verticalScrollingDisabled or false
	
	-------------------------------------------------------
	-- Create the scrollView
	-------------------------------------------------------
		
	-- Create the scrollView object
	local scrollView = require( "widget" )._new
	{
		left = opt.left,
		top = opt.top,
		id = opt.id or "widget_scrollView",
		baseDir = opt.baseDir,
	}

	-- Create the scrollView
	createScrollView( scrollView, opt )
	
	return scrollView
end

return M
