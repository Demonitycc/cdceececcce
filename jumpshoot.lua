local oldjump; oldjumop = Newhookfunction(Modules2.Character.IsGrounded, function(...)
    if getgenv().novas.jumpshoot then
        return true
    else
        return oldjumop(...)
    end
    return oldjumop(...)
end)
