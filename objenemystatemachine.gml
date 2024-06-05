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
        sprite_index = sprsoldierenemyidle
        dir = sign((objplayer.x - x))
        hsp = 0
        vsp = min(7, (vsp + 0.05))
        if (distance_to_object(objplayer) < 200 && (!(collision_line(x, (y - 30), objplayer.x, (objplayer.y - 25), objwall, true, false))))
            state = 2
        break
    case 2:
        sprite_index = sprsoldierenemyrun
        dir = sign((objplayer.x - x))
        hsp = (dir * spd)
        vsp = min(7, (vsp + 0.05))
        if (abs((objplayer.x - x)) < 5)
        {
            hsp = 0
            sprite_index = sprsoldierenemystand
        }
        else if (takingdamage == 1 || abs((objplayer.x - x)) > 5)
            state = 2
        if (distance_to_object(objplayer) > 200)
            state = 3
        if collision_line(x, (y - 30), objplayer.x, (objplayer.y - 25), objwall, true, false)
            state = 0
        break
    case 3:
        sprite_index = sprsoldierenemystand
        dir = sign((objplayer.x - x))
        hsp = 0
        vsp = min(7, (vsp + 0.05))
        if (distance_to_object(objplayer) < 200 && (!(collision_line(x, (y - 30), objplayer.x, (objplayer.y - 25), objwall, true, false))))
            state = 2
        break
}

if ((state == 0 && takingdamage == 1) || (state == 3 && takingdamage == 1))
{
    state = 2
    sprite_index = sprsoldierenemyrun
    alarm[3] = (1 * room_speed)
}
