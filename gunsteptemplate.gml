if (objplayer.flash > 0 && (!objplayer.key_fire))
    sprite_index = sprhandgunBLUE
if (objplayer.flash > 0 && global.playerHp < 100 && (!objplayer.key_fire))
    sprite_index = sprhandgunRED
if (instance_exists(objhitbox) && objhitbox.x > objplayer.x)
{
    canshoot = 0
    sprite_index = sprhandgunUP
    image_angle = 0
    image_xscale = 1
}
if (instance_exists(objhitbox) && objhitbox.x < objplayer.x)
{
    canshoot = 0
    sprite_index = sprhandgunUP
    image_xscale = -1
    image_angle = 0
}
else
{
    image_xscale = 1
    canshoot = 1
}
if (instance_exists(objhitbox) && objhitbox.x > objplayer.x && objplayer.flash > 0)
{
    canshoot = 0
    sprite_index = sprhandgunUPBLUE
    image_angle = 0
    image_xscale = 1
}
if (instance_exists(objhitbox) && objhitbox.x > objplayer.x && objplayer.flash > 0 && global.playerHp < 100)
{
    canshoot = 0
    sprite_index = sprhandgunUPRED
    image_angle = 0
    image_xscale = 1
}
if (instance_exists(objhitbox) && objhitbox.x < objplayer.x && objplayer.flash > 0)
{
    canshoot = 0
    sprite_index = sprhandgunUPBLUE
    image_xscale = -1
    image_angle = 0
}
if (instance_exists(objhitbox) && objhitbox.x < objplayer.x && objplayer.flash > 0 && global.playerHp < 100)
{
    canshoot = 0
    sprite_index = sprhandgunUPRED
    image_xscale = -1
    image_angle = 0
}
if (objplayer.key_crouch && objplayer.key_fire && firingdelay < 0 && canshoot == 1 && objplayer.image_alpha == 1)
{
    audio_play_sound(handgunshot, 2, false)
    recoil = 6
    firingdelay = 3
    with (instance_create_layer(x, y, "Bullet_Layer", objhandgunbullet))
    {
        speed = 12
        direction = (other.image_angle + random_range(-1, 1))
        image_angle = direction
    }
}
else if (objplayer.key_fire && firingdelay < 0 && canshoot == 1 && objplayer.image_alpha == 1)
{
    audio_play_sound(handgunshot, 2, false)
    recoil = 6
    firingdelay = 3
    with (instance_create_layer(x, y, "Bullet_Layer", objhandgunbullet))
    {
        speed = 12
        direction = (other.image_angle + random_range(-5, 5))
        image_angle = direction
    }
}
if (objplayer.key_crouch && mouse_x >= objplayer.x)
{
    x = objplayer.x
    y = (objplayer.y - 17)
    x -= lengthdir_x(recoil, image_angle)
    y -= lengthdir_y(recoil, image_angle)
}
else
{
    x = objplayer.x
    y = (objplayer.y - 22)
    x -= lengthdir_x(recoil, image_angle)
    y -= lengthdir_y(recoil, image_angle)
}
if (objplayer.key_crouch && mouse_x <= objplayer.x)
{
    x = objplayer.x
    y = (objplayer.y - 17)
    x -= lengthdir_x(recoil, image_angle)
    y -= lengthdir_y(recoil, image_angle)
}
if (image_angle > 90 && image_angle < 270)
    image_yscale = -1
else
    image_yscale = 1
if ((objplayer.key_slide && mouse_x <= (objplayer.x + 1) && objplayer.key_left && objplayer.slide >= 0 && objplayer.canslide == 1) || (objplayer.key_slide && mouse_x <= (objplayer.x + 1) && objplayer.key_right && objplayer.slide >= 0 && objplayer.canslide == 1))
{
    x = (objplayer.x + 3)
    y = (objplayer.y - 9)
    x -= lengthdir_x(recoil, image_angle)
    y -= lengthdir_y(recoil, image_angle)
}
if ((objplayer.key_slide && mouse_x >= (objplayer.x - 1) && objplayer.key_right && objplayer.slide >= 0 && objplayer.canslide == 1) || (objplayer.key_slide && objplayer.slide >= 0 && mouse_x >= (objplayer.x - 1) && objplayer.key_left && objplayer.canslide == 1))
{
    x = (objplayer.x - 3)
    y = (objplayer.y - 9)
    x -= lengthdir_x(recoil, image_angle)
    y -= lengthdir_y(recoil, image_angle)
}
if (objplayer.key_grenade && instance_exists(objgrenadethrow) && objgrenadethrow.x < objplayer.x && objplayer.flash > 0)
{
    sprite_index = sprhandgunUPBLUE
    image_angle = 180
}
if (objplayer.key_grenade && instance_exists(objgrenadethrow) && objgrenadethrow.x > objplayer.x && objplayer.flash > 0)
{
    sprite_index = sprhandgunUPBLUE
    image_angle = 0
    image_xscale = 1
}
if (objplayer.key_grenade && instance_exists(objgrenadethrow) && objgrenadethrow.x < objplayer.x && objplayer.flash > 0 && global.playerHp < 100)
{
    sprite_index = sprhandgunUPRED
    image_angle = 180
}
if (objplayer.key_grenade && instance_exists(objgrenadethrow) && objgrenadethrow.x > objplayer.x && objplayer.flash > 0 && global.playerHp < 100)
{
    sprite_index = sprhandgunUPRED
    image_angle = 0
    image_xscale = 1
}
