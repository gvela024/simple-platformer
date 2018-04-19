local Platforms = require 'level.Platforms'
local MainCharacter = require 'characters.MainCharacter'
local collision = require 'movement.collision'
local move = require 'movement.Move'(collision)

local platforms = {}
local dude = {}

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

function love.update(delta_time)
  if love.keyboard.isDown('d') and not love.keyboard.isDown('a') then
    move.right(dude, platforms, delta_time)
  end

  if love.keyboard.isDown('a') and not love.keyboard.isDown('d') then
    move.left(dude, platforms, delta_time)
  end

  gravity(dude)
end

function love.draw()
  dude.draw()

  for _, platform in ipairs(platforms) do
    platform.draw()
  end
end
