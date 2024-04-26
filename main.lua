function love.load()
    player_x = 234
    player_y = 370
    player_sprite = love.graphics.newImage('Sprites/Player.png')
    Wall = love.graphics.newImage('Sprites/Wall.png')
    Floor = love.graphics.newImage('Sprites/Flooring.png')
    Thiefer = love.graphics.newImage('Sprites/Thiefer.png')
    Red_tube = love.graphics.newImage('Sprites/Red_Tube.png')
    Blue_tube = love.graphics.newImage('Sprites/Blue_Tube.png')
    Yellow_tube = love.graphics.newImage('Sprites/Yellow_Tube.png')
    love.window.setMode(500, 500)
    love.window.setTitle("Black and white")
    Tube_x = math.random(0, 468)
    Tube_choose = math.random(1, 3)
    Tube_y = 0
    score = 0
    font = love.graphics.newFont("MGPixel.otf", 20)
    love.graphics.setFont(font)
    Tube_y_collision = player_y + 64
    Tube_x_collision = player_x + 32
end

function love.update(dt)
    Text = "Score:"..score
    if Tube_y <= 436 then
        Tube_y = Tube_y + 1
    else
        Tube_choose = math.random(1, 3)
        Tube_x = math.random(0, 468)
        Tube_y = 0
    end
end

function love.draw()
    love.graphics.draw(Wall, 0, 0)
    love.graphics.draw(Floor, 0, 400)
    if love.keyboard.isDown("space") then
        love.graphics.draw(Thiefer, player_x, player_y)
        if Tube_y == player_y -50 then
            if Tube_x >= player_x or Tube_x <= player_x + 32 then
                score = score + 1
                Tube_choose = math.random(1, 3)
                Tube_x = math.random(0, 468)
                Tube_y = 0
            end 
        end
    else
        love.graphics.draw(player_sprite, player_x, player_y)
        if player_x > 0 then
            if love.keyboard.isDown("left") then
                player_x = player_x - 3
            end 
        end
    
        if player_x < 465 then
            if love.keyboard.isDown("right") then
                player_x = player_x + 3
            end 
        end
    end
    if Tube_choose == 1 then
        love.graphics.draw(Red_tube, Tube_x, Tube_y)
    elseif Tube_choose == 2 then
        love.graphics.draw(Blue_tube, Tube_x, Tube_y)
    elseif Tube_choose == 3 then
        love.graphics.draw(Yellow_tube, Tube_x, Tube_y)
    end
    love.graphics.print(Text, 0, 475)
end