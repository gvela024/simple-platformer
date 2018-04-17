return function(collide)
  local function there_is_at_least_one(stationary)
    return #stationary > 0
  end

  local function in_collision(direction, moving, stationary)
    -- according to StackOverflow, it would be faster to iterate with simple for loop
    -- with an index
    for _, motionless in pairs(stationary) do
      if direction(moving, motionless) then return true, motionless end
    end
    return false
  end

  return {
    right = function(moving, stationary, delta_time)
      if there_is_at_least_one(stationary) then
        local colliding, object = in_collision(collide.right, moving, stationary)
        if not colliding then
          moving.x = moving.x + (moving.x * delta_time)
        else
          moving.x = object.x
        end
      else
        moving.x = moving.x + (moving.x * delta_time)
      end
    end,
    left = function(moving, stationary, delta_time)
      if there_is_at_least_one(stationary) then
        local colliding, object = in_collision(collide.left, moving, stationary)
        if not colliding then
          moving.x = moving.x - (moving.x * delta_time)
        else
          moving.x = object.x 
        end
      else
        moving.x = moving.x - (moving.x * delta_time)
      end
    end
  }
end
