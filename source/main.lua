import "coreLibs/object"
import "coreLibs/graphics"
import "coreLibs/sprites"
import "coreLibs/timer"

import "ProgressBar"

local pd <const> = playdate
local gfx <const> = pd.graphics

local progressBar = nil

local function initalize()
	progressBar = ProgressBar(100,25,145,145)
	progressBar:add()
end

initalize()

local progress1 = 0
local progress2 = 141
function playdate.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
	progressBar:drawText()

	if pd.buttonIsPressed(pd.kButtonA) then
		progress1 +=1
		progressBar:increaseBar(progress1)
	end

	if pd.buttonIsPressed(pd.kButtonB) then
		progress1 -=1
		progressBar:decreaseBar(progress1)
	end
end


