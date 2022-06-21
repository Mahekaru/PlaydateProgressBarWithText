local pd <const> = playdate
local gfx <const> = pd.graphics

class('ProgressBar').extends(gfx.sprite)

function ProgressBar:init(x, y, width, height)
	self:setImage(gfx.image.new(width, height))
	self.progress = 0
	self:moveTo(x, y)
	self:add()
	self:set(0)
end

function ProgressBar:set(percentage)
	self.progress = percentage
	local bar_image = gfx.image.new(self.width, self.height, gfx.kColorWhite)
	local progressWidth = self.progress/100 * (self.width - 4)
    local _, fontHeight = playdate.graphics.getTextSize("TEST")
	gfx.pushContext(bar_image)
	gfx.setLineWidth(2)
	gfx.drawRoundRect(1, 1, self.width-2, self.height-2, 3)
	gfx.fillRect(2, 2, progressWidth, self.height - 4)
	gfx.setImageDrawMode(gfx.kDrawModeNXOR)
	gfx.drawTextAligned(math.floor(self.progress) .. "%", self.width/2, (self.height - fontHeight)/2 + 2, kTextAlignment.center)
	gfx.popContext()
	self:setImage(bar_image)
end