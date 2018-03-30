local Platforms = require 'level.Platforms'
local MainCharacter = require 'characters.MainCharacter'
local collision = require 'movement.collision'

local platforms = {}
local dude = {}

local function colliding_with_anything(stationary, direction, objects)
  for _, object in pairs(objects) do
    if direction(stationary, object) then return true end
  end
  return false
end

function love.load()
  platforms = Platforms({
    set_color = love.graphics.setColor,
    draw = love.graphics.rectangle
  })

  dude = MainCharacter({
    set_color = love.graphics.setColor,
    draw = love.graphics.rectangle,
    origin = {
      x = 125,
      y = platforms[1].y
    }
  })
end

function love.update(dt)
  if love.keyboard.isDown('d') then
    if not colliding_with_anything(dude, collision.right, platforms) then
      dude.x = dude.x + dude.speed
    end
  end

  if love.keyboard.isDown('a') then
    if not colliding_with_anything(dude, collision.left, platforms) then
      dude.x = dude.x - dude.speed
    end
  end
end

function love.draw()
  dude.draw()

  for _, platform in ipairs(platforms) do
    platform.draw()
  end
end
