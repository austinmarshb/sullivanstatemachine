// create

createdonce = 0

// collision event

if ((!instance_exists(objtext)) && createdonce == 0 && global.bossroom == 0)
{
    createdonce = 1
    instance_destroy(objdrawGUI)
    instance_create_layer(x, y, "Instances_Pause", objblackbars)
    with (instance_create_layer(objplayer.x, (objplayer.y - 48), "Instances_Pause", objtext))
    {
        text = other.text
        length = string_length(text)
    }
    with (objsmoothcameracrosshair)
        follow = other.id
}
