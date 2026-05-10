local gaming_mode_active = false
local base_x = 1920

local function toggle_gaming_mode()
    local new_x
    local message

    if not gaming_mode_active then
        new_x = base_x + 100
        gaming_mode_active = true
        message = "DP-1 shifted +100px right"
    else
        new_x = base_x
        gaming_mode_active = false
        message = "DP-1 restored to original position"
    end

    hl.dispatch(hl.dsp.exec_cmd(
        "hyprctl eval 'hl.monitor({ output=\"DP-1\", mode=\"1920x1080@165\", position=\"" .. new_x .. "x0\", scale=1 })'"
    ))

    hl.dispatch(hl.dsp.exec_cmd("notify-send 'Gaming Mode' '" .. message .. "'"))
end

hl.bind("SUPER + G", toggle_gaming_mode)
