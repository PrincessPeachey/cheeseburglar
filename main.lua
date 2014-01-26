require("splash")
require("backstory")

--[[
--Loads when the game is first started.
--]]
function love.load()
	
	windowHeight = 600
	windowWidth = 1000
	
	success = love.window.setMode(windowWidth, windowHeight)
	
	player_speed = 100
	player_count = 0
	
	--player = love.graphics.newImage("/Artwork/sprite_player.png")
	
	gameState = "splashScreen"
	
end

--[[ 
--Called when the user closes the game.
--]]
function love.quit()

end

--[[
-- Called continuously.
-- dt: number of seconds since the last time this function was called.
--]]
function love.update(dt)
	
	-- If starting the game
	if gameState == "splashScreen" then
		
		if splash_fade_timer < splash_fade_max then
			splash_fade_timer = splash_fade_timer + dt
		end
			
		-- Move onto the actual game.
		if love.keyboard.isDown("return") and splash_fade_timer > splash_fade_enter then
			gameState = "backStory"
		end
	end

	-- If playing the backstory
	if gameState == "backStory" then
	
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
		
		if text_timer < 3.5 then
			worker_text = "Cynthia: All of our burger ingredients have been stolen!"
		end
		
		if text_timer < 0.5 then
			worker_text = "Cynthia: We need to get them all back before we can go home tonight!"
		end
		
	end

	
	
	
	-- DEPRECATED
	
	-- If playing the game
	if gameState == "gamePlay" then
	
		-- Move to the right
		if love.keyboard.isDown("right") then
			player_x = player_x + (player_speed * dt)
		end
		-- Move to the left
		if love.keyboard.isDown("left") then
			player_x = player_x - (player_speed * dt)
		end
		-- Move upwards
		if love.keyboard.isDown("up") then
			player_y = player_y - (player_speed * dt)
		end
		-- Move downwards
		if love.keyboard.isDown("down") then
			player_y = player_y + (player_speed * dt)
		end
	end
	
	-- FINISH DEPRECATED
	
end

--[[
-- Main drawing method.
--]]
function love.draw()
	
	if gameState == "splashScreen" then
		splashScreen()
	end
	
	-- If playing the backstory
	if gameState == "backStory" then
		backstory()
		
	end
	
	
	
	
	
	-- DEPRECATED
	if gameState == "gamePlay" then
		initialiseBackground()
	
		love.graphics.setColor(255,255,255) --necessary or sprite discoloured
		love.graphics.draw(player, player_x, player_y)
	end
	-- FINISH DEPRECATED
	
end




-- DEPRECATED

--[[
 -- Sets up the background of the game.
 --]]
function initialiseBackground()
	
	-- Colours --
	sky_r = 125
	sky_g = 227
	sky_b = 222
	
	grass_r = 134
	grass_g = 209
	grass_b = 144
	grass_h = 100
	
	love.graphics.setBackgroundColor(sky_r,sky_g,sky_b)
	love.graphics.setColor(grass_r, grass_g, grass_b)
	love.graphics.rectangle("fill", 0, windowHeight-grass_h, windowWidth, grass_h)
	
end
-- FINISH DEPRECATED