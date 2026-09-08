if (mouse_check_button_pressed(mb_left)) {
    var _mx = mouse_x;
    var _my = mouse_y;

    // Botón Jugar
    if (_mx > btn_jugar_x - btn_width/2 && _mx < btn_jugar_x + btn_width/2 &&
        _my > btn_jugar_y - btn_height/2 && _my < btn_jugar_y + btn_height/2) {
        room_goto(rm_boss);
    }

    // Botón Tutorial
    if (_mx > btn_tutorial_x - btn_width/2 && _mx < btn_tutorial_x + btn_width/2 &&
        _my > btn_tutorial_y - btn_height/2 && _my < btn_tutorial_y + btn_height/2) {
        room_goto(rm_tutorial);
    }

    // Botón Créditos
    if (_mx > btn_creditos_x - btn_width/2 && _mx < btn_creditos_x + btn_width/2 &&
        _my > btn_creditos_y - btn_height/2 && _my < btn_creditos_y + btn_height/2) {
        room_goto(rm_credits);
    }
}