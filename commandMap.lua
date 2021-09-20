local Commands = dofile('commands.lua')

return {
    escape = { Commands.Reload },

    left  = {
        Commands.MoveLeft,
        Commands.MoveLeftScreen,
        Commands.MoveAllLeft,
        Commands.MoveAllLeftScreen,
    },

    right = {
        Commands.MoveRight,
        Commands.MoveRightScreen,
        Commands.MoveAllRight,
        Commands.MoveAllRightScreen,
    },

    up = {
        Commands.MoveFull,
        Commands.FullScreen,
        Commands.MoveAllFull,
    },

    pageup = {
        Commands.SoundUp,
        Commands.BrightnessUp,
    },

    pagedown = {
        Commands.SoundDown,
        Commands.BrightnessDown,
    },

    f15  = { Commands.Mute }, -- Pause
    help = { Commands.Play }, -- Insert
}
