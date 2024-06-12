// begin step

if (objplayer.image_xscale == -1)
{
    x = (objplayer.x - 8)
    y = (objplayer.y - 22)
}
if (objplayer.image_xscale == 1)
{
    image_yscale = 1
    x = (objplayer.x + 8)
    y = (objplayer.y - 22)
}

// step

if (objplayer.key_right && mouse_x <= objplayer.x)
{
    x = (objplayer.x - 7)
    y = (objplayer.y - 21)
}
if (objplayer.key_left && mouse_x >= objplayer.x)
{
    x = (objplayer.x + 7)
    y = (objplayer.y - 21)
}
if (objplayer.key_right && mouse_x >= objplayer.x)
{
    x = (objplayer.x + 9)
    y = (objplayer.y - 23)
}
if (objplayer.key_left && mouse_x <= objplayer.x)
{
    x = (objplayer.x - 9)
    y = (objplayer.y - 23)
}
if objplayer.key_crouch
{
    x = (objplayer.x - 9)
    y = (objplayer.y - 15)
}
if (objplayer.key_crouch && mouse_x >= objplayer.x)
{
    x = (objplayer.x + 9)
    y = (objplayer.y - 15)
}

// end step

if (objplayer.image_xscale == -1 && (!objplayer.key_crouch))
{
    x = (objplayer.x - 8)
    y = (objplayer.y - 22)
}
if (objplayer.image_xscale == 1 && (!objplayer.key_crouch))
{
    image_yscale = 1
    x = (objplayer.x + 8)
    y = (objplayer.y - 22)
}
