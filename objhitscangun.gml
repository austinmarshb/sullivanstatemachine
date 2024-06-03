if gamepad_button_check_pressed(0, gp_start)
{
    instance_activate_all()
    pause = 0
    if (instance_exists(objblackbars) || instance_exists(objblackbars2))
        instance_deactivate_object(objdrawGUI)
    instance_destroy(obj_buttons)
    instance_destroy(obj_buttons2)
    if (global.learninglevel == 1)
        audio_resume_sound(learninglevel)
    if (global.firstlevel == 1)
        audio_resume_sound(firstlevelmusic)
    if (global.desertlevel == 1)
        audio_resume_sound(desertlevel)
    if (global.junglelevel == 1)
        audio_resume_sound(junglelevel)
    if (global.cavelevel == 1)
        audio_resume_sound(waterdrips)
    if (global.citylevel == 1)
        audio_resume_sound(citylevel)
    if (global.snowlevel == 1)
        audio_resume_sound(snowlevel)
    if (global.wartorn == 1)
        audio_resume_sound(firstsong)
    if (global.elevator == 1)
        audio_resume_sound(elevatormusic)
    if (global.bossroom == 1)
        audio_resume_sound(bossmusic)
    if (global.meowing == 1)
        audio_resume_sound(catsmeowing)
    if (!instance_exists(objpause1))
        instance_create_layer(x, y, "Instances_Pause", objpause1)
}


menu_x += ((menu_x_target - menu_x) / menu_speed)
if (menu_control && pause == 1)
{
    var mouse_y_gui = device_mouse_y_to_gui(0)
    var mouse_x_gui = device_mouse_x_to_gui(0)
    if (mouse_y_gui < menu_y && mouse_y_gui > menu_top && mouse_x_gui > (menu_x - 450))
    {
        menu_cursor = ((menu_y - mouse_y_gui) div (menu_itemheight * 2))
        if (mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1))
        {
            menu_x_target = (gui_width + 500)
            menu_committed = menu_cursor
            menu_control = 0
        }
    }
}
if (menu_x > (gui_width + 1) && menu_committed != -1)
{
    switch menu_committed
    {
        case 2:
            instance_create_layer(x, y, "Instances_Pause", objunpause)
            instance_destroy(obj_buttons)
            instance_destroy(obj_buttons2)
            break
        case 1:
            room_goto(room_menuAUTO)
            instance_destroy(objsavegame)
            audio_resume_all()
            global.saveslot1 = 0
            global.saveslot2 = 0
            global.onward = 0
            break
        case 0:
            global.saveslot1 = 0
            global.saveslot2 = 0
            global.onward = 0
            game_end()
            break
    }

}
if (pause == 0)
{
    instance_deactivate_object(obj_water)
    instance_deactivate_object(objspikes)
    instance_deactivate_object(objsnakepit)
    instance_deactivate_object(objbeartraps)
    instance_deactivate_object(objlasertrap)
    instance_deactivate_object(objlava)
    instance_deactivate_object(objwasp)
    instance_deactivate_object(objyellowwasp)
    instance_deactivate_object(objvulture)
    instance_deactivate_object(objflyingdino)
    instance_deactivate_object(objtucan)
    instance_deactivate_object(objzombiebird)
    instance_deactivate_object(objdrone)
    instance_deactivate_object(objflyingenemy)
    instance_deactivate_object(objdumbgroundenemy)
    instance_deactivate_object(objsmartgroundenemy)
    instance_deactivate_object(objenemygun)
    instance_deactivate_object(objskelebotspear)
}

