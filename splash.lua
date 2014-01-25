
--[[
-- Variables
--]]
splash_fade_timer = 0
splash_fade_max = 6
splash_fade_enter = 3
splash_image = love.graphics.newImage("/Artwork/game_title.png")
love.graphics.setFont(love.graphics.newFont(18))

image_width = splash_image:getWidth()
image_height = splash_image:getHeight()

--[[
-- Draws splash screen.
--]]
function splashScreen()
	
	love.graphics.setBackgroundColor(0,0,0)
	
	love.graphics.setColor(128, 0, 255, splash_fade_timer*(255/6))
	love.graphics.draw(splash_image, (windowWidth - image_width)/2, (windowHeight - image_height)/2)
	
	if splash_fade_timer > splash_fade_enter then
		love.graphics.setColor(255,255,255)
		love.graphics.printf("Press enter to play.", (windowWidth/2)-90, (windowHeight/2)+90, 180, "center")
	end
	
end
