// create event and variables

cursor_sprite = 384
display_set_gui_size(1920, 1080)
gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
gui_margin = 32
menu_x = ((gui_width / 2) - 1500)
menu_y = (gui_height - gui_margin)
menu_x_target = (((gui_width / 2) + 35) - gui_margin)
menu_speed = 15
menu_itemheight = font_get_size(fMenu)
menu_font = 0
menu_committed = -1
menu_control = 1
menu[4] = "NEW GAME"
menu[3] = "OPTIONS"
menu[2] = "CONTROLS"
menu[1] = "CREDITS"
menu[0] = "QUIT"
menu_items = array_length_1d(menu)
menu_top = (menu_y - ((menu_itemheight * 2) * menu_items))
menu_cursor = 4
createonce = 1

// step event

menu_x += ((menu_x_target - menu_x) / menu_speed)
if menu_control
{
    var mouse_y_gui = device_mouse_y_to_gui(0)
    if (mouse_y_gui < menu_y && mouse_y_gui > menu_top)
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
if (menu_x > (gui_width + 150) && menu_committed != -1)
{
    switch menu_committed
    {
        case 4:
            SlideTransition(2, 16)
            audio_sound_gain(introsong, 0, 2500)
            audio_sound_gain(themenointro, 0, 2500)
            global.saveslot1 = 1
            break
        case 3:
            SlideTransition(2, 9)
            break
        case 2:
            SlideTransition(2, 6)
            break
        case 1:
            SlideTransition(2, 8)
            break
        case 0:
            game_end()
            break
    }

}


// draw event

draw_set_font(fMenu)
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
for (var i = 0; i < menu_items; i++)
{
    var offset = 2
    var txt = menu[i]
    if (menu_cursor == i)
    {
        txt = string_insert("", txt, 0)
        var col = c_white
    }
    else
        col = c_gray
    var xx = menu_x
    var yy = (menu_y - (menu_itemheight * (i * 2)))
    draw_set_color(c_black)
    draw_text((xx - offset), yy, txt)
    draw_text((xx + offset), yy, txt)
    draw_text(xx, (yy - offset), txt)
    draw_text(xx, (yy + offset), txt)
    draw_set_color(col)
    draw_text(xx, yy, txt)
}
