local function rightmost_edge(object)
  return object.x + object.width
end

local function leftmost_edge(object)
  return object.x
end

local function topmost_edge(object)
  return object.y
end

local function bottommost_edge(object)
  return object.y + object.height
end

local function above_or_below(object1, object2)
  return topmost_edge(object1) >= bottommost_edge(object2) or
    bottommost_edge(object1) <= topmost_edge(object2)
end

local function right(object1, object2)
  return rightmost_edge(object1) >= leftmost_edge(object2) and
    not (leftmost_edge(object1) >= rightmost_edge(object2)) and
    not above_or_below(object1, object2)
end

local function left(object1, object2)
  return leftmost_edge(object1) <= rightmost_edge(object2) and
  not (rightmost_edge(object1) <= leftmost_edge(object2)) and 
  not above_or_below(object1, object2)
end

return {
  right = right,
  left = left,
  -- up = up,
  -- down = down
}
