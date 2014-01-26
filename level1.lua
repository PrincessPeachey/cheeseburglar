

player_front = love.graphics.newImage("/Artwork/sprite_player_front.png")

bun_top_image = love.graphics.newImage("/Artwork/sprite_bun_top.png")
bun_bottom_image = love.graphics.newImage("/Artwork/sprite_bun_bottom.png")
cheese_image = love.graphics.newImage("/Artwork/sprite_cheese.png")
patty_image = love.graphics.newImage("/Artwork/sprite_patty.png")

player_x = 40
player_y = 80

function level1()

	love.graphics.setColor(255,255,255)
	love.graphics.setBackgroundColor(82,220,193)

	
	love.graphics.draw(player_front, player_x, player_y, 0, 0.3, 0.3, 0,0,0,0)
	
	
	
	love.graphics.draw(bun_top_image, bun_top_x, bun_top_y,0, 0.2, 0.2, 0,0,0,0)
	love.graphics.draw(bun_bottom_image, bun_bottom_x, bun_bottom_y,0, 0.2, 0.2, 0,0,0,0)
	love.graphics.draw(cheese_image, cheese_x, cheese_y,0, 0.2, 0.2, 0,0,0,0)
	love.graphics.draw(patty_image, patty_x, patty_y,0, 0.2, 0.2, 0,0,0,0)


end