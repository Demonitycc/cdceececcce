local recoilhook; recoilhook = Newhookfunction(Modules2.Camera.Recoil, function(...)
                local args = {...}
                if getgenv().novas.Recoilend then
                    local RecoilAmt = 0 / 100
                    args[1].Push = 0
                    args[1].CameraY = RecoilAmt
                    args[1].CameraX = RecoilAmt
                    args[1].CameraXShake = 0
                else
                    return recoilhook(...)
                end
                return recoilhook(...)
            end)
            --
            local oldjump; oldjumop = Newhookfunction(Modules2.Character.IsGrounded, function(...)
                if getgenv().novas.jumpshoot then
                    return true
                else
                    return oldjumop(...)
                end
                return oldjumop(...)
            end)
            --
            local oldsway; oldsway = Newhookfunction(Modules2.Camera.SetSwaySpeed, function(...)
                if getgenv().novas.NoSway then
                    return true
                else
                    return oldsway(...)
                end
                return oldsway(...)
            end)
