// begin step

if ((objplayer.key_slide && objplayer.slide > 0 && objplayer.key_left) || (objplayer.key_slide && objplayer.slide > 0 && objplayer.key_right))
    image_alpha = 0
else
    image_alpha = 1


// step

if (mouse_x <= objplayer.x)
{
    image_xscale = -1
    x = (objplayer.x - 8)
    y = (objplayer.y - 22)
}
else
{
    image_yscale = 1
    x = (objplayer.x + 8)
    y = (objplayer.y - 22)
}
if (objplayer.flash > 0)
    sprite_index = sprplayergrenadethrowBLUE
if (objplayer.flash > 0 && global.playerHp < 100)
    sprite_index = sprplayergrenadethrowRED
if (objplayer.key_crouch && mouse_x <= objplayer.x)
{
    x = (objplayer.x - 8)
    y = (objplayer.y - 14)
}
if (objplayer.key_crouch && mouse_x >= objplayer.x)
{
    x = (objplayer.x + 8)
    y = (objplayer.y - 14)
}

// other step

instance_destroy()
