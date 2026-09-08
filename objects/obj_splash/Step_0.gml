// Pasa al menú si presionas cualquier tecla, o automáticamente tras unos segundos
if (keyboard_check_pressed(vk_anykey)) {
    audio_stop_sound(snd_intro);
    room_goto(rm_menu);
}