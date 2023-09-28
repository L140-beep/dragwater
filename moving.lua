-- require("vector")
-- require "mover"

-- function love.load()
--     love.window.setTitle("Acceleration")
--     width = love.graphics.getWidth()
--     height = love.graphics.getHeight()
--     love.graphics.setBackgroundColor(150 / 255, 150 / 255, 150 / 255)

--     wind = Vector:create(0.01, 0)
--     isWind = false
--     gravity = Vector:create(0, 0.01)
--     isGravity = false
--     floationg = Vector:create(0, -0.02)
--     isFloationg = false

--     mover = Mover:create(Vector:create(width / 2, height / 2), Vector:create(0, 0), 20, 10)
-- end

-- function love.update(dt)
--     if (isWind == true) then
--         mover:applyForce(wind)
--     end

--     if (isGravity == true) then
--         mover:applyForce(gravity)
--     end

--     if (isFloationg == true) then
--         mover:applyForce(floationg)
--     end

--     friction = (mover.velocity * -1):norm()
--     if friction then
--         if mover.location.x > width/2 then
--             print(friction)
--             friction:mul(0.005)
--             mover:applyForce(friction)
--         elseif mover.location.x < width/2 then
--             print(friction)
--             friction:mul(-0.005)
--             mover:applyForce(friction)
--         end
--     end
--     mover:checkBoundaries()
--     mover:update()
-- end

-- function love.draw()
--     mover:draw()

--     love.graphics.line(width/2, 0, width/2, height)
--     drawBoolean(isWind, "isWind = "..tostring(isWind), 10, 10)
--     drawBoolean(isGravity, "isGravity = "..tostring(isGravity), 10, 26)
--     drawBoolean(isFloationg, "isFloationg = "..tostring(isFloationg), 10, 42)
-- end

-- function love.keypressed(key)
--     if (key == 'g') then
--         isGravity = not isGravity
--     end

--     if (key == 'f') then
--         isFloationg = not isFloationg
--     end

--     if (key == 'w') then
--         isWind = not isWind

--         if (isWind) then
--             wind:mul(-1)
--         end
--     end
-- end

-- function drawBoolean(value, label, x, y)
--     font = love.graphics.newFont(16)

--     if (value == true) then
--         love.graphics.print({{0, 1, 0, 1}, label}, font, x, y)
--     else
--         love.graphics.print({{1, 0, 0, 1}, label}, font, x, y)
--     end
-- end