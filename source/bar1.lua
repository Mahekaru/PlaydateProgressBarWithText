

local pd <const> = playdate
local gfx <const> = pd.graphics
import "ProgressBar"

class('Bar1').extends(gfx.sprite)
local progressBar = nil
function Bar1:init()
    Bar1.super.init(self)
    -- Could the problem be that I'm using two image files and the setClipRect to do
    -- The actual progress?
    -- A part of me is saying, If I just draw the text into the image itself that would at least get me something
    -- Almost feels like I'm fighting the system by trying to render the text with drawText
    -- Although... I'd like to have the text be seen as the progress bar fills up too so
    -- I still have another problem there.
    progressBar = ProgressBar(100,50,145,145) --(100,25,145,145)
    progressBar:add()
    
    self:increaseBar(0)
end

function Bar1:increaseBar(newwidth)
    progressBar:setClipRect(progressBar.x-progressBar.width/2,progressBar.y-progressBar.height/2,newwidth,progressBar.height)

    -- this KINDA works... but only as long as I hit the button
    -- I'm assuming it's not visible because of the black text
    -- And since it's an image it's not chaning with kDrawModeCopy
    drawText()

end

function drawText()
    gfx.pushContext()
	
    -- draw the box				
    gfx.setColor(gfx.kDrawModeCopy)

    -- draw the text!
    gfx.drawText("Text", 80, 42)
    print("drawing")

    gfx.popContext()
end


--Doing it this way prints drawing in the console, but no text
-- function Bar1.update()
--     gfx.pushContext()
	
--     -- draw the box				
--     gfx.setColor(gfx.kDrawModeCopy)

--     -- draw the text!
--     gfx.drawText("Text", 80, 42)
--     print("drawing")

--     gfx.popContext()
-- end