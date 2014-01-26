
--[[
-- Variables
--]]

counter_image = love.graphics.newImage("/Artwork/background_counter_plain_no_back.png")

worker_sprite = love.graphics.newImage("/Artwork/sprite_worker_basic_girl_red_large.png")

player_front = love.graphics.newImage("/Artwork/sprite_player_front.png")
player_right = love.graphics.newImage("/Artwork/sprite_player_right.png")
player_walk = nil
player_walk1 = love.graphics.newImage("/Artwork/sprite_player_right_walk_1.png")
player_walk2 = love.graphics.newImage("/Artwork/sprite_player_right_walk_2.png")

player_walk_timer_max = 1
player_walk_timer = 0

walk1 = true
walk2 = false

player_x = -80
player_y = 80
player_x_end = 140

worker_text = ""
text_timer = 6

--[[
-- Draws the backstory.
--]]
function backstory()

	love.graphics.setBackgroundColor(218,197,197)
	
	-- Draw the worker behind the counter
	love.graphics.setColor(255,255,255)
	love.graphics.draw(worker_sprite, 535, 10, 0, 0.5, 0.5, 0, 0, 0, 0)
	
	love.graphics.draw(counter_image)
	
	love.graphics.draw(player_walk, player_x, player_y, 0, 0.7, 0.7, 0,0,0,0)
	
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", 0, windowHeight-100, windowWidth, 100)
	
	love.graphics.setColor(0,0,0)
	love.graphics.print(worker_text, 30, windowHeight-60)
	

end
