if (hascontrol && cancontrol)
{
    key_left = (keyboard_check(vk_left) || keyboard_check(ord("A")))
    key_right = (keyboard_check(vk_right) || keyboard_check(ord("D")))
    key_jump = (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_stickr))
    key_slide = (keyboard_check(ord("S")) || keyboard_check(vk_down) || gamepad_button_check(0, gp_stickl) || gamepad_button_check(0, gp_face3))
    key_crouch = (keyboard_check(vk_lcontrol) || keyboard_check(vk_rcontrol) || keyboard_check(ord("C")) || gamepad_button_check(0, gp_shoulderlb))
    key_fire = (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_shoulderrb))
    key_grenade = (mouse_check_button(mb_right) || gamepad_button_check(0, gp_shoulderr))
    key_melee = (mouse_check_button_pressed(mb_middle) || keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0, gp_face2) || gamepad_button_check_pressed(0, gp_shoulderl))
    key_drop = (keyboard_check(ord("V")) || gamepad_button_check_pressed(0, gp_face4))
    if (keyboard_check(vk_left) || keyboard_check(ord("A")) || keyboard_check(vk_right) || keyboard_check(ord("D")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up))
        controller = 0
    if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
    {
        key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0))
        key_right = max(gamepad_axis_value(0, gp_axislh), 0)
        controller = 1
    }
}
if key_drop
    global.ammo = 0
var move = (key_right - key_left)
vsp += grv
if (!instance_exists(objonice))
    regularwalk = 1
if instance_exists(objonice)
    regularwalk = 0
if (regularwalk == 1)
    hsp = (move * walksp)
if (regularwalk == 0 && move != 0)
    hsp = (move * walksp)
else
    hsp = lerp(hsp, 0, 0.05)
var grounded = place_meeting(x, (y + 1), objwall)
if (key_jump && jump_amount < max_jumps && (!key_crouch))
{
    vsp = (-7 + (!grounded))
    jump_amount += 1
    grounded = 0
}
if grounded
    jump_amount = 0
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
if (mouse_check_button(mb_left) && hsp == 0)
    image_index = 1
if ((key_right && mouse_x > objplayer.x) || (abs(gamepad_axis_value(0, gp_axislh)) > 0.2 && mouse_x > objplayer.x))
{
    image_xscale = 1
    sprite_index = sprplayerrun
}
else
{
    sprite_index = sprplayerstand
    image_angle = direction
}
if ((key_left && mouse_x < objplayer.x) || (abs(gamepad_axis_value(0, gp_axislh)) > 0.2 && mouse_x < objplayer.x))
{
    image_xscale = -1
    sprite_index = sprplayerrun
}
if (key_right && key_left)
    sprite_index = sprplayerstand
if (mouse_x >= objplayer.x)
    image_xscale = 1
if (key_grenade && mouse_x > objplayer.x && global.grenades > 0 && cancontrol == 1 && cangrenade == 1)
{
    cangrenade = 0
    with (instance_create_layer((x + 2), (y - 18), "Bullet_Layer", objgrenadeRIGHT))
    {
        if ((!key_slide) && objplayer.slide > 0)
            instance_create_layer(x, y, "Bullet_Layer", objgrenadethrow)
        global.grenades--
    }
}
if (key_grenade && mouse_x < objplayer.x && global.grenades > 0 && cancontrol == 1 && cangrenade == 1)
{
    cangrenade = 0
    with (instance_create_layer((x - 2), (y - 18), "Bullet_Layer", objgrenadeLEFT))
    {
        if ((!key_slide) && objplayer.slide > 0)
            instance_create_layer(x, y, "Bullet_Layer", objgrenadethrow)
        global.grenades--
    }
}
if (!(place_meeting(x, (y + 1), objwall)))
    sprite_index = sprplayerjump
if (mouse_x <= objplayer.x)
    image_xscale = -1
if ((mouse_x <= objplayer.x && hsp > 0 && key_right && vsp == 0 && place_meeting(x, (y + 1), objwall)) || (mouse_x <= objplayer.x && hsp > 0 && abs(gamepad_axis_value(0, gp_axislh)) > 0.2 && vsp == 0 && place_meeting(x, (y + 1), objwall)))
{
    sprite_index = sprplayermoonwalk
    image_xscale = -1
}
if ((mouse_x >= objplayer.x && hsp < 0 && key_left && vsp == 0 && place_meeting(x, (y + 1), objwall)) || (mouse_x >= objplayer.x && hsp < 0 && abs(gamepad_axis_value(0, gp_axislh)) > 0.2 && vsp == 0 && place_meeting(x, (y + 1), objwall)))
    sprite_index = sprplayermoonwalk
if key_crouch
{
    sprite_index = sprplayercrouch
    mask_index = sprplayercrouchMASK
}
if ((key_slide && key_right && slide >= 1 && canslide == 1) || (key_slide && key_left && slide >= 1 && canslide == 1))
{
    sprite_index = sprplayerslide
    mask_index = sprplayerslideMASK
    move_snap(4, 0)
}
if ((key_slide && key_right && (!key_crouch)) || (key_slide && key_left && (!key_crouch)))
{
    instance_destroy(objhitbox)
    slide -= 4
    slidecooldown = 3
}
if (slide >= maximumslide)
    slide = maximumslide
else
    slide += 2
if (slide < 0)
    slide = minimumslide
if key_crouch
{
    canslide = 0
    walksp = 0
}
else
{
    canslide = 1
    walksp = 2.5
}
if (place_meeting(x, (y + 1), objwall) && smoke == 1 && mask_index == sprplayermoonwalkMASK)
{
    part_particles_create(global.P_System, x, y, global.Particle5, 1)
    smoke = 0
}
if place_meeting((x - 1), y, objwall2)
{
    sprite_index = sprplayerstand
}
