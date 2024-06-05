// create

display_set_gui_size(1920, 1080)
showfloppy = 1
alarm[0] = (3 * room_speed)

// alarm

showfloppy = 0

// step

if (showfloppy == 0)
    instance_destroy(objautosavevisual)

// draw

if (showfloppy == 1 && global.onward == 0 && (!instance_exists(objblackbars)) && (!instance_exists(objblackbars2)) && (!instance_exists(objblackbars3)) && (!instance_exists(objblackbars4)))
    draw_sprite(sprfloppy, -1, 1825, 990)
