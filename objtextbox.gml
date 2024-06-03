objdesertbossDROPIN.doonce = 0
camera_set_view_target(view_camera[0], 76)
camera_set_view_size(view_camera[0], 480, 270)
objsmoothcameracrosshair.x = objsmoothcameracrosshair.x
objsmoothcameracrosshair.y = objsmoothcameracrosshair.y
objplayer.image_alpha = 1
instance_destroy(objblackbars3)
instance_create_layer(x, y, "Instances_Pause", objblackbars4)
instance_create_layer(x, y, "Instances_Pause", objdrawGUI)
cursor_sprite = 384
objplayer.x = objcameratriggerdesert.x
objplayer.y = (objcameratriggerdesert.y + 32)
if instance_exists(objhandgun)
    objhandgun.image_alpha = 1
if instance_exists(objlightrifle)
    objlightrifle.image_alpha = 1
if instance_exists(objshotgun)
    objshotgun.image_alpha = 1
if instance_exists(objplasmazooka)
    objplasmazooka.image_alpha = 1
if instance_exists(objsniperrifle)
    objsniperrifle.image_alpha = 1
if instance_exists(objflamethrower)
    objflamethrower.image_alpha = 1
if instance_exists(objlightninggun)
    objlightninggun.image_alpha = 1
if instance_exists(objcrossgun)
    objcrossgun.image_alpha = 1
if instance_exists(objlasergun)
    objlasergun.image_alpha = 1
if instance_exists(objuzi)
    objuzi.image_alpha = 1
if instance_exists(objmagnum)
    objmagnum.image_alpha = 1
if instance_exists(objneedlegun)
    objneedlegun.image_alpha = 1
if instance_exists(objflakgun)
    objflakgun.image_alpha = 1
if instance_exists(objsullivanbow)
    objsullivanbow.image_alpha = 1
if instance_exists(objpeashooter)
    objpeashooter.image_alpha = 1
if instance_exists(objquiver)
    objquiver.image_alpha = 1
if instance_exists(objfueltank)
    objfueltank.image_alpha = 1
objplayer.image_alpha = 1
instance_destroy(103048)
instance_destroy(103049)
instance_destroy(103050)
instance_create_layer(x, y, "Instances_Pause", objdesertbosstimer)
instance_destroy()

camera_set_view_target(view_camera[0], 276)
camera_set_view_size(view_camera[0], 240, 135)
objsmoothcameracrosshair.x = objdesertbossDROPIN.x
objsmoothcameracrosshair.y = objdesertbossDROPIN.y
audio_play_sound(desertbossappear, 2, false)

if (spawnonce == 1)
{
    instance_create_layer(479, 608, "EnemyLayer2", objdesertbossDROPIN)
    spawnonce = 0
}
if (doonce == 1 && instance_exists(objdesertbossDROPIN))
{
    audio_play_sound(bossmusic, 1, true)
    instance_create_layer(x, y, "Instances_Pause", objblackbars3)
    instance_destroy(objdrawGUI)
    cursor_sprite = 324
    objplayer.image_alpha = 0
    objplayer.x = objdesertbossDROPIN.x
    objplayer.y = objdesertbossDROPIN.y
    alarm[0] = (5 * room_speed)
    alarm[1] = (2.5 * room_speed)
    doonce = 0
}
