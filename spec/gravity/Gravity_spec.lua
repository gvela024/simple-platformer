describe('gravity', function()
  local mach = require 'mach'
  local collision = mach.mock_table({
    down = function() end,
  }, 'collision')

  local dude = {}
  local default_y = 10
  local gravities = (9.8)
  local delta_time = 1

  local gravity = require 'gravity.Gravity'(collision, gravities)

  before_each(function()
    dude.y = default_y
    dude.weight = weight
  end)

  it('should not fall if moving is on top of something', function()
    local stationary = { 'some stationary object' }
    collision.down:should_be_called_with(dude, stationary[1]):and_will_return(true):
      when(function()
        gravity(dude, stationary, delta_time)
      end)
    assert.equal(default_y, dude.y)
  end)

  it('should fall if moving is not on top of something', function()
    local stationary = { 'some stationary object' }
    collision.down:should_be_called_with(dude, stationary[1]):and_will_return(false):
      when(function()
        gravity(dude, stationary, delta_time)
      end)
    assert.equal(default_y - (gravities * (delta_time ^ 2)), dude.y)
  end)

  it('should not fall if colliding against one of many objects', function()
    local stationary = { 'list', 'of', 'objects' }
    collision.down:may_be_called_with(dude, stationary[1]):and_will_return(false):
      and_also(collision.down:may_be_called_with(dude, stationary[2]):and_will_return(true)):
      and_also(collision.down:may_be_called_with(dude, stationary[3]):and_will_return(false)):
      when(function()
        gravity(dude, stationary, delta_time)
      end)
    assert.equal(default_y - (gravities *(delta_time ^ 2)), dude.y)
  end)
end)
