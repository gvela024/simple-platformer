return function(colliding)
  return {
    right = function(moving, stationary, delta_time)
      if #stationary > 0 then
        if not colliding.right(moving, stationary[1]) then
          moving.x = moving.x + (moving.x * delta_time)
        end
      else
        moving.x = moving.x + (moving.x * delta_time)
      end
    end,
    left = function(moving, stationary, delta_time)
      moving.x = moving.x - (moving.x * delta_time)
    end
  }
end
