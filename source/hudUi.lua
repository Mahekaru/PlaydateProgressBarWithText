
import 'CoreLibs/sprites'
import "coreLibs/object"
import "coreLibs/graphics"
import "Bar1"
import "Bar2"

local pd <const> = playdate
local gfx <const> = pd.graphics

local bar1 = nil
local bar2 = nil

class('HudUi').extends(playdate.graphics.sprite)

function HudUi:decreaseBar(remainingFuel)
	bar2:decreaseBar(remainingFuel)
end

function HudUi:increaseBar(heat)
	bar1:increaseBar(heat)
end

function HudUi:init()
	bar1 = Bar1()
	bar2 = Bar2()

	bar1:add()
	bar2:add()
end

function HudUi:update()
	HudUi.super.update(self)
end
