

local pd <const> = playdate
local gfx <const> = pd.graphics
import "ProgressBar"

class('Bar1').extends(gfx.sprite)
local progressBar = nil
function Bar1:init()
    Bar1.super.init(self)
    
    progressBar = ProgressBar(100,50,145,145) --(100,25,145,145)
    progressBar:add()
    
    self:increaseBar(0)
end

function Bar1:increaseBar(newwidth)
    progressBar:setClipRect(progressBar.x-progressBar.width/2,progressBar.y-progressBar.height/2,newwidth,progressBar.height)
end
