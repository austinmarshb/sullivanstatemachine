if (distance_to_object(objplayer) < 260 && firingdelay <= 0 && global.playerHp > 0 && (!(collision_line(x, y, objplayer.x, (objplayer.y - 20), objwall, true, false))))
{
    audio_play_sound(flyingdronebullet, 2, false)
    firingdelay = 250
    var dir = point_direction((x - 5), (y - 5), objplayer.x, ((objplayer.y - (objplayer.sprite_height / 2)) - 5))
    var x_offset = lengthdir_x(22, dir)
    var y_offset = lengthdir_y(20, dir)
    instance_create_layer((x + x_offset), (y + y_offset), "Instances_Walls", objdronegunfiring)
    with (instance_create_layer((x + x_offset), (y + y_offset), "Bullet_Layer", objdronebullet))
    {
        direction = point_direction(x, y, objplayer.x, ((objplayer.y - (objplayer.sprite_height / 2)) - 5))
        image_angle = direction
    }
}
firingdelay -= 1
move_push()
if (!(place_meeting(x, y, objflyingenemy)))
{
    hspeed_push_ = lerp(hspeed_push_, 0, 0.1)
    vspeed_push_ = lerp(vspeed_push_, 0, 0.1)
}
if mp_grid_path(global.grid, path, x, y, objplayer.x, (objplayer.y - 20), true)
    path_start(path, spd, path_action_stop, 0)
if (objplayer.x < x)
    image_xscale = -1
else
    image_xscale = 1

var dir = point_direction(x, y, objplayer.x, objplayer.y)
hspeed_ = lengthdir_x(speed_, dir)
vspeed_ = lengthdir_y(speed_, dir)
move_()
if (health_ <= 0)
{
    global.kill50 += 1
    global.kill100 += 1
    global.kill250 += 1
    global.kill500 += 1
    instance_create_layer(x, y, "EnemyLayer", objdeathflare)
    instance_create_layer(x, y, "EnemyLayer", objnut)
    instance_create_layer(x, y, "EnemyLayer", objnut)
    instance_create_layer(x, y, "EnemyLayer", objscrew)
    instance_create_layer(x, y, "EnemyLayer", objscrew)
    instance_create_layer(x, y, "EnemyLayer", objspring)
    instance_create_layer(x, y, "EnemyLayer", objspring)
    instance_create_layer(x, y, "EnemyLayer", objdronedead)
    if (audio_is_playing(dronedeath1) == 0 || audio_is_playing(dronedeath2) == 0 || audio_is_playing(dronedeath3) == 0 || audio_is_playing(dronedeath4) == 0)
    {
        var dronedeath = irandom(3)
        switch dronedeath
        {
            case 0:
                audio_play_sound(dronedeath1, 2, false)
                break
            case 1:
                audio_play_sound(dronedeath2, 2, false)
                break
            case 2:
                audio_play_sound(dronedeath3, 2, false)
                break
            case 3:
                audio_play_sound(dronedeath4, 2, false)
                break
        }

    }
    instance_destroy(id)
    var drop = irandom(180)
    switch drop
    {
        case 0:
            instance_create_layer(x, y, "Bullet_Layer", objlightriflePICKUP)
            break
        case 1:
            instance_create_layer(x, y, "Bullet_Layer", objplasmazookaPICKUP)
            break
        case 2:
            instance_create_layer(x, y, "Bullet_Layer", objlasergunPICKUP)
            break
        case 3:
            instance_create_layer(x, y, "Bullet_Layer", objlightninggunPICKUP)
            break
        case 4:
            instance_create_layer(x, y, "Bullet_Layer", objsniperriflePICKUP)
            break
        case 5:
            instance_create_layer(x, y, "Bullet_Layer", objflamethrowerPICKUP)
            break
        case 6:
            instance_create_layer(x, y, "Bullet_Layer", objcrossgunPICKUP)
            break
        case 7:
            instance_create_layer(x, y, "Bullet_Layer", objuziPICKUP)
            break
        case 8:
            instance_create_layer(x, y, "Bullet_Layer", objshotgunPICKUP)
            break
        case 9:
            instance_create_layer(x, y, "Bullet_Layer", objgrenadePICKUP)
            break
        case 10:
            instance_create_layer(x, y, "Bullet_Layer", objsullivanbowPICKUP)
            break
        case 11:
            instance_create_layer(x, y, "Bullet_Layer", objflakgunPICKUP)
            break
        case 12:
            instance_create_layer(x, y, "Bullet_Layer", objneedlegunPICKUP)
            break
        case 13:
            instance_create_layer(x, y, "Bullet_Layer", objpeashooterPICKUP)
            break
        case 14:
            instance_create_layer(x, y, "Bullet_Layer", objmagnumPICKUP)
            break
        case 15:
            if (global.playerHp < 100)
                instance_create_layer(x, y, "Bullet_Layer", objhealthPICKUP)
            break
        case 16:
            if (global.playerHp < 100)
                instance_create_layer(x, y, "Bullet_Layer", objhealthPICKUP)
            break
        case 17:
            if (global.playerHp < 100)
                instance_create_layer(x, y, "Bullet_Layer", objhealthPICKUP)
            break
        case 18:
            if (global.playerHp < 100)
                instance_create_layer(x, y, "Bullet_Layer", objhealthPICKUP)
            break
    }

}

var _pushspd = 1
var _col = instance_place(x, y, objflyingenemy)
if _col
{
    var _dist = (sign((x - _col.x)) * _pushspd)
    if (!(place_meeting((x + _dist), y, objwall)))
        x += _dist
}
