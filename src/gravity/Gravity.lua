return function(collision, gravities)
  local function not_colliding_with_something(moving, stationary)
    for _, object in pairs(stationary) do
      if not collision.down(moving, object) then
        return true
      end
    end

    return false
  end

  return function(moving, stationary, delta_time)
    if not_colliding_with_something(moving, stationary) then
      moving.y = moving.y - (gravities * (delta_time ^ 2))
    end
  end
end
