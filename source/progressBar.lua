import "CoreLibs/math"
local pd <const> = playdate
local gfx <const> = pd.graphics
local Sprite = gfx.sprite
local progressBarText = ""
local white = false
local black = false

class('ProgressBar').extends(Sprite)

function ProgressBar:init(x,y,width)
    local progressBarBorderImage = gfx.image.new("images/progressBarBorder")
    local progressBarImage = gfx.image.new("images/progressBar")

    local progressBarBorder = gfx.sprite.new()
    progressBarBorder:setImage(progressBarBorderImage)
    progressBarBorder.width = width
 
    progressBarBorder:moveTo(x,y)
    progressBarBorder:add()

    textSprite = gfx.sprite.new( textOverlay )
    textSprite:moveTo( 200, 200 )
    textSprite:add()
    
    self:setImage(progressBarImage)
    self.width = width - 4
    self:moveTo(x,y)
    self:add()

    self:increaseBar(0)
end

function ProgressBar:increaseBar(newwidth)
    progressBarText = newwidth
    self:setClipRect(self.x-self.width/2,self.y-self.height/2,newwidth,self.height)
end

function ProgressBar:decreaseBar(newwidth)
    progressBarText = newwidth
    self:setClipRect(self.x-self.width/2,self.y-self.height/2,newwidth,self.height)
end

function ProgressBar:drawText()
    local percentage = math.floor((progressBarText / self.width) * 100)

    if percentage >= 50 and white == false then
        playdate.graphics.setImageDrawMode("fillWhite")
        white = true
        black = false
    end

    if percentage < 50 and black == false then
        playdate.graphics.setImageDrawMode("fillBlack")
        white = false
        black = true
    end

    gfx.drawText(percentage.."%", 100,17)

end
