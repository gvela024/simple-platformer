describe('conllision', function()
  local collision = require 'movement.collision'

  it('should collide right when one mover is agianst one stationary', function()
    assert.truthy(collision.right({
      x = 5,
      y = 5,
      width = 10,
      height = 10
    }, {
      x = 5 + 10,
      y = 5,
      width = 10,
      height = 20
    }))

    assert.truthy(collision.right({
      x = 5,
      y = 5,
      width = 10,
      height = 10
    }, {
      x = 5 + 10,
      y = 7,
      width = 10,
      height = 1
    }))

    assert.truthy(collision.right({
      x = 5,
      y = 5,
      width = 10,
      height = 10
    }, {
      x = 5 + 10,
      y = 0,
      width = 10,
      height = 100
    }))
  end)

  it('should not collide right if stationary is to the left of moving', function()
    assert.falsy(collision.right({
      x = 125,
      y = 600 - 75 - 35,
      width = 35,
      height = 35
    }, {
      x = 0,
      y = 600 - 75 - 30,
      width = 15,
      height = 30
    }))
  end)

  it('should not collide right if stationary is above moving', function()
    assert.falsy(collision.right({
      x = 5,
      y = 5,
      width = 10,
      height = 10
    }, {
      x = 5 + 10 - 1,
      y = 100,
      width = 20,
      height = 2
    }))
  end)

  it('should not collide right if stationary is below moving object', function()
    assert.falsy(collision.right({
      x = 5,
      y = 5,
      width = 10,
      height = 10
    }, {
      x = 5 + 10,
      y = 100,
      width = 20,
      height = 2
    }))
  end)

  it('should collide left when one mover is agianst one stationary', function()
    assert.truthy(collision.left({
      x = 5,
      y = 5,
      width = 10,
      height = 10
    }, {
      x = 0,
      y = 5,
      width = 5,
      height = 10
    }))
  end)

  it('should not collide left if object is to the right of moving', function()
    assert.falsy(collision.left({
      x = 125,
      y = 600 - 75 - 35,
      width = 35,
      height = 35
    }, {
      x = 125 + (35 * 2),
      y = 600 - 75 - 30,
      width = 15,
      height = 30
    }))
  end)

  it('should not collide left if stationary is above moving', function()
    assert.falsy(collision.left({
      x = 5,
      y = 5,
      width = 10,
      height = 10
    }, {
      x = 0,
      y = 100,
      width = 10,
      height = 2
    }))

    assert.falsy(collision.left({
      x = 125,
      y = 600 - 75 - 35,
      width = 35,
      height = 35
    }, {
      x = 0,
      y = 600 - 75,
      width = 350,
      height = 10
    }))
  end)

  it('should not collide left if stationary is below moving object', function()
    assert.falsy(collision.left({
      x = 5,
      y = 5,
      width = 10,
      height = 10
    }, {
      x = 5,
      y = 100,
      width = 20,
      height = 2
    }))
  end)
end)
