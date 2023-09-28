require("vector")
require "mover"
require "liquid"


function love.load()
    love.window.setTitle("Acceleration")
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    love.graphics.setBackgroundColor(150 / 255, 150 / 255, 150 / 255)
    mover = Mover:create(Vector:create(width / 3, height / 4), Vector:create(0, 0), 20, 30, 1)
    mover1 = Mover:create(Vector:create(width / 2 - 150, height / 4), Vector:create(0, 0), 20, 130, 1)
    mover2 = Mover:create(Vector:create(width / 2 + 50, height / 4), Vector:create(0, 0), 20, 300, 1)
    water = Liquid:create(0, height - 300, width, 300, 0.01)
    gravity = Vector:create(0, 0.1)
end

function love.draw()
    mover:draw()
    mover1:draw()
    mover2:draw()
    water:draw()
end

function move(mover)
    mover:applyForce(gravity)

    friction = (mover.velocity * -1):norm()

    if friction then 
        friction:mul(0.05)
        mover:applyForce(friction)
    end

    if water:isInside(mover) then
        mag = mover.velocity:mag()
        drag = 0.5 * 0.28 * water.c  * mag * mag * mover.width
        drag_vec = (mover.velocity * -1):norm()
        drag_vec:mul(drag)
        print("Drag "..tostring(drag_vec))
        print("Vel "..tostring(mover.velocity))
        mover:applyForce(drag_vec)
    end

    mover:checkBoundaries()
    mover:update()
end

function love.update(dt)
    move(mover)
    move(mover1)
    move(mover2)
end