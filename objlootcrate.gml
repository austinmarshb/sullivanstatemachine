// create

doonce = 1
gunspawn = 0
spritechange = 0
fadeaway = 0
givegun = 0

// alarm 0

gunspawn = 1

// alarm 1

spritechange = 1
alarm[2] = (15 * room_speed)

// alarm 2

fadeaway = 1

// step

if (doonce == 0 && gunspawn == 1 && global.playerHp >= 100)
{
    gunspawn = 0
    var drop3 = irandom(12)
    switch drop3
    {
        case 0:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objlightriflePICKUP)
            break
        case 1:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objplasmazookaPICKUP)
            break
        case 2:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objlasergunPICKUP)
            break
        case 3:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objlightninggunPICKUP)
            break
        case 4:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objsniperriflePICKUP)
            break
        case 5:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objflamethrowerPICKUP)
            break
        case 6:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objcrossgunPICKUP)
            break
        case 7:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objuziPICKUP)
            break
        case 8:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objshotgunPICKUP)
            break
        case 9:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objgrenadePICKUP)
            break
        case 10:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objsullivanbowPICKUP)
            break
        case 11:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objflakgunPICKUP)
            break
        case 12:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objneedlegunPICKUP)
            break
        case 13:
            instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
            instance_create_layer(x, (y - 28), "Bullet_Layer", objpeashooterPICKUP)
            break
    }

}
else if (doonce == 0 && gunspawn == 1 && global.playerHp < 100)
{
    gunspawn = 0
    instance_create_layer(x, (y - 40), "Bullet_Layer", objspawnflare)
    instance_create_layer(x, (y - 28), "Bullet_Layer", objhealthPICKUP)
}
if (spritechange == 1)
    sprite_index = sprlootcrateOFF
if (fadeaway == 1)
    image_alpha -= 0.05
if (image_alpha == 0)
    instance_destroy()

// collision

if (doonce == 1)
{
    audio_play_sound(chestopen, 2, false)
    doonce = 0
    sprite_index = sprlootcrateOPEN
    alarm[0] = (1.25 * room_speed)
    alarm[1] = (2 * room_speed)
}
global.crate = 1
