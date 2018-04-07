return {
  right = function(moving, stationary, delta_time)
    moving.x = moving.x + (moving.x * delta_time)
  end,
  left = function(moving, stationary, delta_time)
    moving.x = moving.x - (moving.x * delta_time)
  end
}
