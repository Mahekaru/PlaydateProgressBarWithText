

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

function Bar2:update()
    -- I'm not sure how to use lockFocus in this case
    -- I'm not really using an image so it doesn't really make sense.
    -- PushContext at least makes some sense, but it still isn't working right
    gfx.drawText("Text",80,20)
end

