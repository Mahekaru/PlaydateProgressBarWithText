

local pd <const> = playdate
local gfx <const> = pd.graphics
import "ProgressBar"

class('Bar2').extends(gfx.sprite)
local progressBar = nil
function Bar2:init()
    Bar2.super.init(self)

    progressBar = ProgressBar(100,25,145,145)
    progressBar:add()
end

function Bar2:decreaseBar(newwidth)
    progressBar:setClipRect(progressBar.x-progressBar.width/2,progressBar.y-progressBar.height/2,newwidth,progressBar.height)
end

