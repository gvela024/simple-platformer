describe('move', function()
  local move = require 'movement.Move'

  local dude = { }
  local default_x = 5
  local default_y = 12
  local default_speed = 10
  local default_height = 20
  local defatul_width = 20
  local delta_time = 1

  before_each(function()
    dude.x = default_x
    dude.y = default_y
    dude.height = default_height
    dude.width = default_width
    dude.speed = default_speed
  end)

  it('should move right without any stationary objects', function()
    move.right(dude, { }, delta_time)
    assert.equal(default_x + (delta_time * default_x), dude.x)
  end)

  it('should move left without any stationary objects', function()
    move.left(dude, { }, delta_time)
    assert.equal(default_x - (delta_time * default_x), dude.x)
  end)

  -- it('should align moving object with stationary if they overlap while moving right', function()
  --   local wall = {
  --     x = default_x + (delta_time * default_x) - 1,
  --     y = default_y,
  --     height = 30,
  --     width = 5
  --   }
  --   dude.x =
  --   move.right(dude, wall, delta_time)
  --   assert
  -- end)
end)