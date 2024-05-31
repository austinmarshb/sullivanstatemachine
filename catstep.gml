if place_meeting((x + hsp), y, objwall)
{
    while (!(place_meeting((x + sign(hsp)), y, objwall)))
        x += sign(hsp)
    hsp = 0
}
x += hsp
if place_meeting(x, (y + vsp), objwall)
{
    while (!(place_meeting(x, (y + sign(vsp)), objwall)))
        y += sign(vsp)
    vsp = 0
}
y += vsp
switch state
{
    case 0:
        moving = 0
        sprite_index = sprcatstand
        dir = sign((objplayer.x - x))
        hsp = 0
        vsp = min(7, (vsp + 0.05))
        if (distance_to_object(objplayer) > 25)
            state = 2
        break
    case 2:
        moving = 0
        sprite_index = sprcatrun
        dir = sign((objplayer.x - x))
        hsp = (dir * spd)
        vsp = min(7, (vsp + 0.05))
        if (abs((objplayer.x - x)) < 25)
        {
            hsp = 0
            sprite_index = sprcatstand
        }
        break
    case 4:
        sprite_index = sprcatjump
        move_towards_point(objplayer.x, (objplayer.y - 23), 2.5)
        break
    case 3:
        sprite_index = sprcatsit
        depth = 500
        x = (objplayer.x - 2)
        y = (objplayer.y - 23)
        if (mouse_x < objplayer.x)
        {
            image_xscale = -1
            x = (objplayer.x + 2)
            y = (objplayer.y - 23)
        }
        if (mouse_x > objplayer.x)
        {
            image_xscale = 1
            x = (objplayer.x - 5)
            y = (objplayer.y - 23)
        }
        if ((objplayer.key_slide && objplayer.key_right && objplayer.slide >= 1 && objplayer.canslide == 1 && mouse_x > objplayer.x) || (objplayer.key_slide && objplayer.key_left && objplayer.slide >= 1 && objplayer.canslide == 1 && mouse_x > objplayer.x))
        {
            x = (objplayer.x - 5)
            y = (objplayer.y - 2)
            image_angle = 90
        }
        else if (mouse_x > objplayer.x)
        {
            image_xscale = 1
            x = (objplayer.x - 5)
            y = (objplayer.y - 23)
            image_angle = 0
        }
        if ((objplayer.key_slide && objplayer.key_right && objplayer.slide >= 1 && objplayer.canslide == 1 && mouse_x < objplayer.x) || (objplayer.key_slide && objplayer.key_left && objplayer.slide >= 1 && objplayer.canslide == 1 && mouse_x < objplayer.x))
        {
            x = (objplayer.x + 5)
            y = (objplayer.y - 2)
            image_xscale = -1
            image_angle = 270
        }
        else if (mouse_x < objplayer.x)
        {
            image_xscale = -1
            x = objplayer.x
            y = (objplayer.y - 23)
            image_angle = 0
        }
        if objplayer.key_crouch
            y = (objplayer.y - 16)
}

if (place_meeting(x, y, objplayer) && catmount == 1)
{
    catmount = 0
    state = 3
}
