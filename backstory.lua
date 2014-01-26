
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
text_timer = 9

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

function backstory_animation(dt)
	if player_x < player_x_end then
		
		-- Move sprite across the screen
		player_x = player_x + (player_speed * dt)
		player_count = player_count + 1
		
		-- Flip the images
		if walk1 == false and walk2 == true then
			player_walk = player_walk2
			walk2 = false
		end
		
		if walk1 == true and walk2 == false then
			player_walk = player_walk1
			walk2 = true
		end
		
		-- Rate at which images flip
		if player_count % 15 == 0 then
			if walk1 == false and walk2 == false then
				walk1 = true
			end
			
			if walk1 == true and walk2 == true then
				walk1 = false
			end
		end
		
	end
	
	-- Stand still.
	if player_x + 0.5 >= player_x_end then
		player_walk = player_right
	end
	
	if player_walk == player_right then
		worker_text = "Cynthia: Hey! Thank goodness you're here!"
		text_timer = text_timer - dt
	end
	
	if text_timer < 6.5 then
		worker_text = "Cynthia: All of our burger ingredients have been stolen!"
	end
	
	if text_timer < 3.5 then
		worker_text = "Cynthia: We need to get them all back before we can go home tonight!"
	end
	
	if text_timer < 0.5 then
		gameState = "level1"
	end

end
