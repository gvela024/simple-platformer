return function(colliding)
  local function there_is_at_least_one(stationary)
    return #stationary > 0
  end

  local function in_collision(direction, moving, stationary)
    -- according to StackOverflow, it would be faster to iterate with simple for loop
    -- with an index
    for _, motionless in pairs(stationary) do
      if direction(moving, motionless) then return true end
    end
    return false
  end

  return {
    right = function(moving, stationary, delta_time)
      if there_is_at_least_one(stationary) then
        if not in_collision(colliding.right, moving, stationary) then
          moving.x = moving.x + (moving.x * delta_time)
        end
      else
        moving.x = moving.x + (moving.x * delta_time)
      end
    end,
    left = function(moving, stationary, delta_time)
      if there_is_at_least_one(stationary) then
        if not in_collision(colliding.left, moving, stationary) then
          moving.x = moving.x - (moving.x * delta_time)
        end
      else
        moving.x = moving.x - (moving.x * delta_time)
      end
    end
  }
end
