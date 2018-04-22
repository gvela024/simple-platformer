describe('gravity', function()
  local mach = require 'mach'
  local collision = mach.mock_table({
    down = function() end,
  }, 'collision')
  local gravity = require 'gravity.Gravity'(collision)

  local dude = {}
  local default_y = 10
  local g_s = 9.8
  local weight = 100
  local delta_time = 1

  before_each(function()
    dude.y = default_y
    dude.weight = weight
  end)

  it('should not fall if moving is on top of something', function()
    local stationary = { 'some stationary object' }
    gravity(dude, stationary, delta_time)
    assert.equal(default_y, dude.y)
  end)
end)
