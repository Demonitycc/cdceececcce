function IsVisible2(startPos, endPos)
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Exclude
    rayParams.IgnoreWater = true

    local filterRaycastList = {workspace.Const.Ignore}

    rayParams.FilterDescendantsInstances = filterRaycastList

    local direction = (endPos - startPos).Unit
    local distance = (endPos - startPos).Magnitude
    local rayResult = workspace:Raycast(startPos, direction * distance, rayParams)

    local IsHittable = false

    while (rayResult ~= nil and rayResult.Instance ~= nil and rayResult.Instance.CollisionGroup == 'Pierceable') do
        table.insert(filterRaycastList, rayResult.Instance)
        rayParams.FilterDescendantsInstances = filterRaycastList
        rayResult = workspace:Raycast(startPos, direction * distance, rayParams)
        if (rayResult == nil or (rayResult.Instance ~= nil and rayResult.Instance.CollisionGroup ~= 'Pierceable')) then
            break
        end
    end

    if (rayResult == nil or (rayResult.Instance ~= nil and rayResult.Instance.Parent ~= nil and (rayResult.Instance.Parent:FindFirstChild("Head") or rayResult.Instance.Parent:FindFirstChild("HumanoidRootPart")))) then
        return true
    end

    return false
end

local saim; saim = hookfunction(unpack, newcclosure(function(...) 
  local args = {...}
  local stack = debug.getstack(1, 1)
  if typeof(stack[1][9]) == "CFrame" and getgenv().LPH.GG.Utility.Settings.SilentEnabled and getgenv().Target and getgenv().Target.Head then
      local targetHead = getgenv().Target.Head
      --
      if not targetHead then
          return saim(...)
      end
      --
      local Camera = game.workspace.CurrentCamera
      local cameraPosition = Camera.CFrame.Position
      local predictedPos = getgenv().BestPrediction(targetHead.Position, getgenv().PlayersVelocity or Vector3.new(0, 0, 0))
      if predictedPos then
          stack[1][9] = CFrame.lookAt(cameraPosition, predictedPos)
          if IsVisible2(stack[1][9].Position, stack[1][9].Position + (stack[1][9].LookVector * 4)) then
            stack[1][9] = stack[1][9] + (stack[1][9].LookVector * 4)
        end
      end
  else
      return saim(...)
  end
  return saim(...)
end))
