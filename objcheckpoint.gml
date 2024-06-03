global.checkpoint = 1
if (global.saveslot1 == 1 && (!instance_exists(objmenucheck)))
{
    if file_exists("SullivanSave.sav")
        file_delete("SullivanSave.sav")
    var file = file_text_open_write("SullivanSave.sav")
    file_text_write_real(file, 28)
    file_text_close(file)
    instance_create_layer(x, y, "Instances_Pause", objdrawGUI)
    instance_destroy()
}
if (global.saveslot2 == 1 && (!instance_exists(objmenucheck)))
{
    if file_exists("SullivanSave2.sav")
        file_delete("SullivanSave2.sav")
    file = file_text_open_write("SullivanSave2.sav")
    file_text_write_real(file, 28)
    file_text_close(file)
    instance_create_layer(x, y, "Instances_Pause", objdrawGUI)
    instance_destroy()
}
