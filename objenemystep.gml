hsp = (dirr * movespeed)
vsp += grav
move_push()
if (!(place_meeting(x, y, objdumbgroundenemy)))
{
    hspeed_push_ = lerp(hspeed_push_, 0, 0.1)
    vspeed_push_ = lerp(vspeed_push_, 0, 0.1)
}
if place_meeting((x + hsp), y, objwall)
{
    while (!(place_meeting((x + sign(hsp)), y, objwall)))
        x += sign(hsp)
    hsp = 0
    dirr *= -1
}
x += hsp
if place_meeting(x, (y + vsp), objwall)
{
    while (!(place_meeting(x, (y + sign(vsp)), objwall)))
        y += sign(vsp)
    vsp = 0
}
y += vsp
if (health_ <= 0)
{
    instance_destroy()
    instance_create_layer(x, y, "EnemyLayer", objdeath)
    var drop = irandom(50)
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
            if (global.playerHp < 100)
                instance_create_layer(x, y, "Bullet_Layer", objhealthPICKUP)
            break
        case 11:
            if (global.playerHp < 200 && global.playerHp > 100)
                instance_create_layer(x, y, "Bullet_Layer", objshieldPICKUP)
            break
        case 12:
            if (global.playerHp < 100)
                instance_create_layer(x, y, "Bullet_Layer", objhealthPICKUP)
        case 13:
            if (global.playerHp < 200 && global.playerHp > 100)
                instance_create_layer(x, y, "Bullet_Layer", objshieldPICKUP)
            break
    }

}
if ((x - xprevious) != 0 && knockback == 0)
    image_xscale = sign((x - xprevious))
