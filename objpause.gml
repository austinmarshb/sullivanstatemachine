x = objplayer.x
y = (objplayer.y - 56)
letters += spd
text_current = string_copy(text, 1, floor(letters))
draw_set_font(fSpeech)
if (h == 0)
    h = string_height(text)
w = string_width(text_current)
if (letters >= length && alarm[0] < 1)
    alarm[0] = 180
if (letters >= length && destroytext == 1)
{
    instance_create_layer(x, y, "Instances_Pause", objblackbars2)
    instance_destroy(objblackbars)
    with (objsmoothcameracrosshair)
        follow = 0
    instance_destroy(id)
}
