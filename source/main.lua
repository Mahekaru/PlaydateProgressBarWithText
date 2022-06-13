import "coreLibs/object"
import "coreLibs/graphics"
import "coreLibs/sprites"
import "coreLibs/timer"

import "HudUi"

local pd <const> = playdate
local gfx <const> = pd.graphics

local hudUi = nil

local function initalize()
	hudUi = HudUi(false)
	hudUi:add()
end

initalize()

local progress1 = 0
local progress2 = 141
function playdate.update()
	gfx.sprite.update()
	pd.timer.updateTimers()

	if pd.buttonIsPressed(pd.kButtonA) then
		progress1 +=1
		hudUi:increaseBar(progress1)
	end

	if pd.buttonIsPressed(pd.kButtonB) then
		progress2 -=1
		hudUi:decreaseBar(progress2)
	end
end


