return function(config)
  player = {}
  player.height = 35
  player.width = 35
  player.x = config.origin.x
  player.y = config.origin.y - player.height
  player.red = 255
  player.green = 165
  player.blue = 0
  player.speed = 5
  player.name = 'Ralph'

  player.draw = function()
    config.set_color(player.red, player.green, player.blue)
    config.draw('fill', player.x, player.y, player.width, player.height)
  end

  return player
end
