if (mouse_check_button_pressed(mb_left)) {
    if (mouse_x > btn_x - btn_width/2 && mouse_x < btn_x + btn_width/2 &&
        mouse_y > btn_y - btn_height/2 && mouse_y < btn_y + btn_height/2) {
        room_goto(rm_menu);
    }
}