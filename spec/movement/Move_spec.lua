describe('move', function()
  local mach = require 'mach'
  local collision = mach.mock_table({
    right = function() end,
    left = function() end
  }, 'collision')

  local move = require 'movement.Move'(collision)

  local dude = { }
  local default_x = 5
  local default_y = 12
  local default_speed = 10
  local default_height = 20
  local defatul_width = 20
  local delta_time = 1

  before_each(function()
    dude.x = default_x
  end)

  it('should move right without any stationary objects', function()
    move.right(dude, { }, delta_time)
    assert.equal(default_x + (delta_time * default_x), dude.x)
  end)

  it('should move left without any stationary objects', function()
    move.left(dude, { }, delta_time)
    assert.equal(default_x - (delta_time * default_x), dude.x)
  end)

  it('should move right if not colliding with any objects', function()
    local objects = { 'these', 'are', 'some', 'objects' }
    collision.right:should_be_called_with(dude, objects[1]):and_will_return(false):
      and_also(collision.right:should_be_called_with(dude, objects[2]):and_will_return(false)):
      and_also(collision.right:should_be_called_with(dude, objects[3]):and_will_return(false)):
      and_also(collision.right:should_be_called_with(dude, objects[4]):and_will_return(false)):
      when(function()
        move.right(dude, objects, delta_time)
      end)
      assert.equal(default_x + (delta_time * default_x), dude.x)
  end)

  it('should move left if not colliding with any objects', function()
    local objects = { 'these', 'are', 'some', 'objects' }
    collision.left:should_be_called_with(dude, objects[1]):and_will_return(false):
      and_also(collision.left:should_be_called_with(dude, objects[2]):and_will_return(false)):
      and_also(collision.left:should_be_called_with(dude, objects[3]):and_will_return(false)):
      and_also(collision.left:should_be_called_with(dude, objects[4]):and_will_return(false)):
      when(function()
        move.left(dude, objects, delta_time)
      end)
      assert.equal(default_x - (delta_time * default_x), dude.x)
  end)

  it('should not move right if colliding with one object', function()
    local stationary = { { x = default_x } }
    collision.right:should_be_called_with(dude, stationary[1]):and_will_return(true):when(function()
      move.right(dude, stationary, delta_time)
    end)
    assert.equal(default_x, dude.x)
  end)

  it('should not move left if colliding with one object', function()
    local stationary = { { x = default_x } }
    collision.left:should_be_called_with(dude, stationary[1]):and_will_return(true):when(function()
      move.left(dude, stationary, delta_time)
    end)
    assert.equal(default_x, dude.x)
  end)

  it('should not move right if colliding with one of many objects', function()
    local stationary = { { x = default_x }, { x = default_x }, { x = default_x }, { x = default_x } }
    collision.right:may_be_called_with(dude, stationary[1]):and_will_return(false):
      and_also(collision.right:may_be_called_with(dude, stationary[2]):and_will_return(true)):
      and_also(collision.right:may_be_called_with(dude, stationary[3]):and_will_return(false)):
      and_also(collision.right:may_be_called_with(dude, stationary[4]):and_will_return(false)):
      when(function()
        move.right(dude, stationary, delta_time)
      end)
    assert.equal(default_x, dude.x)
  end)

  it('should not move left if colliding with one of many objects', function()
    local stationary = { { x = default_x }, { x = default_x }, { x = default_x }, { x = default_x } }
    collision.left:may_be_called_with(dude, stationary[1]):and_will_return(false):
      and_also(collision.left:may_be_called_with(dude, stationary[2]):and_will_return(false)):
      and_also(collision.left:may_be_called_with(dude, stationary[3]):and_will_return(true)):
      and_also(collision.left:may_be_called_with(dude, stationary[4]):and_will_return(false)):
      when(function()
        move.left(dude, stationary, delta_time)
      end)
    assert.equal(default_x, dude.x)
  end)

  it('should align moving object with stationary if they overlap while moving right', function()
    local stationary = {
      { x = 17 },
      { x = 13 }
    }
    collision.right:may_be_called_with(dude, stationary[1]):and_will_return(true):
      and_also(collision.right:may_be_called_with(dude, stationary[2]):and_will_return(false)):
      when(function()
        move.right(dude, stationary, delta_time)
      end)
    assert.equal(stationary[1].x, dude.x)
  end)

  it('should align moving object with stationary if they overlap while moving left', function()
    local stationary = {
      { x = 17 },
      { x = 13 }
    }
    collision.left:may_be_called_with(dude, stationary[1]):and_will_return(false):
      and_also(collision.left:may_be_called_with(dude, stationary[2]):and_will_return(true)):
      when(function()
        move.left(dude, stationary, delta_time)
      end)
    assert.equal(stationary[2].x, dude.x)
  end)
end)
