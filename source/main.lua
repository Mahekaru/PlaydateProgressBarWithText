import "coreLibs/object"
import "coreLibs/graphics"
import "coreLibs/sprites"

import "ProgressBar"

local pd <const> = playdate
local gfx <const> = pd.graphics

local progressBar1 = nil
local progressBar2 = nil

local function initalize()
	progressBar1 = ProgressBar(100,25,145,25)
	progressBar1:add()

	progressBar2 = ProgressBar(100,51,145,25)
	progressBar2:set(100)
	progressBar2:add()
end

initalize()
local progress1 = 0
local progress2 = 100
function playdate.update()
	gfx.sprite.update()

	if pd.buttonIsPressed(pd.kButtonA) then
		progress1 +=1
		progressBar1:set(progress1)
	end

	if pd.buttonIsPressed(pd.kButtonB) then
		progress2 -=1
		progressBar2:set(progress2)
	end
end


