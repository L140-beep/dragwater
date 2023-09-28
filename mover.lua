Mover = {}
Mover.__index = Mover

function Mover:create(location, velocity, _height, _width, weight)
  local mover = {}
  setmetatable(mover, Mover)
  
  mover.location = location
  mover.velocity = velocity
  mover.acceleration = Vector:create(0, 0)
  mover.weight = weight or 1
  -- mover.size = size * mover.weight * 0.2 or 20
  mover.height = _height
  mover.width = _width
  return mover
end

function Mover:applyForce(force)
  self.acceleration:add(force * self.weight)
end

function Mover:update()
  self.velocity:add(self.acceleration)
  self.location:add(self.velocity)

  self.acceleration:mul(0)
end

function Mover:draw()
  love.graphics.rectangle("fill", self.location.x, self.location.y, self.width, self.height)
  -- love.graphics.circle('fill', self.location.x, self.location.y, self.size)
end

function Mover:checkBoundaries()
  if (self.location.x > width - self.width) then
    self.location.x = width - self.width
    self.velocity.x = -1 * self.velocity.x
  elseif(self.location.x < self.width) then
    self.location.x = self.width
    self.velocity.x = -1 * self.velocity.x
  end

  if (self.location.y > height - self.height) then
    self.location.y = height - self.height
    self.velocity.y = -1 * self.velocity.y
  elseif(self.location.y < self.height) then
    self.location.y = self.height
    self.velocity.y = -1 * self.velocity.y
  end
end