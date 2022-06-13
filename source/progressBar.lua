
local pd <const> = playdate
local gfx <const> = pd.graphics
local Sprite = gfx.sprite
local progressBarBorder = nil

class('ProgressBar').extends(Sprite)

function ProgressBar:init(x,y,width,widthRemaining)
    local progressBarBorderImage = gfx.image.new("images/progressBarBorder")
    local progressBarImage = gfx.image.new("images/progressBar")

    progressBarBorder = gfx.sprite.new()
    progressBarBorder:setImage(progressBarBorderImage)
    progressBarBorder.width = widthRemaining
 
    progressBarBorder:moveTo(x,y)
    progressBarBorder:add()

    self:setImage(progressBarImage)
    self.width = width - 4
    self:moveTo(x,y)
    self:add()
end