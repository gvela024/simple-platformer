return function(config)
  platforms = {}

  table.insert(platforms, {
    name = 'a',
    height = 10,
    width = 350,
    x = 0,
    y = love.graphics.getHeight() - 75,
    red = 75,
    green = 165,
    blue = 255
  })
  platforms[1].draw = function()
    config.set_color(platforms[1].red, platforms[1].green, platforms[1].blue)
    config.draw('fill', platforms[1].x, platforms[1].y, platforms[1].width, platforms[1].height)
  end

  table.insert(platforms, {
    name = 'b',
    height = 10,
    width = 250,
    x = platforms[1].x + platforms[1].width + (35 * 3),
    y = love.graphics.getHeight() - 75,
    red = 90,
    green = 120,
    blue = 255
  })
  platforms[2].draw = function()
    config.set_color(platforms[2].red, platforms[2].green, platforms[2].blue)
    config.draw('fill', platforms[2].x, platforms[2].y, platforms[2].width, platforms[2].height)
  end

  table.insert(platforms, {
    name = 'c',
    height = 30,
    width = 15,
    x = platforms[1].x + 125 + (35 * 2),
    y = love.graphics.getHeight() - 75 - 30,
    red = 90,
    green = 120,
    blue = 255
  })
  platforms[3].draw = function()
    config.set_color(platforms[3].red, platforms[3].green, platforms[3].blue)
    config.draw('fill', platforms[3].x, platforms[3].y, platforms[3].width, platforms[3].height)
  end
  return platforms
end
