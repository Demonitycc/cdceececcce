local saim; saim = hookfunction(unpack, newcclosure(function(...) 
  local args = {...}
  local stack = debug.getstack(1, 1)
  if typeof(stack[1][9]) == "CFrame" and getgenv().SilentEnabled and getgenv().Target and getgenv().Target.Head then
      local targetHead = getgenv().Target.Head
      --
      if not targetHead then
          return saim(...)
      end
      --
      local Camera = game.workspace.CurrentCamera
      local cameraPosition = Camera.CFrame.Position
      local predictedPos = getgenv().CalculateBulletDrop(targetHead.Position, getgenv().PlayersVelocity or Vector3.new(0, 0, 0))
      if predictedPos then
          stack[1][9] = CFrame.lookAt(cameraPosition, predictedPos)
      end
  else
      return saim(...)
  end
  return saim(...)
end))
