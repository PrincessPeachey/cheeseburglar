require("splash")
require("backstory")
require("level1")

--[[
--Loads when the game is first started.
--]]
function love.load()
	
	windowHeight = 600
	windowWidth = 1000
	
	math.randomseed(os.time())
	math.random()
	math.random()
	math.random()
	
	bun_top_x = math.random(0, windowWidth)
	bun_top_y = math.random(0, windowHeight)
	bun_bottom_x = math.random(0, windowWidth)
	bun_bottom_y = math.random(0, windowHeight)
	cheese_x = math.random(0, windowWidth)
	cheese_y = math.random(0, windowHeight)
	patty_x = math.random(0, windowWidth)
	patty_y = math.random(0, windowHeight)
	
	success = love.window.setMode(windowWidth, windowHeight)
	
	player_speed = 100
	player_count = 0
	
	--player = love.graphics.newImage("/Artwork/sprite_player.png")
	
	gameState = "level1"
	
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
		backstory_animation(dt)
	end
	
	if gameState == "level1" then
		
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
	
	if gameState == "level1" then
		level1()
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